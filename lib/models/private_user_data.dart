import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:json_annotation/json_annotation.dart';

part 'private_user_data.g.dart';

@JsonSerializable()
class PrivateUserData {
  @JsonKey(fromJson: _fromTimeStamp, toJson: _toTimeStamp)
  final DateTime birthday;
  final String city;
  final int postalCode;
  final String country;
  final String street;
  final String title;

  // Doubles may cause rounding errors
  final int balance;
  String idNumber;

  PrivateUserData({
    this.birthday,
    this.city,
    this.country,
    this.street,
    this.title,
    this.postalCode,
    this.balance = 0,
  });

  factory PrivateUserData.fromJson(Map<String, dynamic> json) =>
      _$PrivateUserDataFromJson(json);

  Map<String, dynamic> toJson() => _$PrivateUserDataToJson(this);
}

//TODO: Put into file
DateTime _fromTimeStamp(Timestamp timestamp) => timestamp.toDate();

Timestamp _toTimeStamp(DateTime dateTime) => Timestamp.fromDate(dateTime);
