// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserData _$UserDataFromJson(Map<String, dynamic> json) {
  return UserData(
    firstName: json['firstName'] as String,
    lastName: json['lastName'] as String,
    email: json['email'] as String,
    phone: json['phone'] as String,
    childOf: (json['childOf'] as List)?.map((e) => e as String)?.toList(),
  );
}

Map<String, dynamic> _$UserDataToJson(UserData instance) => <String, dynamic>{
      'firstName': instance.firstName,
      'lastName': instance.lastName,
      'email': instance.email,
      'phone': instance.phone,
      'childOf': instance.childOf,
    };
