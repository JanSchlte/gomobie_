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
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(25),
        ),
      ),
      title: Padding(
        padding: EdgeInsets.all(15),
        child:
            Image.asset('assets/general_assets/flying_money.png', height: 200),
      ),
      content: Text(
        'Geld erfolgreich an Emma gesendet!',
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
                height: MediaQuery.of(context).size.width * 0.1,
              ),
              CircleAvatar(
                radius: 70,
                backgroundImage: AssetImage(
                    //TODO: Add the specific Firebase Image of the Transaction-Partner
                    'assets/fake_backend/fake_avatar.jpg'),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.width * 0.04,
              ),
              Text(
                '30.00 €',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 30,
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.width * 0.03,
              ),
              Text(
                'Geld anfordern',
                style: TextStyle(
                  color: Colors.grey.shade500,
                  fontSize: 17,
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.width * 0.3,
              ),
              Align(
                alignment: Alignment(-0.8, 0),
                child: Text(
                  'Person/ID:',
                  style: TextStyle(
                    color: _mainColor,
                  ),
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.width * 0.03,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 30),
                child: SizedBox(
                  width: double.infinity,
                  height: 60,
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
              Align(
                alignment: Alignment(-0.8, 0),
                child: Text(
                  'Person/ID:',
                  style: TextStyle(
                    color: _mainColor,
                  ),
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.width * 0.03,
              ),
              DecoratedBox(
                decoration: BoxDecoration(color: Colors.grey.shade100),
                position: DecorationPosition.background,
                child: Padding(
                  padding: EdgeInsets.all(17),
                  child: Text(
                    'Harold ( ID: 546 654 455 )',
                    style: TextStyle(
                      fontSize: 15,
                      color: Colors.grey.shade400,
                    ),
                  ),
                ),
              ),
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
                                fontWeight: FontWeight.bold, fontSize: 20),
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
                              fontWeight: FontWeight.bold, fontSize: 20),
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
