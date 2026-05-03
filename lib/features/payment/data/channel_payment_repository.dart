import 'package:flutter/services.dart';
import 'package:payment_portal/features/payment/data/payment_repository.dart';
import 'package:payment_portal/features/payment/domain/payment.dart';

const _channel = MethodChannel('com.example.payment_portal/payment_service');

class ChannelPaymentRepository implements PaymentRepository {
  const ChannelPaymentRepository();

  @override
  PaymentOrder getPendingPayment() => _kMockOrder;

  @override
  Future<void> startPaymentService({
    required String paymentId,
    required double amount,
  }) async {
    try {
      await _channel.invokeMethod<void>('startPaymentService', {
        'paymentId': paymentId,
        'amount': amount,
      });
    } on MissingPluginException {
      // Non-Android: proceed in mock mode.
    }
  }

  @override
  Future<void> reportProgress({
    required String paymentId,
    required double amount,
    required double progress,
  }) async {
    try {
      await _channel.invokeMethod<void>('updateProgress', {
        'progress': progress,
        'paymentId': paymentId,
        'amount': amount,
      });
    } on MissingPluginException {
      // Non-Android: no-op.
    }
  }

  @override
  Future<void> stopPaymentService() async {
    try {
      await _channel.invokeMethod<void>('stopPaymentService');
    } on MissingPluginException {
      // Non-Android: no-op.
    }
  }
}

final _kMockOrder = PaymentOrder(
  id: 'PAY-2026-98471',
  recipient: 'City Electric Co.',
  accountNumber: '****-4892',
  amount: 124.75,
  currency: 'USD',
  timestamp: DateTime(2026, 5, 3, 14, 32),
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
