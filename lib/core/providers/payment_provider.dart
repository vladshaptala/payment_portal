import 'package:flutter/services.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:payment_portal/core/models/payment_model.dart';

part 'payment_provider.g.dart';

const _serviceChannel = MethodChannel(
  'com.example.payment_portal/payment_service',
);

@riverpod
PaymentModel currentPayment(Ref ref) => mockPayment();

@riverpod
class PaymentProcessingNotifier extends _$PaymentProcessingNotifier {
  @override
  PaymentProcessingState build() {
    return PaymentProcessingState(payment: ref.read(currentPaymentProvider));
  }

  Future<void> startProcessing() async {
    if (state.isProcessing || state.isComplete) return;

    state = state.copyWith(
      isProcessing: true,
      processingProgress: 0.0,
      errorMessage: null,
      payment: state.payment.copyWith(status: PaymentStatus.processing),
    );

    try {
      await _serviceChannel.invokeMethod<void>('startPaymentService', {
        'paymentId': state.payment.id,
        'amount': state.payment.amount,
      });

      for (int step = 1; step <= 10; step++) {
        await Future<void>.delayed(const Duration(milliseconds: 500));
        if (!ref.mounted) return;

        final progress = step / 10.0;
        state = state.copyWith(processingProgress: progress);

        await _serviceChannel.invokeMethod<void>('updateProgress', {
          'progress': progress,
          'paymentId': state.payment.id,
          'amount': state.payment.amount,
        });
      }

      if (!ref.mounted) return;
      state = state.copyWith(
        isProcessing: false,
        isComplete: true,
        payment: state.payment.copyWith(status: PaymentStatus.success),
      );

      await _serviceChannel.invokeMethod<void>('stopPaymentService');
    } on PlatformException catch (e) {
      if (!ref.mounted) return;
      state = state.copyWith(
        isProcessing: false,
        errorMessage: e.message ?? 'Payment processing failed',
        payment: state.payment.copyWith(status: PaymentStatus.failed),
      );
    } on MissingPluginException {
      if (!ref.mounted) return;
      state = state.copyWith(
        isProcessing: false,
        isComplete: true,
        payment: state.payment.copyWith(status: PaymentStatus.success),
      );
    }
  }

  void reset() {
    state = PaymentProcessingState(payment: mockPayment());
  }
}
