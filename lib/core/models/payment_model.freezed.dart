// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'payment_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$PaymentModel {

 String get id; String get recipient; String get accountNumber; double get amount; String get currency; DateTime get timestamp; List<BillItem> get billItems; PaymentStatus get status; String? get promoCode; double get discount;
/// Create a copy of PaymentModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PaymentModelCopyWith<PaymentModel> get copyWith => _$PaymentModelCopyWithImpl<PaymentModel>(this as PaymentModel, _$identity);

  /// Serializes this PaymentModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PaymentModel&&(identical(other.id, id) || other.id == id)&&(identical(other.recipient, recipient) || other.recipient == recipient)&&(identical(other.accountNumber, accountNumber) || other.accountNumber == accountNumber)&&(identical(other.amount, amount) || other.amount == amount)&&(identical(other.currency, currency) || other.currency == currency)&&(identical(other.timestamp, timestamp) || other.timestamp == timestamp)&&const DeepCollectionEquality().equals(other.billItems, billItems)&&(identical(other.status, status) || other.status == status)&&(identical(other.promoCode, promoCode) || other.promoCode == promoCode)&&(identical(other.discount, discount) || other.discount == discount));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,recipient,accountNumber,amount,currency,timestamp,const DeepCollectionEquality().hash(billItems),status,promoCode,discount);

@override
String toString() {
  return 'PaymentModel(id: $id, recipient: $recipient, accountNumber: $accountNumber, amount: $amount, currency: $currency, timestamp: $timestamp, billItems: $billItems, status: $status, promoCode: $promoCode, discount: $discount)';
}


}

/// @nodoc
abstract mixin class $PaymentModelCopyWith<$Res>  {
  factory $PaymentModelCopyWith(PaymentModel value, $Res Function(PaymentModel) _then) = _$PaymentModelCopyWithImpl;
@useResult
$Res call({
 String id, String recipient, String accountNumber, double amount, String currency, DateTime timestamp, List<BillItem> billItems, PaymentStatus status, String? promoCode, double discount
});




}
/// @nodoc
class _$PaymentModelCopyWithImpl<$Res>
    implements $PaymentModelCopyWith<$Res> {
  _$PaymentModelCopyWithImpl(this._self, this._then);

  final PaymentModel _self;
  final $Res Function(PaymentModel) _then;

/// Create a copy of PaymentModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? recipient = null,Object? accountNumber = null,Object? amount = null,Object? currency = null,Object? timestamp = null,Object? billItems = null,Object? status = null,Object? promoCode = freezed,Object? discount = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,recipient: null == recipient ? _self.recipient : recipient // ignore: cast_nullable_to_non_nullable
as String,accountNumber: null == accountNumber ? _self.accountNumber : accountNumber // ignore: cast_nullable_to_non_nullable
as String,amount: null == amount ? _self.amount : amount // ignore: cast_nullable_to_non_nullable
as double,currency: null == currency ? _self.currency : currency // ignore: cast_nullable_to_non_nullable
as String,timestamp: null == timestamp ? _self.timestamp : timestamp // ignore: cast_nullable_to_non_nullable
as DateTime,billItems: null == billItems ? _self.billItems : billItems // ignore: cast_nullable_to_non_nullable
as List<BillItem>,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as PaymentStatus,promoCode: freezed == promoCode ? _self.promoCode : promoCode // ignore: cast_nullable_to_non_nullable
as String?,discount: null == discount ? _self.discount : discount // ignore: cast_nullable_to_non_nullable
as double,
  ));
}

}


