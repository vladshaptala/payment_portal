import 'package:flutter/services.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:payment_portal/features/payment/data/payment_repository_impl.dart';
import 'package:payment_portal/features/payment/data/payment_repository.dart';
import 'package:payment_portal/features/payment/domain/payment.dart';

part 'payment_notifier.freezed.dart';
part 'payment_notifier.g.dart';

@freezed
sealed class PaymentState with _$PaymentState {
  const factory PaymentState({
    required PaymentOrder order,
    @Default(PaymentStatus.pending) PaymentStatus status,
    @Default(0.0) double progress,
    String? errorMessage,
  }) = _PaymentState;
}

extension PaymentStatusExt on PaymentState {
  bool get isProcessing => status == PaymentStatus.processing;
  bool get isComplete => status == PaymentStatus.success;
  bool get hasFailed => status == PaymentStatus.failed;
}

@riverpod
PaymentRepository paymentRepository(Ref ref) => const PaymentRepositoryImpl();

@riverpod
class PaymentNotifier extends _$PaymentNotifier {
  @override
  PaymentState build() {
    final order = ref.read(paymentRepositoryProvider).getPendingPayment();
    return PaymentState(order: order);
  }

  Future<void> confirmPayment() async {
    if (state.isProcessing || state.isComplete) return;

    state = state.copyWith(
      status: PaymentStatus.processing,
      progress: 0.0,
      errorMessage: null,
    );

    final repo = ref.read(paymentRepositoryProvider);

    try {
      await repo.startPaymentService(
        paymentId: state.order.id,
        amount: state.order.amount,
      );

      for (int step = 1; step <= 10; step++) {
        await Future<void>.delayed(const Duration(milliseconds: 500));
        if (!ref.mounted) return;

        final progress = step / 10.0;
        state = state.copyWith(progress: progress);

        await repo.reportProgress(
          paymentId: state.order.id,
          amount: state.order.amount,
          progress: progress,
        );
      }

      if (!ref.mounted) return;
      state = state.copyWith(status: PaymentStatus.success, progress: 1.0);
      await repo.stopPaymentService();
    } on PlatformException catch (e) {
      if (!ref.mounted) return;
      state = state.copyWith(
        status: PaymentStatus.failed,
        errorMessage: e.message ?? 'Payment processing failed',
      );
    }
  }

  void reset() {
    final order = ref.read(paymentRepositoryProvider).getPendingPayment();
    state = PaymentState(order: order);
  }
}
