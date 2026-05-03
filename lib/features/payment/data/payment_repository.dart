import 'package:payment_portal/features/payment/domain/payment.dart';

abstract interface class PaymentRepository {
  PaymentOrder getPendingPayment();

  /// Signals the native payment service to begin.
  Future<void> startPaymentService({
    required String paymentId,
    required double amount,
  });

  /// Reports intermediate processing progress to the native service.
  Future<void> reportProgress({
    required String paymentId,
    required double amount,
    required double progress,
  });

  /// Signals the native payment service to stop.
  Future<void> stopPaymentService();
}
