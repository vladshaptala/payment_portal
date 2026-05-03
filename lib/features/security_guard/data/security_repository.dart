import 'package:payment_portal/features/security_guard/domain/device_security.dart';

/// Contract for device security checks and window hardening.
abstract interface class SecurityRepository {
  /// Runs a full device audit and returns the findings.
  Future<DeviceSecurity> checkDeviceSecurity();

  /// Enables or disables FLAG_SECURE on the current window.
  Future<void> setWindowSecure(bool secure);
}
