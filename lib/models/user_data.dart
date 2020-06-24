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

  Future<int> get balance async {
    final snap =
        await Firestore.instance.collection('private').document(userId).get();
    return snap.data['balance'] as int;
  }

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

  bool get isChild => childOf.isNotEmpty;

  String get collection => isChild ? 'children' : 'users';

  Future<List<UserData>> get children async {
    if (isChild) return [];
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

  static Future<UserData> get(String userId, {bool child = false}) async {
    final doc = await Firestore.instance
        .collection(child ? 'children' : 'users')
        .document(userId)
        .get();
    return UserData(snapshot: doc).fromJson();
  }

  /// This method should only be called ONCE when registering!
  Future<void> create(FirebaseUser user, PrivateUserData privateUserData,
      String email, String phone) async {
    this.email = email;
    this.phone = phone;
    await Firestore.instance
        .collection(collection)
        .document(user.uid)
        .setData(toJson());
    Firestore.instance
        .collection('private')
        .document(user.uid)
        .setData(privateUserData.toJson());
  }

  // Keep the snapshot for bankAccounts and creditCards
  @override
  UserData fromJson() => _$UserDataFromJson(snapshot.data)..snapshot = snapshot;

  Map<String, dynamic> toJson() => _$UserDataToJson(this);
}