/// Adds pattern-matching-related methods to [PaymentModel].
extension PaymentModelPatterns on PaymentModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _PaymentModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _PaymentModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _PaymentModel value)  $default,){
final _that = this;
switch (_that) {
case _PaymentModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _PaymentModel value)?  $default,){
final _that = this;
switch (_that) {
case _PaymentModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String recipient,  String accountNumber,  double amount,  String currency,  DateTime timestamp,  List<BillItem> billItems,  PaymentStatus status,  String? promoCode,  double discount)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _PaymentModel() when $default != null:
return $default(_that.id,_that.recipient,_that.accountNumber,_that.amount,_that.currency,_that.timestamp,_that.billItems,_that.status,_that.promoCode,_that.discount);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String recipient,  String accountNumber,  double amount,  String currency,  DateTime timestamp,  List<BillItem> billItems,  PaymentStatus status,  String? promoCode,  double discount)  $default,) {final _that = this;
switch (_that) {
case _PaymentModel():
return $default(_that.id,_that.recipient,_that.accountNumber,_that.amount,_that.currency,_that.timestamp,_that.billItems,_that.status,_that.promoCode,_that.discount);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String recipient,  String accountNumber,  double amount,  String currency,  DateTime timestamp,  List<BillItem> billItems,  PaymentStatus status,  String? promoCode,  double discount)?  $default,) {final _that = this;
switch (_that) {
case _PaymentModel() when $default != null:
return $default(_that.id,_that.recipient,_that.accountNumber,_that.amount,_that.currency,_that.timestamp,_that.billItems,_that.status,_that.promoCode,_that.discount);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _PaymentModel implements PaymentModel {
  const _PaymentModel({required this.id, required this.recipient, required this.accountNumber, required this.amount, this.currency = 'USD', required this.timestamp, required final  List<BillItem> billItems, this.status = PaymentStatus.pending, this.promoCode, this.discount = 0.0}): _billItems = billItems;
  factory _PaymentModel.fromJson(Map<String, dynamic> json) => _$PaymentModelFromJson(json);

@override final  String id;
@override final  String recipient;
@override final  String accountNumber;
@override final  double amount;
@override@JsonKey() final  String currency;
@override final  DateTime timestamp;
 final  List<BillItem> _billItems;
@override List<BillItem> get billItems {
  if (_billItems is EqualUnmodifiableListView) return _billItems;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_billItems);
}

@override@JsonKey() final  PaymentStatus status;
@override final  String? promoCode;
@override@JsonKey() final  double discount;

/// Create a copy of PaymentModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PaymentModelCopyWith<_PaymentModel> get copyWith => __$PaymentModelCopyWithImpl<_PaymentModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$PaymentModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _PaymentModel&&(identical(other.id, id) || other.id == id)&&(identical(other.recipient, recipient) || other.recipient == recipient)&&(identical(other.accountNumber, accountNumber) || other.accountNumber == accountNumber)&&(identical(other.amount, amount) || other.amount == amount)&&(identical(other.currency, currency) || other.currency == currency)&&(identical(other.timestamp, timestamp) || other.timestamp == timestamp)&&const DeepCollectionEquality().equals(other._billItems, _billItems)&&(identical(other.status, status) || other.status == status)&&(identical(other.promoCode, promoCode) || other.promoCode == promoCode)&&(identical(other.discount, discount) || other.discount == discount));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,recipient,accountNumber,amount,currency,timestamp,const DeepCollectionEquality().hash(_billItems),status,promoCode,discount);

@override
String toString() {
  return 'PaymentModel(id: $id, recipient: $recipient, accountNumber: $accountNumber, amount: $amount, currency: $currency, timestamp: $timestamp, billItems: $billItems, status: $status, promoCode: $promoCode, discount: $discount)';
}


}

/// @nodoc
abstract mixin class _$PaymentModelCopyWith<$Res> implements $PaymentModelCopyWith<$Res> {
  factory _$PaymentModelCopyWith(_PaymentModel value, $Res Function(_PaymentModel) _then) = __$PaymentModelCopyWithImpl;
@override @useResult
$Res call({
 String id, String recipient, String accountNumber, double amount, String currency, DateTime timestamp, List<BillItem> billItems, PaymentStatus status, String? promoCode, double discount
});




}
/// @nodoc
class __$PaymentModelCopyWithImpl<$Res>
    implements _$PaymentModelCopyWith<$Res> {
  __$PaymentModelCopyWithImpl(this._self, this._then);

  final _PaymentModel _self;
  final $Res Function(_PaymentModel) _then;

/// Create a copy of PaymentModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? recipient = null,Object? accountNumber = null,Object? amount = null,Object? currency = null,Object? timestamp = null,Object? billItems = null,Object? status = null,Object? promoCode = freezed,Object? discount = null,}) {
  return _then(_PaymentModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,recipient: null == recipient ? _self.recipient : recipient // ignore: cast_nullable_to_non_nullable
as String,accountNumber: null == accountNumber ? _self.accountNumber : accountNumber // ignore: cast_nullable_to_non_nullable
as String,amount: null == amount ? _self.amount : amount // ignore: cast_nullable_to_non_nullable
as double,currency: null == currency ? _self.currency : currency // ignore: cast_nullable_to_non_nullable
as String,timestamp: null == timestamp ? _self.timestamp : timestamp // ignore: cast_nullable_to_non_nullable
as DateTime,billItems: null == billItems ? _self._billItems : billItems // ignore: cast_nullable_to_non_nullable
as List<BillItem>,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as PaymentStatus,promoCode: freezed == promoCode ? _self.promoCode : promoCode // ignore: cast_nullable_to_non_nullable
as String?,discount: null == discount ? _self.discount : discount // ignore: cast_nullable_to_non_nullable
as double,
  ));
}


}


