// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'payment_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_PaymentModel _$PaymentModelFromJson(Map<String, dynamic> json) =>
    _PaymentModel(
      id: json['id'] as String,
      recipient: json['recipient'] as String,
      accountNumber: json['accountNumber'] as String,
      amount: (json['amount'] as num).toDouble(),
      currency: json['currency'] as String? ?? 'USD',
      timestamp: DateTime.parse(json['timestamp'] as String),
      billItems: (json['billItems'] as List<dynamic>)
          .map((e) => BillItem.fromJson(e as Map<String, dynamic>))
          .toList(),
      status:
          $enumDecodeNullable(_$PaymentStatusEnumMap, json['status']) ??
          PaymentStatus.pending,
      promoCode: json['promoCode'] as String?,
      discount: (json['discount'] as num?)?.toDouble() ?? 0.0,
    );

Map<String, dynamic> _$PaymentModelToJson(_PaymentModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'recipient': instance.recipient,
      'accountNumber': instance.accountNumber,
      'amount': instance.amount,
      'currency': instance.currency,
      'timestamp': instance.timestamp.toIso8601String(),
      'billItems': instance.billItems,
      'status': _$PaymentStatusEnumMap[instance.status]!,
      'promoCode': instance.promoCode,
      'discount': instance.discount,
    };

const _$PaymentStatusEnumMap = {
  PaymentStatus.pending: 'pending',
  PaymentStatus.processing: 'processing',
  PaymentStatus.success: 'success',
  PaymentStatus.failed: 'failed',
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
