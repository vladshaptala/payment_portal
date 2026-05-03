import 'package:flutter/material.dart';
import 'package:payment_portal/features/security/domain/device_security.dart';

/// Shown when [DeviceSecurity.hasIssue] is true.
/// Brand-agnostic — security warnings are the same across all brands.
class SecurityWarningBanner extends StatelessWidget {
  const SecurityWarningBanner({super.key, required this.security});

  final DeviceSecurity security;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final messages = [
      if (security.isRooted)
        'Rooted device detected — payment may be blocked by your bank.',
      if (security.isScreenRecording)
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
