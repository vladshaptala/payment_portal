import 'package:flutter/services.dart';
import 'package:payment_portal/features/security_guard/data/security_repository.dart';
import 'package:payment_portal/features/security_guard/domain/device_security.dart';

const _securityChannel = MethodChannel('com.example.payment_portal/security');
const _windowChannel = MethodChannel('com.example.payment_portal/window');

class NativeSecurityRepository implements SecurityRepository {
  const NativeSecurityRepository();

  @override
  Future<DeviceSecurity> checkDeviceSecurity() async {
    try {
      final result = await _securityChannel.invokeMethod<Map<Object?, Object?>>(
        'checkSecurity',
      );
      return DeviceSecurity(
        isRooted: result?['isRooted'] as bool? ?? false,
        isScreenRecording: result?['isScreenRecording'] as bool? ?? false,
      );
    } on PlatformException catch (e) {
      if (e.code == 'notImplemented') return const DeviceSecurity();
      rethrow;
    } on MissingPluginException {
      // Non-Android platform: assume device is clean.
      return const DeviceSecurity();
    }
  }

  @override
  Future<void> setWindowSecure(bool secure) async {
    try {
      await _windowChannel.invokeMethod<void>('setSecure', {'secure': secure});
    } on PlatformException {
      // Silently ignore — FLAG_SECURE is Android-only.
    } on MissingPluginException {
      // No channel registered on this platform.
    }
  }
}
