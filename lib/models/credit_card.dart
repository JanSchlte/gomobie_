import 'package:cloud_firestore/cloud_firestore.dart';
import 'snapshot_able.dart';
import 'package:json_annotation/json_annotation.dart';

part 'credit_card.g.dart';

@JsonSerializable()
class CreditCard extends SnapshotAble<CreditCard> {
  final int cvc;
  final String number;
  @JsonKey(fromJson: _fromTimeStamp, toJson: _toTimeStamp)
  final DateTime validUntil;

  CreditCard({
    this.cvc,
    this.number,
    this.validUntil,
    DocumentSnapshot snapshot,
  }) : super(snapshot);

  static Future<List<CreditCard>> get(DocumentReference reference) async {
    final snap = await reference.collection('creditCards').getDocuments();
    return snap.documents.map((e) => CreditCard(snapshot: e)).toList();
  }

  @override
  CreditCard fromJson() => _$CreditCardFromJson(snapshot.data);
}

DateTime _fromTimeStamp(Timestamp timestamp) => timestamp.toDate();

Timestamp _toTimeStamp(DateTime dateTime) => Timestamp.fromDate(dateTime);
