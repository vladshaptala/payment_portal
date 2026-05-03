import 'package:flutter/material.dart';
import 'package:payment_portal/core/models/payment_model.dart';

/// Shown when the device is rooted or screen recording is active.
/// Independent of brand — security warnings are always the same.
class SecurityWarningBanner extends StatelessWidget {
  const SecurityWarningBanner({super.key, required this.securityState});

  final SecurityState securityState;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final messages = [
      if (securityState.isRooted)
        'Rooted device detected — payment may be blocked by your bank.',
      if (securityState.isScreenRecording)
        'Screen recording detected — hide your payment details.',
    ];

    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: theme.colorScheme.errorContainer,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(
          color: theme.colorScheme.error.withValues(alpha: 0.4),
        ),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(Icons.warning_amber_rounded,
              color: theme.colorScheme.error, size: 20),
          const SizedBox(width: 10),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Security Warning',
                  style: theme.textTheme.labelMedium?.copyWith(
                    color: theme.colorScheme.onErrorContainer,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                const SizedBox(height: 4),
                ...messages.map(
                  (msg) => Text(
                    msg,
                    style: theme.textTheme.bodySmall?.copyWith(
                      color: theme.colorScheme.onErrorContainer,
                    ),
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
