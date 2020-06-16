import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:gomobie/models/transaction.dart';
import 'package:intl/intl.dart';

class TransactionCard extends StatelessWidget {
  final Transaction transaction;

  const TransactionCard({Key key, this.transaction}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Container(
        padding: EdgeInsets.all(13),
        decoration: BoxDecoration(
            color: Colors.orange,
            borderRadius: BorderRadius.all(Radius.circular(10))),
        child: Icon(Icons.shopping_basket),
      ),
      title: Text(
        transaction.title,
        style: TextStyle(color: Colors.white),
      ),
      subtitle: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(DateFormat('dd-MM-yyyy').format(transaction.created)),
          //TODO: Maybe change color theme to improve readability
          Container(
            width: 110,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(10)),
              color: transaction.transactionType == TransactionType.outgoing
                  ? Colors.red.withOpacity(0.3)
                  : Colors.green.withOpacity(0.3),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  height: 17,
                  width: 17,
                  decoration: BoxDecoration(
                    color:
                        transaction.transactionType == TransactionType.outgoing
                            ? Colors.red.withOpacity(0.55)
                            : Colors.green.withOpacity(0.55),
                    shape: BoxShape.circle,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  child: Text(
                    transaction.transactionType.message(),
                    style: TextStyle(
                        color: transaction.transactionType ==
                                TransactionType.outgoing
                            ? Colors.red.withOpacity(0.8)
                            : Colors.green.withOpacity(0.8)),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
      trailing: Text(
        '${transaction.value}€',
        style: TextStyle(color: Colors.white),
      ),
    );
  }
}
