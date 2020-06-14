import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../extensions/map.dart';
import 'bank_account.dart';
import 'credit_card.dart';

class UserData {
  final DocumentSnapshot snapshot;

  UserData._(this.snapshot);

  DateTime get birthday =>
      (snapshot.data.get('birthday') as Timestamp).toDate();

  String get city => snapshot.data.get('city') as String;

  String get country => snapshot.data.get('country') as String;

  String get firstName => snapshot.data.get('firstName') as String;

  String get lastName => snapshot.data.get('lastName') as String;

  int get postalCode => snapshot.data.get('postalCode') as int;

  String get street => snapshot.data.get('street') as String;

  String get title => snapshot.data.get('title') as String;

  Future<List<BankAccount>> get bankAccounts =>
      BankAccount.get(snapshot.reference);

  Future<List<CreditCard>> get creditCards =>
      CreditCard.get(snapshot.reference);

  static Future<UserData> get(FirebaseUser user) async {
    final doc =
        await Firestore.instance.collection('users').document(user.uid).get();
    UserData._(doc);
  }
}
