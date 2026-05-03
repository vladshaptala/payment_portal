import 'package:flutter/material.dart';
import 'package:payment_portal/app/config/app_brand_config.dart';
import 'package:payment_portal/features/security_guard/presentation/widgets/security_scanner_widget.dart';

class ProcessingProgressWidget extends StatelessWidget {
  const ProcessingProgressWidget({super.key, required this.progress});

  final double progress;

  @override
  Widget build(BuildContext context) {
    final config = AppBrandConfig.of(context);
    final theme = Theme.of(context);
    final percent = (progress * 100).round();

    return AnimatedContainer(
      duration: config.transitionDuration,
      curve: config.transitionCurve,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: theme.colorScheme.surfaceContainerHighest,
        borderRadius: config.cardRadius,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              SecurityScannerWidget(
                size: 26,
                primaryColor: theme.colorScheme.primary,
              ),
              const SizedBox(width: 10),
              Expanded(
                child: Text(
                  _stepLabel(progress),
                  style: theme.textTheme.bodySmall?.copyWith(
                    fontWeight: FontWeight.w600,
                    color: theme.colorScheme.onSurfaceVariant,
                  ),
                ),
              ),
              Text(
                '$percent %',
                style: theme.textTheme.labelMedium?.copyWith(
                  fontWeight: FontWeight.w700,
                  color: theme.colorScheme.primary,
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),
          ClipRRect(
            borderRadius: BorderRadius.circular(
              config.useHighDensityLayout ? 2 : 6,
            ),
            child: LinearProgressIndicator(
              value: progress,
              minHeight: config.useHighDensityLayout ? 4 : 8,
              backgroundColor:
                  theme.colorScheme.primary.withValues(alpha: 0.15),
              valueColor: AlwaysStoppedAnimation(theme.colorScheme.primary),
            ),
          ),
        ],
      ),
    );
  }

  String _stepLabel(double p) {
    if (p < 0.3) return 'Encrypting payment data…';
    if (p < 0.6) return 'Authorising transaction…';
    if (p < 0.9) return 'Confirming with provider…';
    return 'Finalising…';
  }
}

class PaymentSuccessWidget extends StatelessWidget {
  const PaymentSuccessWidget({super.key, required this.paymentId});

  final String paymentId;

  @override
  Widget build(BuildContext context) {
    final config = AppBrandConfig.of(context);
    final theme = Theme.of(context);

    return AnimatedContainer(
      duration: config.transitionDuration,
      curve: config.transitionCurve,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.green.shade50,
        borderRadius: config.cardRadius,
        border: Border.all(color: Colors.green.shade200),
      ),
      child: Row(
        children: [
          Icon(Icons.check_circle_rounded,
              color: Colors.green.shade600, size: 32),
          const SizedBox(width: 14),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Payment Confirmed',
                  style: theme.textTheme.titleSmall?.copyWith(
                    fontWeight: FontWeight.w700,
                    color: Colors.green.shade800,
                  ),
                ),
                const SizedBox(height: 2),
                Text(
                  'Ref: $paymentId',
                  style: theme.textTheme.bodySmall?.copyWith(
                    color: Colors.green.shade700,
                    fontFamily: 'monospace',
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