/// @nodoc
mixin _$BillItem {

 String get label; double get amount; bool get isDiscount;
/// Create a copy of BillItem
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$BillItemCopyWith<BillItem> get copyWith => _$BillItemCopyWithImpl<BillItem>(this as BillItem, _$identity);

  /// Serializes this BillItem to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is BillItem&&(identical(other.label, label) || other.label == label)&&(identical(other.amount, amount) || other.amount == amount)&&(identical(other.isDiscount, isDiscount) || other.isDiscount == isDiscount));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,label,amount,isDiscount);

@override
String toString() {
  return 'BillItem(label: $label, amount: $amount, isDiscount: $isDiscount)';
}


}

/// @nodoc
abstract mixin class $BillItemCopyWith<$Res>  {
  factory $BillItemCopyWith(BillItem value, $Res Function(BillItem) _then) = _$BillItemCopyWithImpl;
@useResult
$Res call({
 String label, double amount, bool isDiscount
});




}
/// @nodoc
class _$BillItemCopyWithImpl<$Res>
    implements $BillItemCopyWith<$Res> {
  _$BillItemCopyWithImpl(this._self, this._then);

  final BillItem _self;
  final $Res Function(BillItem) _then;

/// Create a copy of BillItem
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? label = null,Object? amount = null,Object? isDiscount = null,}) {
  return _then(_self.copyWith(
label: null == label ? _self.label : label // ignore: cast_nullable_to_non_nullable
as String,amount: null == amount ? _self.amount : amount // ignore: cast_nullable_to_non_nullable
as double,isDiscount: null == isDiscount ? _self.isDiscount : isDiscount // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

}


/// Adds pattern-matching-related methods to [BillItem].
extension BillItemPatterns on BillItem {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _BillItem value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _BillItem() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _BillItem value)  $default,){
final _that = this;
switch (_that) {
case _BillItem():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _BillItem value)?  $default,){
final _that = this;
switch (_that) {
case _BillItem() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String label,  double amount,  bool isDiscount)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _BillItem() when $default != null:
return $default(_that.label,_that.amount,_that.isDiscount);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String label,  double amount,  bool isDiscount)  $default,) {final _that = this;
switch (_that) {
case _BillItem():
return $default(_that.label,_that.amount,_that.isDiscount);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String label,  double amount,  bool isDiscount)?  $default,) {final _that = this;
switch (_that) {
case _BillItem() when $default != null:
return $default(_that.label,_that.amount,_that.isDiscount);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _BillItem implements BillItem {
  const _BillItem({required this.label, required this.amount, this.isDiscount = false});
  factory _BillItem.fromJson(Map<String, dynamic> json) => _$BillItemFromJson(json);

@override final  String label;
@override final  double amount;
@override@JsonKey() final  bool isDiscount;

/// Create a copy of BillItem
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$BillItemCopyWith<_BillItem> get copyWith => __$BillItemCopyWithImpl<_BillItem>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$BillItemToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _BillItem&&(identical(other.label, label) || other.label == label)&&(identical(other.amount, amount) || other.amount == amount)&&(identical(other.isDiscount, isDiscount) || other.isDiscount == isDiscount));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,label,amount,isDiscount);

@override
String toString() {
  return 'BillItem(label: $label, amount: $amount, isDiscount: $isDiscount)';
}


}

