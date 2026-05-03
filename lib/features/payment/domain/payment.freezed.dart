// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'payment.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$PaymentOrder {

 String get id; String get recipient; String get accountNumber; double get amount; String get currency; DateTime get timestamp; List<BillItem> get billItems; String? get promoCode; double get discount;
/// Create a copy of PaymentOrder
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PaymentOrderCopyWith<PaymentOrder> get copyWith => _$PaymentOrderCopyWithImpl<PaymentOrder>(this as PaymentOrder, _$identity);

  /// Serializes this PaymentOrder to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PaymentOrder&&(identical(other.id, id) || other.id == id)&&(identical(other.recipient, recipient) || other.recipient == recipient)&&(identical(other.accountNumber, accountNumber) || other.accountNumber == accountNumber)&&(identical(other.amount, amount) || other.amount == amount)&&(identical(other.currency, currency) || other.currency == currency)&&(identical(other.timestamp, timestamp) || other.timestamp == timestamp)&&const DeepCollectionEquality().equals(other.billItems, billItems)&&(identical(other.promoCode, promoCode) || other.promoCode == promoCode)&&(identical(other.discount, discount) || other.discount == discount));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,recipient,accountNumber,amount,currency,timestamp,const DeepCollectionEquality().hash(billItems),promoCode,discount);

@override
String toString() {
  return 'PaymentOrder(id: $id, recipient: $recipient, accountNumber: $accountNumber, amount: $amount, currency: $currency, timestamp: $timestamp, billItems: $billItems, promoCode: $promoCode, discount: $discount)';
}


}

/// @nodoc
abstract mixin class $PaymentOrderCopyWith<$Res>  {
  factory $PaymentOrderCopyWith(PaymentOrder value, $Res Function(PaymentOrder) _then) = _$PaymentOrderCopyWithImpl;
@useResult
$Res call({
 String id, String recipient, String accountNumber, double amount, String currency, DateTime timestamp, List<BillItem> billItems, String? promoCode, double discount
});




}
/// @nodoc
class _$PaymentOrderCopyWithImpl<$Res>
    implements $PaymentOrderCopyWith<$Res> {
  _$PaymentOrderCopyWithImpl(this._self, this._then);

  final PaymentOrder _self;
  final $Res Function(PaymentOrder) _then;

/// Create a copy of PaymentOrder
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? recipient = null,Object? accountNumber = null,Object? amount = null,Object? currency = null,Object? timestamp = null,Object? billItems = null,Object? promoCode = freezed,Object? discount = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,recipient: null == recipient ? _self.recipient : recipient // ignore: cast_nullable_to_non_nullable
as String,accountNumber: null == accountNumber ? _self.accountNumber : accountNumber // ignore: cast_nullable_to_non_nullable
as String,amount: null == amount ? _self.amount : amount // ignore: cast_nullable_to_non_nullable
as double,currency: null == currency ? _self.currency : currency // ignore: cast_nullable_to_non_nullable
as String,timestamp: null == timestamp ? _self.timestamp : timestamp // ignore: cast_nullable_to_non_nullable
as DateTime,billItems: null == billItems ? _self.billItems : billItems // ignore: cast_nullable_to_non_nullable
as List<BillItem>,promoCode: freezed == promoCode ? _self.promoCode : promoCode // ignore: cast_nullable_to_non_nullable
as String?,discount: null == discount ? _self.discount : discount // ignore: cast_nullable_to_non_nullable
as double,
  ));
}

}


