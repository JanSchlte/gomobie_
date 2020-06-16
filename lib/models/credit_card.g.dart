// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'credit_card.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CreditCard _$CreditCardFromJson(Map<String, dynamic> json) {
  return CreditCard(
    cvc: json['cvc'] as int,
    number: json['number'] as String,
    validUntil: _fromTimeStamp(json['validUntil'] as Timestamp),
  );
}

Map<String, dynamic> _$CreditCardToJson(CreditCard instance) =>
    <String, dynamic>{
      'cvc': instance.cvc,
      'number': instance.number,
      'validUntil': _toTimeStamp(instance.validUntil),
    };
