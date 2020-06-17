import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:gomobie/widgets/home/transaction_card.dart';
import 'package:json_annotation/json_annotation.dart';

part 'transaction.g.dart';

enum TransactionType { incoming, outgoing }

extension TranscationTypeX on TransactionType {
  String message() {
    switch (this) {
      case TransactionType.incoming:
        return 'Erhalten';
      default:
        return 'Gesendet';
    }
  }
}

@JsonSerializable()
class Transaction {
  final int amount;
  final String title;
  final String receiver;
  final String sender;
  final TransactionType transactionType;
  @JsonKey(fromJson: _fromTimeStamp, toJson: _toTimeStamp)
  final DateTime created;

  String get value =>
      '${transactionType == TransactionType.incoming ? '+' : '-'}'
      '${(amount / 100).toStringAsFixed(2)}';

  TransactionCard get asWidget => TransactionCard(transaction: this);

  Transaction({
    this.amount,
    this.title,
    this.receiver,
    this.sender,
    this.transactionType,
    this.created,
  });

  factory Transaction.fromJson(Map<String, dynamic> json) =>
      _$TransactionFromJson(json);
}

//TODO: Put into file
DateTime _fromTimeStamp(Timestamp timestamp) => timestamp.toDate();

Timestamp _toTimeStamp(DateTime dateTime) => Timestamp.fromDate(dateTime);
