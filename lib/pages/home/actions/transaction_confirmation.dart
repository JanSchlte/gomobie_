import 'package:flutter/material.dart';
import 'package:gomobie/pages/home.dart';

class TransactionConfirmation extends StatelessWidget {
  static const routeName = '/confirmation';
  Color _mainColor = Color(0xFF1ABC9C);

  showAlertDialog(BuildContext context) {
    Widget okButton = Padding(
      padding: EdgeInsets.only(left: 15, right: 15, bottom: 15),
      child: SizedBox(
        height: 65,
        width: 380,
        child: FlatButton(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(5),
            ),
          ),
          child: Text(
            'FERTIG',
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          ),
          color: Color(0xFF1ABC9C),
          onPressed: () {
            Navigator.pushNamed(context, Home.routeName);
          },
        ),
      ),
    );

    AlertDialog alert = AlertDialog(
      buttonPadding: EdgeInsets.all(15),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(25),
        ),
      ),
      title: Padding(
        padding: EdgeInsets.all(15),
        child:
            Image.asset('assets/general_assets/flying_money.png', height: 150),
      ),
      content: Text(
        'Geld erfolgreich an Harold gesendet!',
        textAlign: TextAlign.center,
        style: TextStyle(
          color: Colors.black,
          fontWeight: FontWeight.bold,
          fontSize: 20,
        ),
      ),
      actions: [
        okButton,
      ],
    );

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }

  Widget _buildHeader(String header) {
    return Align(
      alignment: Alignment(-0.8, 0),
      child: Text(
        header,
        style: TextStyle(
          color: _mainColor,
        ),
      ),
    );
  }

  Widget _buildMinorTextBox(String content) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 30),
      child: SizedBox(
        width: double.infinity,
        child: DecoratedBox(
          decoration: BoxDecoration(color: Colors.grey.shade100),
          position: DecorationPosition.background,
          child: Padding(
            padding: EdgeInsets.all(17),
            child: Text(
              content,
              style: TextStyle(
                fontSize: 15,
                color: Colors.grey.shade400,
              ),
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'TRANSAKTION',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        centerTitle: true,
        backgroundColor: _mainColor,
      ),
      body: SafeArea(
        child: Center(
          child: Column(
            children: <Widget>[
              SizedBox(
                height: MediaQuery.of(context).size.width * 0.04,
              ),
              CircleAvatar(
                radius: 59,
                backgroundImage: AssetImage(
                    //TODO: Add the specific Firebase Image of the Transaction-Partner
                    'assets/fake_backend/fake_avatar.jpg'),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.width * 0.03,
              ),
              Text(
                '30.00 €',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 27,
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.width * 0.03,
              ),
              Text(
                'Geld senden',
                style: TextStyle(
                  color: Colors.grey.shade500,
                  fontSize: 13,
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.width * 0.04,
              ),
              _buildHeader('Person/ID:'),
              SizedBox(
                height: MediaQuery.of(context).size.width * 0.03,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 30),
                child: SizedBox(
                  width: double.infinity,
                  child: DecoratedBox(
                    decoration: BoxDecoration(color: Colors.grey.shade100),
                    position: DecorationPosition.background,
                    child: Padding(
                      padding: EdgeInsets.all(17),
                      child: Text(
                        'Harold ( ID: 546 654 455 )',
                        style: TextStyle(
                          fontSize: 20,
                          color: Colors.grey.shade400,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.width * 0.03,
              ),
              _buildHeader('Verwendungszweck:'),
              SizedBox(
                height: MediaQuery.of(context).size.width * 0.03,
              ),
              _buildMinorTextBox('Schulden'),
              SizedBox(
                height: MediaQuery.of(context).size.width * 0.03,
              ),
              _buildHeader('Nachricht:'),
              SizedBox(
                height: MediaQuery.of(context).size.width * 0.03,
              ),
              _buildMinorTextBox('Danke für den schönen Ausflug ;)'),
              Expanded(
                child: SizedBox(),
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: Row(
                  children: <Widget>[
                    Expanded(
                      child: RaisedButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          elevation: 10,
                          shape: RoundedRectangleBorder(),
                          padding: EdgeInsets.symmetric(vertical: 20),
                          child: Text(
                            'ZURÜCK',
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 15),
                          ),
                          textColor: Colors.grey.shade300,
                          color: Colors.white),
                    ),
                    Expanded(
                      child: RaisedButton(
                        onPressed: () {
                          showAlertDialog(context);
                          //TODO: Confirm the transaction (backend)
                        },
                        elevation: 10,
                        padding: EdgeInsets.symmetric(vertical: 20),
                        child: Text(
                          'BESTÄTIGEN',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 15),
                        ),
                        textColor: Colors.white,
                        color: _mainColor,
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
