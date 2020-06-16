// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'transaction.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Transaction _$TransactionFromJson(Map<String, dynamic> json) {
  return Transaction(
    amount: json['amount'] as int,
    title: json['title'] as String,
    receiver: json['receiver'] as String,
    sender: json['sender'] as String,
    transactionType:
        _$enumDecodeNullable(_$TransactionTypeEnumMap, json['transactionType']),
    created: _fromTimeStamp(json['created'] as Timestamp),
  );
}

Map<String, dynamic> _$TransactionToJson(Transaction instance) =>
    <String, dynamic>{
      'amount': instance.amount,
      'title': instance.title,
      'receiver': instance.receiver,
      'sender': instance.sender,
      'transactionType': _$TransactionTypeEnumMap[instance.transactionType],
      'created': _toTimeStamp(instance.created),
    };

T _$enumDecode<T>(
  Map<T, dynamic> enumValues,
  dynamic source, {
  T unknownValue,
}) {
  if (source == null) {
    throw ArgumentError('A value must be provided. Supported values: '
        '${enumValues.values.join(', ')}');
  }

  final value = enumValues.entries
      .singleWhere((e) => e.value == source, orElse: () => null)
      ?.key;

  if (value == null && unknownValue == null) {
    throw ArgumentError('`$source` is not one of the supported values: '
        '${enumValues.values.join(', ')}');
  }
  return value ?? unknownValue;
}

T _$enumDecodeNullable<T>(
  Map<T, dynamic> enumValues,
  dynamic source, {
  T unknownValue,
}) {
  if (source == null) {
    return null;
  }
  return _$enumDecode<T>(enumValues, source, unknownValue: unknownValue);
}

const _$TransactionTypeEnumMap = {
  TransactionType.incoming: 'incoming',
  TransactionType.outgoing: 'outgoing',
};
