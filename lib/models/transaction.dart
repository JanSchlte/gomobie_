import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get_it/get_it.dart';
import 'package:gomobie/provider/auth/auth_bloc.dart';
import 'package:gomobie/widgets/home/transactions/transaction_card.dart';
import 'package:json_annotation/json_annotation.dart';

part 'transaction.g.dart';

@JsonSerializable()
class Transaction extends Comparable<Transaction> {
  final int amount;
  final String title;
  final String receiver;
  final String sender;
  @JsonKey(fromJson: _fromTimeStamp, toJson: _toTimeStamp)
  final DateTime created;

  bool get isIncoming => GetIt.I.get<AuthBloc>().state.user?.uid == receiver;

  String get value => '${isIncoming ? '+' : '-'}'
      '${(amount / 100).toStringAsFixed(2)}';

  TransactionCard get asWidget => TransactionCard(transaction: this);

  Transaction({
    this.amount,
    this.title,
    this.receiver,
    this.sender,
    this.created,
  });

  Future<void> create() => Firestore.instance
      .collection('transactions')
      .document()
      .setData(toJson());

  factory Transaction.fromJson(Map<String, dynamic> json) =>
      _$TransactionFromJson(json);

  Map<String, dynamic> toJson() => _$TransactionToJson(this);

  @override
  int compareTo(Transaction other) => created.compareTo(other.created);
}

//TODO: Put into file
DateTime _fromTimeStamp(Timestamp timestamp) => timestamp.toDate();

Timestamp _toTimeStamp(DateTime dateTime) => Timestamp.fromDate(dateTime);
