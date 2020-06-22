import 'package:cloud_firestore/cloud_firestore.dart' hide Transaction;
import 'package:firebase_auth/firebase_auth.dart';
import 'package:gomobie/models/private_user_data.dart';
import 'package:gomobie/models/snapshot_able.dart';
import 'package:gomobie/models/transaction.dart';
import 'package:json_annotation/json_annotation.dart';

import 'bank_account.dart';
import 'credit_card.dart';

part 'user_data.g.dart';

@JsonSerializable()
class UserData extends SnapshotAble<UserData> {
  final String firstName;
  final String lastName;
  String email;
  String phone;
  final List<String> childOf;

  String get name => '$firstName $lastName';

  String get userId => snapshot.documentID;

  UserData({
    this.firstName,
    this.lastName,
    this.email,
    this.phone,
    this.childOf = const [],
    DocumentSnapshot snapshot,
  }) : super(snapshot);

  Future<List<BankAccount>> get bankAccounts =>
      BankAccount.get(snapshot.reference);

  Future<List<CreditCard>> get creditCards =>
      CreditCard.get(snapshot.reference);

  Future<List<UserData>> get children async {
    if (childOf.isNotEmpty) return [];
    final snap = await Firestore.instance
        .collection('children')
        .where('childOf', arrayContains: snapshot.documentID)
        .getDocuments();
    return snap.documents.map((e) => UserData(snapshot: e).fromJson()).toList();
  }

  Future<List<Transaction>> get transactions async {
    final received = await Firestore.instance
        .collection('transactions')
        .where('receiver', isEqualTo: userId)
        .getDocuments();
    final sent = await Firestore.instance
        .collection('transactions')
        .where('sender', isEqualTo: userId)
        .getDocuments();
    final r = received.documents.map((e) => Transaction.fromJson(e.data));
    final s = sent.documents.map((e) => Transaction.fromJson(e.data));
    final c = r.followedBy(s);
    final f = c.toList();
    f.sort();
    return f;
  }

  Future<PrivateUserData> get private async {
    final doc =
        await Firestore.instance.collection('private').document(userId).get();
    return PrivateUserData.fromJson(doc.data);
  }

  static Future<UserData> get(String userId) async {
    final doc =
        await Firestore.instance.collection('users').document(userId).get();
    return UserData(snapshot: doc).fromJson();
  }

  /// This method should only be called ONCE when registering!
  Future<UserData> create(FirebaseUser user, PrivateUserData privateUserData,
      String email, String phone) async {
    this.email = email;
    this.phone = phone;
    await Firestore.instance
        .collection('users')
        .document(user.uid)
        .setData(toJson());
    Firestore.instance
        .collection('private')
        .document(user.uid)
        .setData(privateUserData.toJson());
    return get(user.uid);
  }

  // Keep the snapshot for bankAccounts and creditCards
  @override
  UserData fromJson() => _$UserDataFromJson(snapshot.data)..snapshot = snapshot;

  Map<String, dynamic> toJson() => _$UserDataToJson(this);
}
