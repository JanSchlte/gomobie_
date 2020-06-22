import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:gomobie/pages/home/transactions.dart';
import 'package:gomobie/provider/user_data/user_data_bloc.dart';
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
                labelStyle:
                    TextStyle(color: Colors.grey.shade500, fontSize: 13),
                //TODO: Avoid Bottom Overflow despite usage of SingelChildScrollView and resizeToAvoidBottomOverflow = true (Scaffold)
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
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: SafeArea(
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
                  Container(
                    padding:
                        const EdgeInsets.only(left: 16, right: 16, bottom: 35),
                    width: double.infinity,
                    child: Card(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(20))),
                      elevation: 3,
                      child: BlocBuilder<UserDataBloc, UserDataState>(
                          bloc: GetIt.I.get<UserDataBloc>(),
                          builder: (context, snapshot) {
                            if (snapshot is UserStandardData) {
                              return Column(
                                children: [
                                  for (final child in snapshot.children)
                                    FamilyCard(
                                        name: child.name,
                                        type: AccountType.child)
                                ],
                              );
                            }
                            return Container();
                          }),
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
      ),
    );
  }
}
