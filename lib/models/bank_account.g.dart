// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'bank_account.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BankAccount _$BankAccountFromJson(Map<String, dynamic> json) {
  return BankAccount(
    iban: json['iban'] as String,
    bic: json['bic'] as String,
    owner: json['owner'] as String,
  );
}

Map<String, dynamic> _$BankAccountToJson(BankAccount instance) =>
    <String, dynamic>{
      'iban': instance.iban,
      'bic': instance.bic,
      'owner': instance.owner,
    };
