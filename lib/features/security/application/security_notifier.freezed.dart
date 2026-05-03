// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'security_notifier.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$SecurityCheckState {

/// Null until the first check completes.
 DeviceSecurity? get security; bool get isChecking; String? get errorMessage;
/// Create a copy of SecurityCheckState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SecurityCheckStateCopyWith<SecurityCheckState> get copyWith => _$SecurityCheckStateCopyWithImpl<SecurityCheckState>(this as SecurityCheckState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SecurityCheckState&&(identical(other.security, security) || other.security == security)&&(identical(other.isChecking, isChecking) || other.isChecking == isChecking)&&(identical(other.errorMessage, errorMessage) || other.errorMessage == errorMessage));
}


@override
int get hashCode => Object.hash(runtimeType,security,isChecking,errorMessage);

@override
String toString() {
  return 'SecurityCheckState(security: $security, isChecking: $isChecking, errorMessage: $errorMessage)';
}


}

/// @nodoc
abstract mixin class $SecurityCheckStateCopyWith<$Res>  {
  factory $SecurityCheckStateCopyWith(SecurityCheckState value, $Res Function(SecurityCheckState) _then) = _$SecurityCheckStateCopyWithImpl;
@useResult
$Res call({
 DeviceSecurity? security, bool isChecking, String? errorMessage
});


$DeviceSecurityCopyWith<$Res>? get security;

}
/// @nodoc
class _$SecurityCheckStateCopyWithImpl<$Res>
    implements $SecurityCheckStateCopyWith<$Res> {
  _$SecurityCheckStateCopyWithImpl(this._self, this._then);

  final SecurityCheckState _self;
  final $Res Function(SecurityCheckState) _then;

/// Create a copy of SecurityCheckState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? security = freezed,Object? isChecking = null,Object? errorMessage = freezed,}) {
  return _then(_self.copyWith(
security: freezed == security ? _self.security : security // ignore: cast_nullable_to_non_nullable
as DeviceSecurity?,isChecking: null == isChecking ? _self.isChecking : isChecking // ignore: cast_nullable_to_non_nullable
as bool,errorMessage: freezed == errorMessage ? _self.errorMessage : errorMessage // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}
/// Create a copy of SecurityCheckState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$DeviceSecurityCopyWith<$Res>? get security {
    if (_self.security == null) {
    return null;
  }

  return $DeviceSecurityCopyWith<$Res>(_self.security!, (value) {
    return _then(_self.copyWith(security: value));
  });
}
}


/// Adds pattern-matching-related methods to [SecurityCheckState].
extension SecurityCheckStatePatterns on SecurityCheckState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _SecurityCheckState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _SecurityCheckState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _SecurityCheckState value)  $default,){
final _that = this;
switch (_that) {
case _SecurityCheckState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _SecurityCheckState value)?  $default,){
final _that = this;
switch (_that) {
case _SecurityCheckState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( DeviceSecurity? security,  bool isChecking,  String? errorMessage)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _SecurityCheckState() when $default != null:
return $default(_that.security,_that.isChecking,_that.errorMessage);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( DeviceSecurity? security,  bool isChecking,  String? errorMessage)  $default,) {final _that = this;
switch (_that) {
case _SecurityCheckState():
return $default(_that.security,_that.isChecking,_that.errorMessage);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( DeviceSecurity? security,  bool isChecking,  String? errorMessage)?  $default,) {final _that = this;
switch (_that) {
case _SecurityCheckState() when $default != null:
return $default(_that.security,_that.isChecking,_that.errorMessage);case _:
  return null;

}
}

}

/// @nodoc


class _SecurityCheckState implements SecurityCheckState {
  const _SecurityCheckState({this.security, this.isChecking = false, this.errorMessage});
  

/// Null until the first check completes.
@override final  DeviceSecurity? security;
@override@JsonKey() final  bool isChecking;
@override final  String? errorMessage;

/// Create a copy of SecurityCheckState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SecurityCheckStateCopyWith<_SecurityCheckState> get copyWith => __$SecurityCheckStateCopyWithImpl<_SecurityCheckState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SecurityCheckState&&(identical(other.security, security) || other.security == security)&&(identical(other.isChecking, isChecking) || other.isChecking == isChecking)&&(identical(other.errorMessage, errorMessage) || other.errorMessage == errorMessage));
}


@override
int get hashCode => Object.hash(runtimeType,security,isChecking,errorMessage);

@override
String toString() {
  return 'SecurityCheckState(security: $security, isChecking: $isChecking, errorMessage: $errorMessage)';
}


}

/// @nodoc
abstract mixin class _$SecurityCheckStateCopyWith<$Res> implements $SecurityCheckStateCopyWith<$Res> {
  factory _$SecurityCheckStateCopyWith(_SecurityCheckState value, $Res Function(_SecurityCheckState) _then) = __$SecurityCheckStateCopyWithImpl;
@override @useResult
$Res call({
 DeviceSecurity? security, bool isChecking, String? errorMessage
});


@override $DeviceSecurityCopyWith<$Res>? get security;

}
/// @nodoc
class __$SecurityCheckStateCopyWithImpl<$Res>
    implements _$SecurityCheckStateCopyWith<$Res> {
  __$SecurityCheckStateCopyWithImpl(this._self, this._then);

  final _SecurityCheckState _self;
  final $Res Function(_SecurityCheckState) _then;

/// Create a copy of SecurityCheckState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? security = freezed,Object? isChecking = null,Object? errorMessage = freezed,}) {
  return _then(_SecurityCheckState(
security: freezed == security ? _self.security : security // ignore: cast_nullable_to_non_nullable
as DeviceSecurity?,isChecking: null == isChecking ? _self.isChecking : isChecking // ignore: cast_nullable_to_non_nullable
as bool,errorMessage: freezed == errorMessage ? _self.errorMessage : errorMessage // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

/// Create a copy of SecurityCheckState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$DeviceSecurityCopyWith<$Res>? get security {
    if (_self.security == null) {
    return null;
  }

  return $DeviceSecurityCopyWith<$Res>(_self.security!, (value) {
    return _then(_self.copyWith(security: value));
  });
}
}

// dart format on
