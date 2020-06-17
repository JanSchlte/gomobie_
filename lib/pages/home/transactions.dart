import 'package:flutter/material.dart';
import 'package:gomobie/models/bank_account.dart';
import 'package:gomobie/models/transaction.dart';
import 'package:gomobie/pages/registration_screens/registration_screen_bank.dart';
import 'package:gomobie/provider/auth_provider.dart';
import 'package:provider/provider.dart';

enum AccountType { owner, child }

class Transactions extends StatefulWidget {
  @override
  _TransactionsState createState() => _TransactionsState();
}

class _TransactionsState extends State<Transactions> {
  AccountType _accountType = AccountType.owner;

  Widget _buildAccountDisplay() {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                FloatingActionButton(
                  onPressed: () {
                    Navigator.of(context)
                        .pushNamed(RegistrationScreenBank.routeName);
                  },
                  child: Icon(Icons.add),
                ),
                FutureBuilder<List<BankAccount>>(
                  future: context.watch<AuthProvider>().userData.bankAccounts,
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      //TODO: Move into own widget
                      return Row(
                        children: snapshot.data
                            .map((e) => Card(
                                  child: Padding(
                                    padding: EdgeInsets.only(bottom: 10),
                                    child: SizedBox(
                                      width: 140,
                                      child: Column(
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          Row(
                                            children: [
                                              Expanded(child: Container()),
                                              Column(
                                                children: [
                                                  Icon(
                                                      Icons
                                                          .account_balance_wallet,
                                                      size: 45),
                                                ],
                                              )
                                            ],
                                          ),
                                          Text(e.iban,
                                              style: TextStyle(fontSize: 12)),
                                          SizedBox(height: 20),
                                          Text('800,44€'),
                                          SizedBox(height: 20),
                                        ],
                                      ),
                                    ),
                                  ),
                                ))
                            .toList(),
                      );
                    }
                    return Container();
                  },
                )
              ],
            ),
          ),
          SizedBox(height: 10),
          Text(
            'Letzte Transaktionen',
            style: TextStyle(fontSize: 20, color: Colors.white),
          ),
          Transaction(
                  amount: 200,
                  title: 'Trinkgeld',
                  transactionType: TransactionType.outgoing,
                  created: DateTime.now())
              .asWidget,
          Transaction(
                  amount: 200,
                  title: 'Trinkgeld',
                  transactionType: TransactionType.outgoing,
                  created: DateTime.now())
              .asWidget,
          Transaction(
                  amount: 200,
                  title: 'Trinkgeld',
                  transactionType: TransactionType.outgoing,
                  created: DateTime.now())
              .asWidget,
          Transaction(
                  amount: 200,
                  title: 'Trinkgeld',
                  transactionType: TransactionType.incoming,
                  created: DateTime.now())
              .asWidget,
          Transaction(
                  amount: 200,
                  title: 'Trinkgeld',
                  transactionType: TransactionType.outgoing,
                  created: DateTime.now())
              .asWidget,
        ],
      ),
    );
  }

  Widget _buildChildrenAccounts() {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return context.watch<AuthProvider>().hasData
        ? Container(
            decoration: BoxDecoration(color: Colors.black54),
            child: SafeArea(
              child: Stack(
                fit: StackFit.expand,
                children: [
                  Column(
                    children: [
                      SizedBox(height: 75),
                      if (_accountType == AccountType.owner)
                        _buildAccountDisplay()
                      else
                        _buildChildrenAccounts()
                    ],
                  ),
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: Row(
                      children: <Widget>[
                        Expanded(
                          child: RaisedButton(
                            onPressed: () {
                              setState(() {
                                _accountType = AccountType.owner;
                              });
                            },
                            elevation: 0,
                            shape: RoundedRectangleBorder(),
                            padding: EdgeInsets.symmetric(vertical: 20),
                            child: Text(
                              'Mein Konto',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 20),
                            ),
                            textColor: _accountType == AccountType.child
                                ? Colors.grey
                                : Colors.white,
                            color: _accountType == AccountType.child
                                ? Colors.white
                                : null,
                          ),
                        ),
                        Expanded(
                          child: RaisedButton(
                            onPressed: () {
                              setState(() {
                                _accountType = AccountType.child;
                              });
                            },
                            elevation: 0,
                            padding: EdgeInsets.symmetric(vertical: 20),
                            child: Text(
                              'Kinderkonten',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 20),
                            ),
                            textColor: _accountType == AccountType.child
                                ? Colors.white
                                : Colors.grey,
                            color: _accountType == AccountType.owner
                                ? Colors.white
                                : null,
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          )
        : Text('LOADING...');
  }
}