/// Adds pattern-matching-related methods to [PaymentOrder].
extension PaymentOrderPatterns on PaymentOrder {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _PaymentOrder value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _PaymentOrder() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _PaymentOrder value)  $default,){
final _that = this;
switch (_that) {
case _PaymentOrder():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _PaymentOrder value)?  $default,){
final _that = this;
switch (_that) {
case _PaymentOrder() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String recipient,  String accountNumber,  double amount,  String currency,  DateTime timestamp,  List<BillItem> billItems,  String? promoCode,  double discount)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _PaymentOrder() when $default != null:
return $default(_that.id,_that.recipient,_that.accountNumber,_that.amount,_that.currency,_that.timestamp,_that.billItems,_that.promoCode,_that.discount);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String recipient,  String accountNumber,  double amount,  String currency,  DateTime timestamp,  List<BillItem> billItems,  String? promoCode,  double discount)  $default,) {final _that = this;
switch (_that) {
case _PaymentOrder():
return $default(_that.id,_that.recipient,_that.accountNumber,_that.amount,_that.currency,_that.timestamp,_that.billItems,_that.promoCode,_that.discount);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String recipient,  String accountNumber,  double amount,  String currency,  DateTime timestamp,  List<BillItem> billItems,  String? promoCode,  double discount)?  $default,) {final _that = this;
switch (_that) {
case _PaymentOrder() when $default != null:
return $default(_that.id,_that.recipient,_that.accountNumber,_that.amount,_that.currency,_that.timestamp,_that.billItems,_that.promoCode,_that.discount);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _PaymentOrder implements PaymentOrder {
  const _PaymentOrder({required this.id, required this.recipient, required this.accountNumber, required this.amount, this.currency = 'USD', required this.timestamp, required final  List<BillItem> billItems, this.promoCode, this.discount = 0.0}): _billItems = billItems;
  factory _PaymentOrder.fromJson(Map<String, dynamic> json) => _$PaymentOrderFromJson(json);

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

@override final  String? promoCode;
@override@JsonKey() final  double discount;

/// Create a copy of PaymentOrder
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PaymentOrderCopyWith<_PaymentOrder> get copyWith => __$PaymentOrderCopyWithImpl<_PaymentOrder>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$PaymentOrderToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _PaymentOrder&&(identical(other.id, id) || other.id == id)&&(identical(other.recipient, recipient) || other.recipient == recipient)&&(identical(other.accountNumber, accountNumber) || other.accountNumber == accountNumber)&&(identical(other.amount, amount) || other.amount == amount)&&(identical(other.currency, currency) || other.currency == currency)&&(identical(other.timestamp, timestamp) || other.timestamp == timestamp)&&const DeepCollectionEquality().equals(other._billItems, _billItems)&&(identical(other.promoCode, promoCode) || other.promoCode == promoCode)&&(identical(other.discount, discount) || other.discount == discount));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,recipient,accountNumber,amount,currency,timestamp,const DeepCollectionEquality().hash(_billItems),promoCode,discount);

@override
String toString() {
  return 'PaymentOrder(id: $id, recipient: $recipient, accountNumber: $accountNumber, amount: $amount, currency: $currency, timestamp: $timestamp, billItems: $billItems, promoCode: $promoCode, discount: $discount)';
}


}

/// @nodoc
abstract mixin class _$PaymentOrderCopyWith<$Res> implements $PaymentOrderCopyWith<$Res> {
  factory _$PaymentOrderCopyWith(_PaymentOrder value, $Res Function(_PaymentOrder) _then) = __$PaymentOrderCopyWithImpl;
@override @useResult
$Res call({
 String id, String recipient, String accountNumber, double amount, String currency, DateTime timestamp, List<BillItem> billItems, String? promoCode, double discount
});




}
/// @nodoc
class __$PaymentOrderCopyWithImpl<$Res>
    implements _$PaymentOrderCopyWith<$Res> {
  __$PaymentOrderCopyWithImpl(this._self, this._then);

  final _PaymentOrder _self;
  final $Res Function(_PaymentOrder) _then;

/// Create a copy of PaymentOrder
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? recipient = null,Object? accountNumber = null,Object? amount = null,Object? currency = null,Object? timestamp = null,Object? billItems = null,Object? promoCode = freezed,Object? discount = null,}) {
  return _then(_PaymentOrder(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,recipient: null == recipient ? _self.recipient : recipient // ignore: cast_nullable_to_non_nullable
as String,accountNumber: null == accountNumber ? _self.accountNumber : accountNumber // ignore: cast_nullable_to_non_nullable
as String,amount: null == amount ? _self.amount : amount // ignore: cast_nullable_to_non_nullable
as double,currency: null == currency ? _self.currency : currency // ignore: cast_nullable_to_non_nullable
as String,timestamp: null == timestamp ? _self.timestamp : timestamp // ignore: cast_nullable_to_non_nullable
as DateTime,billItems: null == billItems ? _self._billItems : billItems // ignore: cast_nullable_to_non_nullable
as List<BillItem>,promoCode: freezed == promoCode ? _self.promoCode : promoCode // ignore: cast_nullable_to_non_nullable
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

// dart format on
