import 'package:freezed_annotation/freezed_annotation.dart';

part 'payment_model.freezed.dart';
part 'payment_model.g.dart';

enum PaymentStatus { pending, processing, success, failed }

@freezed
sealed class PaymentModel with _$PaymentModel {
  const factory PaymentModel({
    required String id,
    required String recipient,
    required String accountNumber,
    required double amount,
    @Default('USD') String currency,
    required DateTime timestamp,
    required List<BillItem> billItems,
    @Default(PaymentStatus.pending) PaymentStatus status,
    String? promoCode,
    @Default(0.0) double discount,
  }) = _PaymentModel;

  factory PaymentModel.fromJson(Map<String, dynamic> json) =>
      _$PaymentModelFromJson(json);
}

extension PaymentTotals on PaymentModel {
  double get subtotal =>
      billItems.where((i) => !i.isDiscount).fold(0, (s, i) => s + i.amount);
  double get total => subtotal - discount;
}

PaymentModel mockPayment() => PaymentModel(
  id: 'PAY-2024-98471',
  recipient: 'City Electric Co.',
  accountNumber: '****-4892',
  amount: 124.75,
  currency: 'USD',
  timestamp: DateTime(2024, 5, 3, 14, 32),
  billItems: const [
    BillItem(label: 'Base Service Charge', amount: 18.00),
    BillItem(label: 'Energy Usage (340 kWh × \$0.28)', amount: 95.20),
    BillItem(label: 'Fuel Adjustment Charge', amount: 8.50),
    BillItem(label: 'Distribution Fee', amount: 12.00),
    BillItem(label: 'State & Local Taxes', amount: 9.05),
    BillItem(label: 'Early Pay Discount', amount: 18.00, isDiscount: true),
  ],
  promoCode: 'SAVE10',
  discount: 18.00,
);

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

@freezed
sealed class SecurityState with _$SecurityState {
  const factory SecurityState({
    @Default(false) bool isRooted,
    @Default(false) bool isScreenRecording,
    @Default(false) bool isChecking,
    String? errorMessage,
  }) = _SecurityState;
}

@freezed
sealed class PaymentProcessingState with _$PaymentProcessingState {
  const factory PaymentProcessingState({
    required PaymentModel payment,
    @Default(0.0) double processingProgress,
    @Default(false) bool isProcessing,
    @Default(false) bool isComplete,
    String? errorMessage,
  }) = _PaymentProcessingState;
}
