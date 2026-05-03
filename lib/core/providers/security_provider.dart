import 'package:flutter/services.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:payment_portal/core/models/payment_model.dart';

part 'security_provider.g.dart';

const _securityChannel = MethodChannel('com.example.payment_portal/security');
const _windowChannel = MethodChannel('com.example.payment_portal/window');

@riverpod
class SecurityNotifier extends _$SecurityNotifier {
  @override
  SecurityState build() => const SecurityState();

  Future<void> checkSecurity() async {
    if (state.isChecking) return;
    state = state.copyWith(isChecking: true, errorMessage: null);
    try {
      final result = await _securityChannel.invokeMethod<Map<Object?, Object?>>(
        'checkSecurity',
      );
      state = state.copyWith(
        isRooted: result?['isRooted'] as bool? ?? false,
        isScreenRecording: result?['isScreenRecording'] as bool? ?? false,
        isChecking: false,
      );
    } on PlatformException catch (e) {
      // Non-Android platforms return notImplemented — treat as safe
      state = state.copyWith(
        isChecking: false,
        errorMessage: e.code == 'notImplemented' ? null : e.message,
      );
    } on MissingPluginException {
      state = state.copyWith(isChecking: false);
    }
  }

  Future<void> setWindowSecure(bool secure) async {
    try {
      await _windowChannel.invokeMethod<void>('setSecure', {'secure': secure});
    } on PlatformException {
      // Silently ignore on non-Android platforms
    } on MissingPluginException {
      // No channel registered (e.g. in tests)
    }
  }
}