/// @nodoc
abstract mixin class _$BillItemCopyWith<$Res> implements $BillItemCopyWith<$Res> {
  factory _$BillItemCopyWith(_BillItem value, $Res Function(_BillItem) _then) = __$BillItemCopyWithImpl;
@override @useResult
$Res call({
 String label, double amount, bool isDiscount
});




}
/// @nodoc
class __$BillItemCopyWithImpl<$Res>
    implements _$BillItemCopyWith<$Res> {
  __$BillItemCopyWithImpl(this._self, this._then);

  final _BillItem _self;
  final $Res Function(_BillItem) _then;

/// Create a copy of BillItem
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? label = null,Object? amount = null,Object? isDiscount = null,}) {
  return _then(_BillItem(
label: null == label ? _self.label : label // ignore: cast_nullable_to_non_nullable
as String,amount: null == amount ? _self.amount : amount // ignore: cast_nullable_to_non_nullable
as double,isDiscount: null == isDiscount ? _self.isDiscount : isDiscount // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

/// @nodoc
mixin _$SecurityState {

 bool get isRooted; bool get isScreenRecording; bool get isChecking; String? get errorMessage;
/// Create a copy of SecurityState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SecurityStateCopyWith<SecurityState> get copyWith => _$SecurityStateCopyWithImpl<SecurityState>(this as SecurityState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SecurityState&&(identical(other.isRooted, isRooted) || other.isRooted == isRooted)&&(identical(other.isScreenRecording, isScreenRecording) || other.isScreenRecording == isScreenRecording)&&(identical(other.isChecking, isChecking) || other.isChecking == isChecking)&&(identical(other.errorMessage, errorMessage) || other.errorMessage == errorMessage));
}


@override
int get hashCode => Object.hash(runtimeType,isRooted,isScreenRecording,isChecking,errorMessage);

@override
String toString() {
  return 'SecurityState(isRooted: $isRooted, isScreenRecording: $isScreenRecording, isChecking: $isChecking, errorMessage: $errorMessage)';
}


}

/// @nodoc
abstract mixin class $SecurityStateCopyWith<$Res>  {
  factory $SecurityStateCopyWith(SecurityState value, $Res Function(SecurityState) _then) = _$SecurityStateCopyWithImpl;
@useResult
$Res call({
 bool isRooted, bool isScreenRecording, bool isChecking, String? errorMessage
});




}
/// @nodoc
class _$SecurityStateCopyWithImpl<$Res>
    implements $SecurityStateCopyWith<$Res> {
  _$SecurityStateCopyWithImpl(this._self, this._then);

  final SecurityState _self;
  final $Res Function(SecurityState) _then;

/// Create a copy of SecurityState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? isRooted = null,Object? isScreenRecording = null,Object? isChecking = null,Object? errorMessage = freezed,}) {
  return _then(_self.copyWith(
isRooted: null == isRooted ? _self.isRooted : isRooted // ignore: cast_nullable_to_non_nullable
as bool,isScreenRecording: null == isScreenRecording ? _self.isScreenRecording : isScreenRecording // ignore: cast_nullable_to_non_nullable
as bool,isChecking: null == isChecking ? _self.isChecking : isChecking // ignore: cast_nullable_to_non_nullable
as bool,errorMessage: freezed == errorMessage ? _self.errorMessage : errorMessage // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [SecurityState].
extension SecurityStatePatterns on SecurityState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _SecurityState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _SecurityState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _SecurityState value)  $default,){
final _that = this;
switch (_that) {
case _SecurityState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _SecurityState value)?  $default,){
final _that = this;
switch (_that) {
case _SecurityState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( bool isRooted,  bool isScreenRecording,  bool isChecking,  String? errorMessage)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _SecurityState() when $default != null:
return $default(_that.isRooted,_that.isScreenRecording,_that.isChecking,_that.errorMessage);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( bool isRooted,  bool isScreenRecording,  bool isChecking,  String? errorMessage)  $default,) {final _that = this;
switch (_that) {
case _SecurityState():
return $default(_that.isRooted,_that.isScreenRecording,_that.isChecking,_that.errorMessage);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( bool isRooted,  bool isScreenRecording,  bool isChecking,  String? errorMessage)?  $default,) {final _that = this;
switch (_that) {
case _SecurityState() when $default != null:
return $default(_that.isRooted,_that.isScreenRecording,_that.isChecking,_that.errorMessage);case _:
  return null;

}
}

}

/// @nodoc


class _SecurityState implements SecurityState {
  const _SecurityState({this.isRooted = false, this.isScreenRecording = false, this.isChecking = false, this.errorMessage});
  

@override@JsonKey() final  bool isRooted;
@override@JsonKey() final  bool isScreenRecording;
@override@JsonKey() final  bool isChecking;
@override final  String? errorMessage;

/// Create a copy of SecurityState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SecurityStateCopyWith<_SecurityState> get copyWith => __$SecurityStateCopyWithImpl<_SecurityState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SecurityState&&(identical(other.isRooted, isRooted) || other.isRooted == isRooted)&&(identical(other.isScreenRecording, isScreenRecording) || other.isScreenRecording == isScreenRecording)&&(identical(other.isChecking, isChecking) || other.isChecking == isChecking)&&(identical(other.errorMessage, errorMessage) || other.errorMessage == errorMessage));
}


@override
int get hashCode => Object.hash(runtimeType,isRooted,isScreenRecording,isChecking,errorMessage);

@override
String toString() {
  return 'SecurityState(isRooted: $isRooted, isScreenRecording: $isScreenRecording, isChecking: $isChecking, errorMessage: $errorMessage)';
}


}

/// @nodoc
abstract mixin class _$SecurityStateCopyWith<$Res> implements $SecurityStateCopyWith<$Res> {
  factory _$SecurityStateCopyWith(_SecurityState value, $Res Function(_SecurityState) _then) = __$SecurityStateCopyWithImpl;
@override @useResult
$Res call({
 bool isRooted, bool isScreenRecording, bool isChecking, String? errorMessage
});




}
/// @nodoc
class __$SecurityStateCopyWithImpl<$Res>
    implements _$SecurityStateCopyWith<$Res> {
  __$SecurityStateCopyWithImpl(this._self, this._then);

  final _SecurityState _self;
  final $Res Function(_SecurityState) _then;

/// Create a copy of SecurityState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? isRooted = null,Object? isScreenRecording = null,Object? isChecking = null,Object? errorMessage = freezed,}) {
  return _then(_SecurityState(
isRooted: null == isRooted ? _self.isRooted : isRooted // ignore: cast_nullable_to_non_nullable
as bool,isScreenRecording: null == isScreenRecording ? _self.isScreenRecording : isScreenRecording // ignore: cast_nullable_to_non_nullable
as bool,isChecking: null == isChecking ? _self.isChecking : isChecking // ignore: cast_nullable_to_non_nullable
as bool,errorMessage: freezed == errorMessage ? _self.errorMessage : errorMessage // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

/// @nodoc
mixin _$PaymentProcessingState {

 PaymentModel get payment; double get processingProgress; bool get isProcessing; bool get isComplete; String? get errorMessage;
/// Create a copy of PaymentProcessingState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PaymentProcessingStateCopyWith<PaymentProcessingState> get copyWith => _$PaymentProcessingStateCopyWithImpl<PaymentProcessingState>(this as PaymentProcessingState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PaymentProcessingState&&(identical(other.payment, payment) || other.payment == payment)&&(identical(other.processingProgress, processingProgress) || other.processingProgress == processingProgress)&&(identical(other.isProcessing, isProcessing) || other.isProcessing == isProcessing)&&(identical(other.isComplete, isComplete) || other.isComplete == isComplete)&&(identical(other.errorMessage, errorMessage) || other.errorMessage == errorMessage));
}


@override
int get hashCode => Object.hash(runtimeType,payment,processingProgress,isProcessing,isComplete,errorMessage);

@override
String toString() {
  return 'PaymentProcessingState(payment: $payment, processingProgress: $processingProgress, isProcessing: $isProcessing, isComplete: $isComplete, errorMessage: $errorMessage)';
}


}

/// @nodoc
abstract mixin class $PaymentProcessingStateCopyWith<$Res>  {
  factory $PaymentProcessingStateCopyWith(PaymentProcessingState value, $Res Function(PaymentProcessingState) _then) = _$PaymentProcessingStateCopyWithImpl;
@useResult
$Res call({
 PaymentModel payment, double processingProgress, bool isProcessing, bool isComplete, String? errorMessage
});


$PaymentModelCopyWith<$Res> get payment;

}
/// @nodoc
class _$PaymentProcessingStateCopyWithImpl<$Res>
    implements $PaymentProcessingStateCopyWith<$Res> {
  _$PaymentProcessingStateCopyWithImpl(this._self, this._then);

  final PaymentProcessingState _self;
  final $Res Function(PaymentProcessingState) _then;

/// Create a copy of PaymentProcessingState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? payment = null,Object? processingProgress = null,Object? isProcessing = null,Object? isComplete = null,Object? errorMessage = freezed,}) {
  return _then(_self.copyWith(
payment: null == payment ? _self.payment : payment // ignore: cast_nullable_to_non_nullable
as PaymentModel,processingProgress: null == processingProgress ? _self.processingProgress : processingProgress // ignore: cast_nullable_to_non_nullable
as double,isProcessing: null == isProcessing ? _self.isProcessing : isProcessing // ignore: cast_nullable_to_non_nullable
as bool,isComplete: null == isComplete ? _self.isComplete : isComplete // ignore: cast_nullable_to_non_nullable
as bool,errorMessage: freezed == errorMessage ? _self.errorMessage : errorMessage // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}
/// Create a copy of PaymentProcessingState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$PaymentModelCopyWith<$Res> get payment {
  
  return $PaymentModelCopyWith<$Res>(_self.payment, (value) {
    return _then(_self.copyWith(payment: value));
  });
}
}


/// Adds pattern-matching-related methods to [PaymentProcessingState].
extension PaymentProcessingStatePatterns on PaymentProcessingState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _PaymentProcessingState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _PaymentProcessingState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _PaymentProcessingState value)  $default,){
final _that = this;
switch (_that) {
case _PaymentProcessingState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _PaymentProcessingState value)?  $default,){
final _that = this;
switch (_that) {
case _PaymentProcessingState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( PaymentModel payment,  double processingProgress,  bool isProcessing,  bool isComplete,  String? errorMessage)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _PaymentProcessingState() when $default != null:
return $default(_that.payment,_that.processingProgress,_that.isProcessing,_that.isComplete,_that.errorMessage);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( PaymentModel payment,  double processingProgress,  bool isProcessing,  bool isComplete,  String? errorMessage)  $default,) {final _that = this;
switch (_that) {
case _PaymentProcessingState():
return $default(_that.payment,_that.processingProgress,_that.isProcessing,_that.isComplete,_that.errorMessage);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( PaymentModel payment,  double processingProgress,  bool isProcessing,  bool isComplete,  String? errorMessage)?  $default,) {final _that = this;
switch (_that) {
case _PaymentProcessingState() when $default != null:
return $default(_that.payment,_that.processingProgress,_that.isProcessing,_that.isComplete,_that.errorMessage);case _:
  return null;

}
}

}

/// @nodoc


class _PaymentProcessingState implements PaymentProcessingState {
  const _PaymentProcessingState({required this.payment, this.processingProgress = 0.0, this.isProcessing = false, this.isComplete = false, this.errorMessage});
  

@override final  PaymentModel payment;
@override@JsonKey() final  double processingProgress;
@override@JsonKey() final  bool isProcessing;
@override@JsonKey() final  bool isComplete;
@override final  String? errorMessage;

/// Create a copy of PaymentProcessingState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PaymentProcessingStateCopyWith<_PaymentProcessingState> get copyWith => __$PaymentProcessingStateCopyWithImpl<_PaymentProcessingState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _PaymentProcessingState&&(identical(other.payment, payment) || other.payment == payment)&&(identical(other.processingProgress, processingProgress) || other.processingProgress == processingProgress)&&(identical(other.isProcessing, isProcessing) || other.isProcessing == isProcessing)&&(identical(other.isComplete, isComplete) || other.isComplete == isComplete)&&(identical(other.errorMessage, errorMessage) || other.errorMessage == errorMessage));
}


@override
int get hashCode => Object.hash(runtimeType,payment,processingProgress,isProcessing,isComplete,errorMessage);

@override
String toString() {
  return 'PaymentProcessingState(payment: $payment, processingProgress: $processingProgress, isProcessing: $isProcessing, isComplete: $isComplete, errorMessage: $errorMessage)';
}


}

/// @nodoc
abstract mixin class _$PaymentProcessingStateCopyWith<$Res> implements $PaymentProcessingStateCopyWith<$Res> {
  factory _$PaymentProcessingStateCopyWith(_PaymentProcessingState value, $Res Function(_PaymentProcessingState) _then) = __$PaymentProcessingStateCopyWithImpl;
@override @useResult
$Res call({
 PaymentModel payment, double processingProgress, bool isProcessing, bool isComplete, String? errorMessage
});


@override $PaymentModelCopyWith<$Res> get payment;

}
/// @nodoc
class __$PaymentProcessingStateCopyWithImpl<$Res>
    implements _$PaymentProcessingStateCopyWith<$Res> {
  __$PaymentProcessingStateCopyWithImpl(this._self, this._then);

  final _PaymentProcessingState _self;
  final $Res Function(_PaymentProcessingState) _then;

/// Create a copy of PaymentProcessingState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? payment = null,Object? processingProgress = null,Object? isProcessing = null,Object? isComplete = null,Object? errorMessage = freezed,}) {
  return _then(_PaymentProcessingState(
payment: null == payment ? _self.payment : payment // ignore: cast_nullable_to_non_nullable
as PaymentModel,processingProgress: null == processingProgress ? _self.processingProgress : processingProgress // ignore: cast_nullable_to_non_nullable
as double,isProcessing: null == isProcessing ? _self.isProcessing : isProcessing // ignore: cast_nullable_to_non_nullable
as bool,isComplete: null == isComplete ? _self.isComplete : isComplete // ignore: cast_nullable_to_non_nullable
as bool,errorMessage: freezed == errorMessage ? _self.errorMessage : errorMessage // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

/// Create a copy of PaymentProcessingState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$PaymentModelCopyWith<$Res> get payment {
  
  return $PaymentModelCopyWith<$Res>(_self.payment, (value) {
    return _then(_self.copyWith(payment: value));
  });
}
}

// dart format on
