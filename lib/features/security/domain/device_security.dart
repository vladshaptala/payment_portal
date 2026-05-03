import 'package:freezed_annotation/freezed_annotation.dart';

part 'device_security.freezed.dart';

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
