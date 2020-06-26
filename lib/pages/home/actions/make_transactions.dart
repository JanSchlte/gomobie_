import 'package:flutter/material.dart';
import 'package:gomobie/pages/home/actions/transaction_confirmation.dart';

class TransactionScreen extends StatelessWidget {
  static const routeName = '/transaction';

  /*
  final bool action;
  //Sollte herausfinden, ob der Screen zum senden oder recieven benutzt wird. Ist ja schließlich nur ein anderes Wort
  TransactionScreen(this.action);
  */
  //TODO: Figure out whether the user wants to send money or recieve money
  final TextEditingController _personController = TextEditingController();
  final TextEditingController _amountController = TextEditingController();
  final TextEditingController _useController = TextEditingController();
  final TextEditingController _messageController = TextEditingController();

  Widget _buildPersonTextfield() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: TextFormField(
        controller: _personController,
        decoration: InputDecoration(
          filled: true,
          fillColor: Color(0xFF949494).withOpacity(0.5),
          labelText: 'Person/ID',
          labelStyle: TextStyle(color: Colors.white),
        ),
        style: TextStyle(color: Colors.white),
        validator: (person) {
          if (person.trim().isEmpty) {
            return 'Dieses Feld kann nicht leer sein';
          }
          return null;
        },
      ),
    );
  }

  Widget _buildAmountTextfield() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: TextFormField(
        keyboardType: TextInputType.number,
        controller: _amountController,
        decoration: InputDecoration(
          filled: true,
          fillColor: Color(0xFF949494).withOpacity(0.5),
          labelText: 'Betrag',
          labelStyle: TextStyle(color: Colors.white),
        ),
        style: TextStyle(color: Colors.white),
        validator: (amount) {
          if (amount.trim().isEmpty) {
            return 'Dieses Feld kann nicht leer sein';
          } else if (amount is String) {
            return 'Hier muss eine Zahl stehen';
          }
          return null;
        },
      ),
    );
  }

  Widget _buildUseTextfield() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: TextFormField(
        maxLength: 140,
        controller: _useController,
        decoration: InputDecoration(
          counter: Offstage(),
          filled: true,
          fillColor: Color(0xFF949494).withOpacity(0.5),
          labelText: 'Verwendungszweck',
          labelStyle: TextStyle(color: Colors.white),
        ),
        style: TextStyle(color: Colors.white),
      ),
    );
  }

  Widget _buildMessageTextfield() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: TextFormField(
        maxLength: 200,
        controller: _messageController,
        decoration: InputDecoration(
          counter: Offstage(),
          filled: true,
          fillColor: Color(0xFF949494).withOpacity(0.5),
          labelText: 'Nachricht',
          labelStyle: TextStyle(color: Colors.white),
        ),
        style: TextStyle(color: Colors.white),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    //TODO: Apply on other screens
    return Container(
      decoration: BoxDecoration(
          image: DecorationImage(
        image: AssetImage(
            'assets/send_or_recieve_money/send_money_background.png'),
        fit: BoxFit.fill,
      )),
      child: Scaffold(
        backgroundColor: Colors.grey.shade900.withOpacity(0.89),
        resizeToAvoidBottomInset: false,
        body: SafeArea(
          child: Center(
            child: Stack(
              fit: StackFit.expand,
              children: <Widget>[
                SingleChildScrollView(
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    children: <Widget>[
                      SizedBox(
                        height: MediaQuery.of(context).size.width * 0.05,
                      ),
                      Image.asset(
                        'assets/general_assets/flying_money.png',
                        height: 150,
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.width * 0.05,
                      ),
                      Text(
                        //TODO: Make the type of the Screen (sending or recieving) dependent from the boolean type arguments (Map-Form)
                        //routes[sending] == true ?
                        'Geld senden',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 25,
                        ),
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.width * 0.05,
                      ),
                      _buildPersonTextfield(),
                      SizedBox(
                        height: MediaQuery.of(context).size.width * 0.05,
                      ),
                      _buildAmountTextfield(),
                      SizedBox(
                        height: MediaQuery.of(context).size.width * 0.05,
                      ),
                      _buildUseTextfield(),
                      SizedBox(
                        height: MediaQuery.of(context).size.width * 0.05,
                      ),
                      _buildMessageTextfield(),
                    ],
                  ),
                ),
                Positioned(
                  bottom: 0,
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.width * 0.17,
                  child: SizedBox(
                    child: RaisedButton(
                      elevation: 30,
                      onPressed: () {
                        Navigator.pushNamed(
                            context, TransactionConfirmation.routeName);
                        //TODO: Validate the transaction-data
                      },
                      child: Text(
                        'ÜBERPRÜFEN',
                        style: TextStyle(
                            color: Colors.white, fontWeight: FontWeight.w700),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
