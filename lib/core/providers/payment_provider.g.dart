// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'payment_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(currentPayment)
final currentPaymentProvider = CurrentPaymentProvider._();

final class CurrentPaymentProvider
    extends $FunctionalProvider<PaymentModel, PaymentModel, PaymentModel>
    with $Provider<PaymentModel> {
  CurrentPaymentProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'currentPaymentProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$currentPaymentHash();

  @$internal
  @override
  $ProviderElement<PaymentModel> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  PaymentModel create(Ref ref) {
    return currentPayment(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(PaymentModel value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<PaymentModel>(value),
    );
  }
}

String _$currentPaymentHash() => r'76e96106413f63e24209e71353d7c9b8666287dd';

@ProviderFor(PaymentProcessingNotifier)
final paymentProcessingProvider = PaymentProcessingNotifierProvider._();

final class PaymentProcessingNotifierProvider
    extends
        $NotifierProvider<PaymentProcessingNotifier, PaymentProcessingState> {
  PaymentProcessingNotifierProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'paymentProcessingProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$paymentProcessingNotifierHash();

  @$internal
  @override
  PaymentProcessingNotifier create() => PaymentProcessingNotifier();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(PaymentProcessingState value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<PaymentProcessingState>(value),
    );
  }
}

String _$paymentProcessingNotifierHash() =>
    r'c337f2e5b13bc0a31171596663d2b509cff6ef55';

abstract class _$PaymentProcessingNotifier
    extends $Notifier<PaymentProcessingState> {
  PaymentProcessingState build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref =
        this.ref as $Ref<PaymentProcessingState, PaymentProcessingState>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<PaymentProcessingState, PaymentProcessingState>,
              PaymentProcessingState,
              Object?,
              Object?
            >;
    element.handleCreate(ref, build);
  }
}
