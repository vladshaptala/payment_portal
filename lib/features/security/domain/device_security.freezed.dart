// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'device_security.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$DeviceSecurity {

 bool get isRooted; bool get isScreenRecording;
/// Create a copy of DeviceSecurity
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$DeviceSecurityCopyWith<DeviceSecurity> get copyWith => _$DeviceSecurityCopyWithImpl<DeviceSecurity>(this as DeviceSecurity, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DeviceSecurity&&(identical(other.isRooted, isRooted) || other.isRooted == isRooted)&&(identical(other.isScreenRecording, isScreenRecording) || other.isScreenRecording == isScreenRecording));
}


@override
int get hashCode => Object.hash(runtimeType,isRooted,isScreenRecording);

@override
String toString() {
  return 'DeviceSecurity(isRooted: $isRooted, isScreenRecording: $isScreenRecording)';
}


}

/// @nodoc
abstract mixin class $DeviceSecurityCopyWith<$Res>  {
  factory $DeviceSecurityCopyWith(DeviceSecurity value, $Res Function(DeviceSecurity) _then) = _$DeviceSecurityCopyWithImpl;
@useResult
$Res call({
 bool isRooted, bool isScreenRecording
});




}
/// @nodoc
class _$DeviceSecurityCopyWithImpl<$Res>
    implements $DeviceSecurityCopyWith<$Res> {
  _$DeviceSecurityCopyWithImpl(this._self, this._then);

  final DeviceSecurity _self;
  final $Res Function(DeviceSecurity) _then;

/// Create a copy of DeviceSecurity
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? isRooted = null,Object? isScreenRecording = null,}) {
  return _then(_self.copyWith(
isRooted: null == isRooted ? _self.isRooted : isRooted // ignore: cast_nullable_to_non_nullable
as bool,isScreenRecording: null == isScreenRecording ? _self.isScreenRecording : isScreenRecording // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

}


/// Adds pattern-matching-related methods to [DeviceSecurity].
extension DeviceSecurityPatterns on DeviceSecurity {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _DeviceSecurity value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _DeviceSecurity() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _DeviceSecurity value)  $default,){
final _that = this;
switch (_that) {
case _DeviceSecurity():
return $default(_that);}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _DeviceSecurity value)?  $default,){
final _that = this;
switch (_that) {
case _DeviceSecurity() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( bool isRooted,  bool isScreenRecording)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _DeviceSecurity() when $default != null:
return $default(_that.isRooted,_that.isScreenRecording);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( bool isRooted,  bool isScreenRecording)  $default,) {final _that = this;
switch (_that) {
case _DeviceSecurity():
return $default(_that.isRooted,_that.isScreenRecording);}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( bool isRooted,  bool isScreenRecording)?  $default,) {final _that = this;
switch (_that) {
case _DeviceSecurity() when $default != null:
return $default(_that.isRooted,_that.isScreenRecording);case _:
  return null;

}
}

}

/// @nodoc


class _DeviceSecurity implements DeviceSecurity {
  const _DeviceSecurity({this.isRooted = false, this.isScreenRecording = false});
  

@override@JsonKey() final  bool isRooted;
@override@JsonKey() final  bool isScreenRecording;

/// Create a copy of DeviceSecurity
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$DeviceSecurityCopyWith<_DeviceSecurity> get copyWith => __$DeviceSecurityCopyWithImpl<_DeviceSecurity>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _DeviceSecurity&&(identical(other.isRooted, isRooted) || other.isRooted == isRooted)&&(identical(other.isScreenRecording, isScreenRecording) || other.isScreenRecording == isScreenRecording));
}


@override
int get hashCode => Object.hash(runtimeType,isRooted,isScreenRecording);

@override
String toString() {
  return 'DeviceSecurity(isRooted: $isRooted, isScreenRecording: $isScreenRecording)';
}


}

/// @nodoc
abstract mixin class _$DeviceSecurityCopyWith<$Res> implements $DeviceSecurityCopyWith<$Res> {
  factory _$DeviceSecurityCopyWith(_DeviceSecurity value, $Res Function(_DeviceSecurity) _then) = __$DeviceSecurityCopyWithImpl;
@override @useResult
$Res call({
 bool isRooted, bool isScreenRecording
});




}
/// @nodoc
class __$DeviceSecurityCopyWithImpl<$Res>
    implements _$DeviceSecurityCopyWith<$Res> {
  __$DeviceSecurityCopyWithImpl(this._self, this._then);

  final _DeviceSecurity _self;
  final $Res Function(_DeviceSecurity) _then;

/// Create a copy of DeviceSecurity
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? isRooted = null,Object? isScreenRecording = null,}) {
  return _then(_DeviceSecurity(
isRooted: null == isRooted ? _self.isRooted : isRooted // ignore: cast_nullable_to_non_nullable
as bool,isScreenRecording: null == isScreenRecording ? _self.isScreenRecording : isScreenRecording // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

// dart format on
