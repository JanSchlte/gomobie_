import 'package:cloud_firestore/cloud_firestore.dart' hide Transaction;
import 'package:firebase_auth/firebase_auth.dart';
import 'package:gomobie/models/snapshot_able.dart';
import 'package:gomobie/models/transaction.dart';
import 'package:json_annotation/json_annotation.dart';

import '../extensions/map.dart';
import 'bank_account.dart';
import 'credit_card.dart';

part 'user_data.g.dart';

@JsonSerializable()
class UserData extends SnapshotAble<UserData> {
  @JsonKey(fromJson: _fromTimeStamp, toJson: _toTimeStamp)
  final DateTime birthday;
  final String city;
  final String country;
  final String firstName;
  final String lastName;
  final int postalCode;
  final String street;
  final String title;

  // Doubles may cause rounding errors
  final int balance;
  String idNumber;

  String get name => '$firstName $lastName';

  String get userId => snapshot.documentID;

  UserData({
    this.birthday,
    this.city,
    this.country,
    this.firstName,
    this.lastName,
    this.postalCode,
    this.street,
    this.title,
    this.idNumber,
    this.balance = 0,
    DocumentSnapshot snapshot,
  }) : super(snapshot);

  Future<List<BankAccount>> get bankAccounts =>
      BankAccount.get(snapshot.reference);

  Future<List<CreditCard>> get creditCards =>
      CreditCard.get(snapshot.reference);

  Future<List<UserData>> get children =>
      Future.wait((snapshot.data.get('children') as List ?? [])
          ?.map((e) => UserData.get(e as String)));

  Future<List<Transaction>> get transactions async {
    final received = await Firestore.instance
        .collection('transactions')
        .where('receiver', isEqualTo: snapshot.documentID)
        .getDocuments();
    final sent = await Firestore.instance
        .collection('transactions')
        .where('sender', isEqualTo: snapshot.documentID)
        .getDocuments();
    final r = received.documents.map((e) => Transaction.fromJson(e.data));
    final s = sent.documents.map((e) => Transaction.fromJson(e.data));
    final c = r.followedBy(s);
    final f = c.toList();
    f.sort();
    return f;
  }

  static Future<UserData> get(String userId) async {
    final doc =
        await Firestore.instance.collection('users').document(userId).get();
    return UserData(snapshot: doc).fromJson();
  }

  /// This method should only be called ONCE when registering!
  Future<UserData> create(FirebaseUser user, String idNumber) async {
    this.idNumber = idNumber;
    await Firestore.instance
        .collection('users')
        .document(user.uid)
        .setData(toJson());
    return this;
  }

  // Keep the snapshot for bankAccounts and creditCards
  @override
  UserData fromJson() => _$UserDataFromJson(snapshot.data)..snapshot = snapshot;

  Map<String, dynamic> toJson() => _$UserDataToJson(this);
}

//TODO: Put into file
DateTime _fromTimeStamp(Timestamp timestamp) => timestamp.toDate();

Timestamp _toTimeStamp(DateTime dateTime) => Timestamp.fromDate(dateTime);
