import 'package:flutter/material.dart';
import 'package:payment_portal/core/config/app_config.dart';

class PromoBanner extends StatelessWidget {
  const PromoBanner({super.key, required this.message});

  final String message;

  @override
  Widget build(BuildContext context) {
    final config = AppBrandConfig.of(context);
    final theme = Theme.of(context);

    return AnimatedContainer(
      duration: config.transitionDuration,
      curve: config.transitionCurve,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [theme.colorScheme.secondary, theme.colorScheme.primary],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: config.cardRadius,
      ),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
      child: Row(
        children: [
          const SizedBox(width: 4),
          Expanded(
            child: Text(
              message,
              style: theme.textTheme.bodyMedium?.copyWith(
                color: Colors.white,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
