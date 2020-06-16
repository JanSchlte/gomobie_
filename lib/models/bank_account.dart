import 'package:cloud_firestore/cloud_firestore.dart';
import '../extensions/map.dart';

class BankAccount {
  final DocumentSnapshot snapshot;

  BankAccount(this.snapshot);

  String get iban => snapshot.data.get("iban") as String;

  String get bic => snapshot.data.get('bic') as String;

  static Future<List<BankAccount>> get(DocumentReference reference) async {
    final snap = await reference.collection('bankAccounts').getDocuments();
    return snap.documents.map((e) => BankAccount(e)).toList();
  }
}
