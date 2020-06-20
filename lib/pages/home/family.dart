import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:gomobie/pages/home/transactions.dart';
import 'package:gomobie/widgets/home/family/family_card.dart';

class Family extends StatelessWidget {
  showAlertDialog(BuildContext context) {
    Widget requestButton = Padding(
      padding: EdgeInsets.only(left: 15, right: 15, bottom: 15),
      child: SizedBox(
        height: 50,
        width: 380,
        child: FlatButton(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(5),
            ),
          ),
          child: Text(
            'ANFRAGE SENDEN',
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          ),
          color: Color(0xFF1ABC9C),
          onPressed: () {
            //TODO: Implement Backend (Anfrage senden)
          },
        ),
      ),
    );

    Widget createAccountButton = Padding(
      padding: EdgeInsets.only(left: 15, right: 15, bottom: 15),
      child: SizedBox(
        height: 70,
        width: 380,
        child: FlatButton(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(5),
            ),
          ),
          child: Text(
            'NEUES KINDERKONTO \n'
            'ANLEGEN',
            textAlign: TextAlign.center,
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          ),
          color: Color(0xFF1ABC9C),
          onPressed: () {
            //TODO: Zum Kinderkonto-Erstellen Screen navigieren
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
      title: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Image.asset(
              'assets/general_assets/plus.png',
              height: 45,
            ),
            SizedBox(
              height: 15,
            ),
            Text(
              'Benutzer zur Familie hinzufügen',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.grey.shade500,
                fontSize: 12,
              ),
            ),
            TextField(
              decoration: InputDecoration(
                labelText: 'Benutzer ID',
                //TODO: Avoid Bottom Overflow despite SingelChildScrollView
              ),
            ),
          ],
        ),
      ),
      actions: [
        requestButton,
        Center(
          child: Text(
            'oder',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.grey.shade500,
            ),
          ),
        ),
        SizedBox(
          height: 15,
        ),
        createAccountButton
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
    return SafeArea(
      child: Center(
        child: Column(
          children: [
            SizedBox(height: 20),
            Image.asset(
              'assets/general_assets/family.png',
              height: 170,
            ),
            SizedBox(height: 10),
            Text(
              'Familie',
              style: TextStyle(fontSize: 23, fontWeight: FontWeight.w500),
            ),
            Text('Familienmitglieder'),
            SizedBox(height: 50),
            Stack(
              fit: StackFit.loose,
              children: [
                Padding(
                  padding:
                      const EdgeInsets.only(left: 16, right: 16, bottom: 35),
                  child: Card(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(20))),
                    elevation: 3,
                    child: Column(
                      children: [
                        //TODO: Fetch from firebase
                        FamilyCard(
                            name: 'Tobias Henning', type: AccountType.owner),
                        FamilyCard(
                            name: 'Emma Henning', type: AccountType.owner),
                        FamilyCard(
                            name: 'Mattis Henning', type: AccountType.child),
                      ],
                    ),
                  ),
                ),
                Positioned.fill(
                  child: Align(
                    alignment: Alignment.bottomCenter,
                    child: FloatingActionButton.extended(
                      onPressed: () {
                        showAlertDialog(context);
                      },
                      label: Text('Hinzufügen'),
                      icon: Icon(Icons.add),
                    ),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
