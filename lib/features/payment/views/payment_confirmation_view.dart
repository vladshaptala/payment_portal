import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:payment_portal/core/config/app_config.dart';
import 'package:payment_portal/core/models/payment_model.dart';
import 'package:payment_portal/core/providers/payment_provider.dart';
import 'package:payment_portal/core/providers/security_provider.dart';
import 'package:payment_portal/features/payment/widgets/bill_breakdown.dart';
import 'package:payment_portal/features/payment/widgets/payment_summary_card.dart';
import 'package:payment_portal/features/payment/widgets/processing_progress_widget.dart';
import 'package:payment_portal/features/payment/widgets/promo_banner.dart';
import 'package:payment_portal/features/payment/widgets/security_scanner_widget.dart';
import 'package:payment_portal/features/payment/widgets/security_warning_banner.dart';

class PaymentConfirmationScreen extends ConsumerStatefulWidget {
  const PaymentConfirmationScreen({super.key});

  @override
  ConsumerState<PaymentConfirmationScreen> createState() =>
      _PaymentConfirmationScreenState();
}

class _PaymentConfirmationScreenState
    extends ConsumerState<PaymentConfirmationScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      // Enable FLAG_SECURE as soon as the payment screen is on-screen
      await ref.read(securityProvider.notifier).setWindowSecure(true);
      // Run the device security check
      await ref.read(securityProvider.notifier).checkSecurity();
    });
  }

  @override
  void dispose() {
    ref.read(securityProvider.notifier).setWindowSecure(false);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final config = AppBrandConfig.of(context);
    final security = ref.watch(securityProvider);
    final processing = ref.watch(paymentProcessingProvider);
    final hasSecurityIssue = security.isRooted || security.isScreenRecording;

    return Scaffold(
      appBar: AppBar(
        title: Text(config.brandName),
        actions: [_SecurityIndicator(security: security)],
      ),
      body: SingleChildScrollView(
        padding: config.contentPadding,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            if (security.isChecking) ...[
              SecurityScanningCard(label: 'Scanning device security…'),
              config.verticalGap,
            ],

            if (hasSecurityIssue) ...[
              SecurityWarningBanner(securityState: security),
              config.verticalGap,
            ],

            // ── Brand-specific promo banner (retail only via feature flag) ──
            if (config.showPromoBanner) ...[
              PromoBanner(message: config.promoMessage!),
              config.verticalGap,
            ],

            // ── Shared payment summary ───────────────────────────────────────
            PaymentSummaryCard(payment: processing.payment),
            config.verticalGap,

            // ── Brand-specific bill breakdown (utility only via feature flag) ─
            if (config.showBillBreakdown) ...[
              BillBreakdownWidget(items: processing.payment.billItems),
              config.verticalGap,
            ],

            // ── Processing progress ──────────────────────────────────────────
            if (processing.isProcessing) ...[
              ProcessingProgressWidget(progress: processing.processingProgress),
              config.verticalGap,
            ],

            // ── Success state ────────────────────────────────────────────────
            if (processing.isComplete) ...[
              PaymentSuccessWidget(paymentId: processing.payment.id),
              config.verticalGap,
            ],

            // ── Error state ──────────────────────────────────────────────────
            if (processing.errorMessage != null) ...[
              _ErrorBanner(message: processing.errorMessage!),
              config.verticalGap,
            ],

            // ── CTA buttons ──────────────────────────────────────────────────
            if (!processing.isComplete) ...[
              _ConfirmPaymentButton(
                isProcessing: processing.isProcessing,
                isBlocked: hasSecurityIssue,
              ),
            ] else ...[
              OutlinedButton.icon(
                onPressed: () =>
                    ref.read(paymentProcessingProvider.notifier).reset(),
                icon: const Icon(Icons.refresh),
                label: const Text('New Payment'),
              ),
            ],

            // Bottom safe area padding
            SizedBox(height: MediaQuery.paddingOf(context).bottom + 16),
          ],
        ),
      ),
    );
  }
}

class _SecurityIndicator extends StatelessWidget {
  const _SecurityIndicator({required this.security});

  final SecurityState security;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    if (security.isChecking) {
      return const Padding(
        padding: EdgeInsets.all(14),
        child: SizedBox(
          width: 18,
          height: 18,
          child: CircularProgressIndicator(strokeWidth: 2),
        ),
      );
    }

    final hasIssue = security.isRooted || security.isScreenRecording;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      child: Icon(
        hasIssue ? Icons.gpp_bad : Icons.lock,
        color: hasIssue ? theme.colorScheme.error : theme.colorScheme.primary,
        size: 22,
      ),
    );
  }
}

class _ConfirmPaymentButton extends ConsumerWidget {
  const _ConfirmPaymentButton({
    required this.isProcessing,
    required this.isBlocked,
  });

  final bool isProcessing;
  final bool isBlocked;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final config = AppBrandConfig.of(context);
    final isDisabled = isBlocked || isProcessing;

    return AnimatedSize(
      duration: config.transitionDuration,
      curve: config.transitionCurve,
      child: FilledButton(
        onPressed: isDisabled
            ? null
            : () => ref
                  .read(paymentProcessingProvider.notifier)
                  .startProcessing(),
        child: isProcessing
            ? const SizedBox(
                width: 20,
                height: 20,
                child: CircularProgressIndicator(
                  strokeWidth: 2.5,
                  color: Colors.white,
                ),
              )
            : Text(isBlocked ? 'PAYMENT BLOCKED' : 'CONFIRM PAYMENT'),
      ),
    );
  }
}

class _ErrorBanner extends StatelessWidget {
  const _ErrorBanner({required this.message});

  final String message;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: theme.colorScheme.errorContainer,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        children: [
          Icon(Icons.error_outline, color: theme.colorScheme.error, size: 20),
          const SizedBox(width: 8),
          Expanded(
            child: Text(
              message,
              style: theme.textTheme.bodySmall?.copyWith(
                color: theme.colorScheme.onErrorContainer,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
