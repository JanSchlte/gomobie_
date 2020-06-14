import 'package:cloud_firestore/cloud_firestore.dart';
import '../extensions/map.dart';

class CreditCard {
  final DocumentSnapshot snapshot;

  CreditCard(this.snapshot);

  int get cvc => snapshot.data.get('cvc') as int;

  String get number => snapshot.data.get('number') as String;

  DateTime get validUntil =>
      (snapshot.data.get('validUntil') as Timestamp).toDate();

  static Future<List<CreditCard>> get(DocumentReference reference) async {
    final snap = await reference.collection('creditCards').getDocuments();
    return snap.documents.map((e) => CreditCard(e)).toList();
  }
}
