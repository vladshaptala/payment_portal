// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'security_notifier.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning
/// Override in tests to inject a fake [SecurityRepository].

@ProviderFor(securityRepository)
final securityRepositoryProvider = SecurityRepositoryProvider._();

/// Override in tests to inject a fake [SecurityRepository].

final class SecurityRepositoryProvider
    extends
        $FunctionalProvider<
          SecurityRepository,
          SecurityRepository,
          SecurityRepository
        >
    with $Provider<SecurityRepository> {
  /// Override in tests to inject a fake [SecurityRepository].
  SecurityRepositoryProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'securityRepositoryProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$securityRepositoryHash();

  @$internal
  @override
  $ProviderElement<SecurityRepository> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  SecurityRepository create(Ref ref) {
    return securityRepository(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(SecurityRepository value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<SecurityRepository>(value),
    );
  }
}

String _$securityRepositoryHash() =>
    r'2efe3765419eda4a31a67474b98c6f9f99e11898';

@ProviderFor(SecurityNotifier)
final securityProvider = SecurityNotifierProvider._();

final class SecurityNotifierProvider
    extends $NotifierProvider<SecurityNotifier, SecurityCheckState> {
  SecurityNotifierProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'securityProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$securityNotifierHash();

  @$internal
  @override
  SecurityNotifier create() => SecurityNotifier();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(SecurityCheckState value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<SecurityCheckState>(value),
    );
  }
}

String _$securityNotifierHash() => r'9fda4289807f3095d1c822c6e1f31caa25d281f2';

abstract class _$SecurityNotifier extends $Notifier<SecurityCheckState> {
  SecurityCheckState build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref = this.ref as $Ref<SecurityCheckState, SecurityCheckState>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<SecurityCheckState, SecurityCheckState>,
              SecurityCheckState,
              Object?,
              Object?
            >;
    element.handleCreate(ref, build);
  }
}
