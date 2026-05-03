import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:payment_portal/features/security/data/native_security_repository.dart';
import 'package:payment_portal/features/security/data/security_repository.dart';
import 'package:payment_portal/features/security/domain/device_security.dart';

part 'security_notifier.freezed.dart';
part 'security_notifier.g.dart';

@freezed
sealed class SecurityCheckState with _$SecurityCheckState {
  const factory SecurityCheckState({
    DeviceSecurity? security,
    @Default(false) bool isChecking,
    String? errorMessage,
  }) = _SecurityCheckState;
}

extension SecurityCheckStateX on SecurityCheckState {
  bool get hasIssue => security?.hasIssue ?? false;
}

@riverpod
SecurityRepository securityRepository(Ref ref) =>
    const NativeSecurityRepository();

@riverpod
class SecurityNotifier extends _$SecurityNotifier {
  @override
  SecurityCheckState build() => const SecurityCheckState();

  Future<void> checkSecurity() async {
    if (state.isChecking) return;
    state = state.copyWith(isChecking: true, errorMessage: null);
    try {
      final result = await ref
          .read(securityRepositoryProvider)
          .checkDeviceSecurity();
      if (!ref.mounted) return;
      state = SecurityCheckState(security: result);
    } on Exception catch (e) {
      if (!ref.mounted) return;
      state = SecurityCheckState(errorMessage: e.toString());
    }
  }

  Future<void> setWindowSecure(bool secure) =>
      ref.read(securityRepositoryProvider).setWindowSecure(secure);
}
