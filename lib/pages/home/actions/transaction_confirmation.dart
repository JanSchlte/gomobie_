import 'package:flutter/material.dart';

class TransactionConfirmation extends StatelessWidget {
  static const routeName = '/confirmation';
  Color _mainColor = Color(0xFF1ABC9C);

  Widget _buildTextShower(String title, String content) {
    return Align(
      alignment: Alignment(-0.8, 0),
      child: Column(
        children: <Widget>[
          SizedBox(
            height: 10,
          ),
          Text(
            title,
            style: TextStyle(
              color: _mainColor,
            ),
          ),
          SizedBox(
            height: 10,
          ),
          DecoratedBox(
            decoration: BoxDecoration(color: Colors.grey.shade100),
            position: DecorationPosition.background,
            child: Padding(
              padding: EdgeInsets.all(9),
              child: Text(
                content,
                style: TextStyle(
                  fontSize: 15,
                  color: Colors.grey.shade400,
                ),
              ),
            ),
          ),
        ],
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
                height: MediaQuery.of(context).size.width * 0.1,
              ),
              CircleAvatar(
                radius: 70,
                backgroundImage: AssetImage(
                    //TODO: Add the specific Firebase Image of the Transaction-Partner
                    'assets/send_or_recieve_money/send_money_background.png'),
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
              DecoratedBox(
                decoration: BoxDecoration(color: Colors.grey.shade100),
                position: DecorationPosition.background,
                child: Padding(
                  padding: EdgeInsets.all(9),
                  child: Text(
                    'Adolf Hitler ( ID: 546 654 455 )',
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.grey.shade400,
                    ),
                  ),
                ),
              ),
              _buildTextShower('Verwendungszweck', 'Schulden'),
              _buildTextShower(
                  'Nachricht', 'Dein Anteil für Lisas Geburtstagsgeschenk :)'),
            ],
          ),
        ),
      ),
    );
  }
}
