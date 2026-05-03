import 'package:flutter/material.dart';
import 'package:payment_portal/core/config/app_config.dart';
import 'package:payment_portal/core/models/payment_model.dart';

/// Shown only when AppBrandConfig.showBillBreakdown == true (utility flavor).
/// High-density tabular layout matching the professional utility brand identity.
class BillBreakdownWidget extends StatelessWidget {
  const BillBreakdownWidget({super.key, required this.items});

  final List<BillItem> items;

  @override
  Widget build(BuildContext context) {
    final config = AppBrandConfig.of(context);
    final theme = Theme.of(context);

    return Card(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: config.contentPadding.copyWith(bottom: 8),
            child: Text(
              'BILL BREAKDOWN',
              style: theme.textTheme.labelMedium?.copyWith(
                color: theme.colorScheme.primary,
                fontWeight: FontWeight.w700,
                letterSpacing: 1.2,
              ),
            ),
          ),
          const Divider(),
          ...items.map((item) => _BillRow(item: item)),
          const Divider(),
          _TotalRow(items: items),
        ],
      ),
    );
  }
}

class _BillRow extends StatelessWidget {
  const _BillRow({required this.item});

  final BillItem item;

  @override
  Widget build(BuildContext context) {
    final config = AppBrandConfig.of(context);
    final theme = Theme.of(context);
    final isDiscount = item.isDiscount;

    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: config.contentPadding.left,
        vertical: 6,
      ),
      child: Row(
        children: [
          Expanded(
            child: Text(
              item.label,
              style: theme.textTheme.bodySmall?.copyWith(
                color: isDiscount
                    ? theme.colorScheme.tertiary
                    : theme.colorScheme.onSurface,
              ),
            ),
          ),
          Text(
            isDiscount
                ? '−\$${item.amount.toStringAsFixed(2)}'
                : '\$${item.amount.toStringAsFixed(2)}',
            style: theme.textTheme.bodySmall?.copyWith(
              fontWeight: FontWeight.w600,
              color: isDiscount
                  ? theme.colorScheme.tertiary
                  : theme.colorScheme.onSurface,
            ),
          ),
        ],
      ),
    );
  }
}

class _TotalRow extends StatelessWidget {
  const _TotalRow({required this.items});

  final List<BillItem> items;

  @override
  Widget build(BuildContext context) {
    final config = AppBrandConfig.of(context);
    final theme = Theme.of(context);

    final subtotal =
        items.where((i) => !i.isDiscount).fold(0.0, (s, i) => s + i.amount);
    final discounts =
        items.where((i) => i.isDiscount).fold(0.0, (s, i) => s + i.amount);
    final total = subtotal - discounts;

    return Padding(
      padding: config.contentPadding.copyWith(top: 10, bottom: 12),
      child: Row(
        children: [
          Expanded(
            child: Text(
              'TOTAL DUE',
              style: theme.textTheme.titleSmall?.copyWith(
                fontWeight: FontWeight.w700,
                letterSpacing: 0.8,
              ),
            ),
          ),
          Text(
            '\$${total.toStringAsFixed(2)}',
            style: theme.textTheme.titleMedium?.copyWith(
              fontWeight: FontWeight.w800,
              color: theme.colorScheme.primary,
            ),
          ),
        ],
      ),
    );
  }
}
