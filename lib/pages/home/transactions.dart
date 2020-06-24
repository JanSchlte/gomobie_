import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:gomobie/pages/registration_screens/registration_screen_bank.dart';
import 'package:gomobie/provider/bank_account/bank_account_bloc.dart';
import 'package:gomobie/provider/transaction/transaction_bloc.dart';

//TODO: Add to UserData
enum AccountType { owner, child }

extension AccountTypeX on AccountType {
  String message() {
    switch (this) {
      case AccountType.owner:
        return 'Erziehungsberechtigter';
      default:
        return 'Kinderkonto';
    }
  }
}

class Transactions extends StatefulWidget {
  static const routeName = '/transactions';

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
                BlocBuilder<BankAccountBloc, BankAccountState>(
                  bloc: GetIt.I.get<BankAccountBloc>(),
                  builder: (context, state) {
                    //TODO: Move into own widget
                    return Row(
                      children: state.accounts
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
                  },
                ),
              ],
            ),
          ),
          SizedBox(height: 10),
          Text(
            'Letzte Transaktionen',
            style: TextStyle(fontSize: 20),
          ),
          BlocBuilder<TransactionBloc, TransactionState>(
            bloc: GetIt.I.get<TransactionBloc>(),
            builder: (context, state) {
              return Column(
                  children: state.transactions.map((e) => e.asWidget).toList());
            },
          ),
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
    return SafeArea(
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
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                    ),
                    textColor: _accountType == AccountType.child
                        ? Colors.grey
                        : Colors.white,
                    color:
                        _accountType == AccountType.child ? Colors.white : null,
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
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                    ),
                    textColor: _accountType == AccountType.child
                        ? Colors.white
                        : Colors.grey,
                    color:
                        _accountType == AccountType.owner ? Colors.white : null,
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
