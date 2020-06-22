// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'private_user_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PrivateUserData _$PrivateUserDataFromJson(Map<String, dynamic> json) {
  return PrivateUserData(
    birthday: _fromTimeStamp(json['birthday'] as Timestamp),
    city: json['city'] as String,
    country: json['country'] as String,
    street: json['street'] as String,
    title: json['title'] as String,
    postalCode: json['postalCode'] as int,
    balance: json['balance'] as int,
  )..idNumber = json['idNumber'] as String;
}

Map<String, dynamic> _$PrivateUserDataToJson(PrivateUserData instance) =>
    <String, dynamic>{
      'birthday': _toTimeStamp(instance.birthday),
      'city': instance.city,
      'postalCode': instance.postalCode,
      'country': instance.country,
      'street': instance.street,
      'title': instance.title,
      'balance': instance.balance,
      'idNumber': instance.idNumber,
    };
