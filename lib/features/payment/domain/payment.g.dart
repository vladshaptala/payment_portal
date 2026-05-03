// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'payment.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_PaymentOrder _$PaymentOrderFromJson(Map<String, dynamic> json) =>
    _PaymentOrder(
      id: json['id'] as String,
      recipient: json['recipient'] as String,
      accountNumber: json['accountNumber'] as String,
      amount: (json['amount'] as num).toDouble(),
      currency: json['currency'] as String? ?? 'USD',
      timestamp: DateTime.parse(json['timestamp'] as String),
      billItems: (json['billItems'] as List<dynamic>)
          .map((e) => BillItem.fromJson(e as Map<String, dynamic>))
          .toList(),
      promoCode: json['promoCode'] as String?,
      discount: (json['discount'] as num?)?.toDouble() ?? 0.0,
    );

Map<String, dynamic> _$PaymentOrderToJson(_PaymentOrder instance) =>
    <String, dynamic>{
      'id': instance.id,
      'recipient': instance.recipient,
      'accountNumber': instance.accountNumber,
      'amount': instance.amount,
      'currency': instance.currency,
      'timestamp': instance.timestamp.toIso8601String(),
      'billItems': instance.billItems,
      'promoCode': instance.promoCode,
      'discount': instance.discount,
    };

_BillItem _$BillItemFromJson(Map<String, dynamic> json) => _BillItem(
  label: json['label'] as String,
  amount: (json['amount'] as num).toDouble(),
  isDiscount: json['isDiscount'] as bool? ?? false,
);

Map<String, dynamic> _$BillItemToJson(_BillItem instance) => <String, dynamic>{
  'label': instance.label,
  'amount': instance.amount,
  'isDiscount': instance.isDiscount,
};
