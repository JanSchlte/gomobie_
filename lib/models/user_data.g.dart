// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserData _$UserDataFromJson(Map<String, dynamic> json) {
  return UserData(
    birthday: _fromTimeStamp(json['birthday'] as Timestamp),
    city: json['city'] as String,
    country: json['country'] as String,
    firstName: json['firstName'] as String,
    lastName: json['lastName'] as String,
    postalCode: json['postalCode'] as int,
    street: json['street'] as String,
    title: json['title'] as String,
    idNumber: json['idNumber'] as String,
    balance: json['balance'] as int,
  );
}

Map<String, dynamic> _$UserDataToJson(UserData instance) => <String, dynamic>{
      'birthday': _toTimeStamp(instance.birthday),
      'city': instance.city,
      'country': instance.country,
      'firstName': instance.firstName,
      'lastName': instance.lastName,
      'postalCode': instance.postalCode,
      'street': instance.street,
      'title': instance.title,
      'balance': instance.balance,
      'idNumber': instance.idNumber,
    };
