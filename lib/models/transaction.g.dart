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
    created: _fromTimeStamp(json['created'] as Timestamp),
  );
}

Map<String, dynamic> _$TransactionToJson(Transaction instance) =>
    <String, dynamic>{
      'amount': instance.amount,
      'title': instance.title,
      'receiver': instance.receiver,
      'sender': instance.sender,
      'created': _toTimeStamp(instance.created),
    };
