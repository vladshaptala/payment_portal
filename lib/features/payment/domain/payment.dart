import 'package:freezed_annotation/freezed_annotation.dart';

part 'payment.freezed.dart';
part 'payment.g.dart';

enum PaymentStatus { pending, processing, success, failed }

@freezed
sealed class PaymentOrder with _$PaymentOrder {
  const factory PaymentOrder({
    required String id,
    required String recipient,
    required String accountNumber,
    required double amount,
    @Default('USD') String currency,
    required DateTime timestamp,
    required List<BillItem> billItems,
    String? promoCode,
    @Default(0.0) double discount,
  }) = _PaymentOrder;

  factory PaymentOrder.fromJson(Map<String, dynamic> json) =>
      _$PaymentOrderFromJson(json);
}

extension PaymentOrderTotals on PaymentOrder {
  double get subtotal =>
      billItems.where((i) => !i.isDiscount).fold(0.0, (s, i) => s + i.amount);
  double get total => subtotal - discount;
}

@freezed
sealed class BillItem with _$BillItem {
  const factory BillItem({
    required String label,
    required double amount,
    @Default(false) bool isDiscount,
  }) = _BillItem;

  factory BillItem.fromJson(Map<String, dynamic> json) =>
      _$BillItemFromJson(json);
}
