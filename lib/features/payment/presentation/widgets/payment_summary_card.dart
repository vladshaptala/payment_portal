import 'package:flutter/material.dart';
import 'package:payment_portal/app/config/app_brand_config.dart';
import 'package:payment_portal/features/payment/domain/payment.dart';

class PaymentSummaryCard extends StatelessWidget {
  const PaymentSummaryCard({
    super.key,
    required this.order,
    required this.status,
  });

  final PaymentOrder order;
  final PaymentStatus status;

  @override
  Widget build(BuildContext context) {
    final config = AppBrandConfig.of(context);
    final theme = Theme.of(context);

    return Card(
      margin: EdgeInsets.zero,
      child: Padding(
        padding: config.contentPadding,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(
                  Icons.receipt_long,
                  color: theme.colorScheme.primary,
                  size: 20,
                ),
                const SizedBox(width: 8),
                Text(
                  'Payment Summary',
                  style: theme.textTheme.titleSmall?.copyWith(
                    fontWeight: FontWeight.w700,
                    color: theme.colorScheme.primary,
                  ),
                ),
                const Spacer(),
                _StatusChip(status: status),
              ],
            ),
            config.verticalGap,
            const Divider(),
            config.verticalGap,
            _SummaryRow(label: 'To', value: order.recipient, isBold: true),
            _SummaryRow(label: 'Account', value: order.accountNumber),
            _SummaryRow(label: 'Reference', value: order.id, isMonospace: true),
            _SummaryRow(label: 'Date', value: _formatDate(order.timestamp)),
            if (order.promoCode != null)
              _SummaryRow(
                label: 'Promo',
                value: order.promoCode!,
                valueColor: theme.colorScheme.tertiary,
              ),
            config.verticalGap,
            const Divider(),
            config.verticalGap,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Total',
                  style: theme.textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.w700,
                  ),
                ),
                Text(
                  '${order.currency} ${order.total.toStringAsFixed(2)}',
                  style: theme.textTheme.headlineSmall?.copyWith(
                    fontWeight: FontWeight.w800,
                    color: theme.colorScheme.primary,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  String _formatDate(DateTime dt) =>
      '${dt.day.toString().padLeft(2, '0')}/'
      '${dt.month.toString().padLeft(2, '0')}/'
      '${dt.year}  '
      '${dt.hour.toString().padLeft(2, '0')}:'
      '${dt.minute.toString().padLeft(2, '0')}';
}

class _SummaryRow extends StatelessWidget {
  const _SummaryRow({
    required this.label,
    required this.value,
    this.isBold = false,
    this.isMonospace = false,
    this.valueColor,
  });

  final String label;
  final String value;
  final bool isBold;
  final bool isMonospace;
  final Color? valueColor;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final config = AppBrandConfig.of(context);

    return Padding(
      padding: EdgeInsets.symmetric(
        vertical: config.useHighDensityLayout ? 3 : 5,
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 80,
            child: Text(
              label,
              style: theme.textTheme.bodySmall?.copyWith(
                color: theme.colorScheme.onSurfaceVariant,
              ),
            ),
          ),
          Expanded(
            child: Text(
              value,
              style: theme.textTheme.bodySmall?.copyWith(
                fontWeight: isBold ? FontWeight.w600 : FontWeight.w400,
                fontFamily: isMonospace ? 'monospace' : null,
                color: valueColor,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _StatusChip extends StatelessWidget {
  const _StatusChip({required this.status});

  final PaymentStatus status;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final (label, color) = switch (status) {
      PaymentStatus.pending => ('Pending', theme.colorScheme.secondary),
      PaymentStatus.processing => ('Processing', theme.colorScheme.primary),
      PaymentStatus.success => ('Confirmed', Colors.green.shade600),
      PaymentStatus.failed => ('Failed', theme.colorScheme.error),
    };

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
      decoration: BoxDecoration(
        color: color.withValues(alpha: 0.12),
        borderRadius: BorderRadius.circular(4),
        border: Border.all(color: color.withValues(alpha: 0.4)),
      ),
      child: Text(
        label,
        style: theme.textTheme.labelSmall?.copyWith(
          color: color,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}
