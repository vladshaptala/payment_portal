import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:payment_portal/app/config/app_brand_config.dart';
import 'package:payment_portal/features/payment/application/payment_notifier.dart';
import 'package:payment_portal/features/payment/presentation/widgets/bill_breakdown.dart';
import 'package:payment_portal/features/payment/presentation/widgets/payment_summary_card.dart';
import 'package:payment_portal/features/payment/presentation/widgets/processing_progress_widget.dart';
import 'package:payment_portal/features/payment/presentation/widgets/promo_banner.dart';
import 'package:payment_portal/features/security/application/security_notifier.dart';
import 'package:payment_portal/features/security/presentation/widgets/security_scanner_widget.dart';
import 'package:payment_portal/features/security/presentation/widgets/security_warning_banner.dart';

class PaymentScreen extends ConsumerStatefulWidget {
  const PaymentScreen({super.key});

  @override
  ConsumerState<PaymentScreen> createState() => _PaymentScreenState();
}

class _PaymentScreenState extends ConsumerState<PaymentScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await ref.read(securityProvider.notifier).setWindowSecure(true);
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
    final payment = ref.watch(paymentProvider);

    return Scaffold(
      appBar: AppBar(
        title: Text(config.brandName),
        actions: [_SecurityIndicator(state: security)],
      ),
      body: SingleChildScrollView(
        padding: config.contentPadding,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Security scanning animation shown while the audit runs
            if (security.isChecking) ...[
              SecurityScanningCard(label: 'Scanning device security…'),
              config.verticalGap,
            ],

            // Warning banner shown when issues are found
            if (security.hasIssue) ...[
              SecurityWarningBanner(security: security.security!),
              config.verticalGap,
            ],

            // Promo banner — retail only (feature flag)
            if (config.showPromoBanner) ...[
              PromoBanner(message: config.promoMessage!),
              config.verticalGap,
            ],

            PaymentSummaryCard(order: payment.order, status: payment.status),
            config.verticalGap,

            // Bill breakdown — utility only (feature flag)
            if (config.showBillBreakdown) ...[
              BillBreakdownWidget(items: payment.order.billItems),
              config.verticalGap,
            ],

            if (payment.isProcessing) ...[
              ProcessingProgressWidget(progress: payment.progress),
              config.verticalGap,
            ],

            if (payment.isComplete) ...[
              PaymentSuccessWidget(paymentId: payment.order.id),
              config.verticalGap,
            ],

            if (payment.hasFailed && payment.errorMessage != null) ...[
              _ErrorBanner(message: payment.errorMessage!),
              config.verticalGap,
            ],

            if (!payment.isComplete) ...[
              _ConfirmButton(
                isProcessing: payment.isProcessing,
                isBlocked: security.hasIssue,
              ),
            ] else ...[
              OutlinedButton.icon(
                onPressed: () =>
                    ref.read(paymentProvider.notifier).reset(),
                icon: const Icon(Icons.refresh),
                label: const Text('New Payment'),
              ),
            ],

            SizedBox(height: MediaQuery.paddingOf(context).bottom + 16),
          ],
        ),
      ),
    );
  }
}

// ---------------------------------------------------------------------------
// Private sub-widgets
// ---------------------------------------------------------------------------

class _SecurityIndicator extends StatelessWidget {
  const _SecurityIndicator({required this.state});

  final SecurityCheckState state;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    if (state.isChecking) {
      return const Padding(
        padding: EdgeInsets.all(14),
        child: SizedBox(
          width: 18,
          height: 18,
          child: CircularProgressIndicator(strokeWidth: 2),
        ),
      );
    }

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      child: Icon(
        state.hasIssue ? Icons.gpp_bad : Icons.lock,
        color: state.hasIssue
            ? theme.colorScheme.error
            : theme.colorScheme.primary,
        size: 22,
      ),
    );
  }
}

class _ConfirmButton extends ConsumerWidget {
  const _ConfirmButton({required this.isProcessing, required this.isBlocked});

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
                .read(paymentProvider.notifier)
                .confirmPayment(),
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

