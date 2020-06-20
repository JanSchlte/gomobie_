import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:json_annotation/json_annotation.dart';

import 'snapshot_able.dart';

part 'bank_account.g.dart';

@JsonSerializable()
class BankAccount extends SnapshotAble<BankAccount> {
  final String iban;
  final String bic;
  final String owner;

  BankAccount({
    this.iban,
    this.bic,
    this.owner,
    DocumentSnapshot snapshot,
  }) : super(snapshot);

  @override
  BankAccount fromJson() => _$BankAccountFromJson(snapshot.data);

  /// Only call this when adding new credit cards
  Future<void> create(DocumentReference user) async {
    await user.collection('bankAccounts').document().setData(toJson());
  }

  Map<String, dynamic> toJson() => _$BankAccountToJson(this);

  static Future<List<BankAccount>> get(DocumentReference reference) async {
    final snap = await reference.collection('bankAccounts').getDocuments();
    return snap.documents
        .map((e) => BankAccount(snapshot: e).fromJson())
        .toList();
  }
}
