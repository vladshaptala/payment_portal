import 'package:freezed_annotation/freezed_annotation.dart';

part 'device_security.freezed.dart';

/// Pure domain result of a device security audit.
/// Contains only what was found — no UI state (isChecking, errors).
@freezed
sealed class DeviceSecurity with _$DeviceSecurity {
  const factory DeviceSecurity({
    @Default(false) bool isRooted,
    @Default(false) bool isScreenRecording,
  }) = _DeviceSecurity;
}

extension DeviceSecurityX on DeviceSecurity {
  bool get hasIssue => isRooted || isScreenRecording;
}
