import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:gomobie/pages/home/transactions.dart';
import 'package:gomobie/widgets/home/family/family_card.dart';

class Family extends StatelessWidget {
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
                        //TODO: Move into own file
                        showDialog(
                            context: context,
                            builder: (context) {
                              final _form = GlobalKey<FormState>();
                              return Dialog(
                                child: Padding(
                                  padding: const EdgeInsets.all(8),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Row(
                                        children: [
                                          Expanded(child: Container()),
                                          IconButton(
                                            icon: Icon(Icons.close),
                                            onPressed: () =>
                                                Navigator.of(context).pop(),
                                          )
                                        ],
                                      ),
                                      Icon(Icons.add,
                                          size: 75,
                                          color:
                                              Theme.of(context).primaryColor),
                                      Text('Benutzer zur Familie hinzufügen'),
                                      SizedBox(height: 20),
                                      //TODO: Needs validation
                                      Form(
                                        key: _form,
                                        child: TextFormField(
                                          decoration: InputDecoration(
                                              hintText: 'Benutzer-ID'),
                                          validator: (id) {
                                            if (id.trim().isEmpty) {
                                              return 'Dieses Feld kann nicht leer sein';
                                            }
                                            return null;
                                          },
                                        ),
                                      ),
                                      SizedBox(height: 10),
                                      RaisedButton(
                                        child: Text('Anfrage senden'),
                                        textColor: Colors.white,
                                        shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(6)),
                                        elevation: 8,
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 92, vertical: 20),
                                        onPressed: () {
                                          //TODO: Add route
                                          _form.currentState.validate();
                                        },
                                      ),
                                      SizedBox(height: 5),
                                      Text('oder'),
                                      SizedBox(height: 5),
                                      RaisedButton(
                                        child:
                                            Text('Neues Kinderkonto erstellen'),
                                        textColor: Colors.white,
                                        shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(6)),
                                        elevation: 8,
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 50, vertical: 20),
                                        onPressed: () {
                                          //TODO: Add route
                                        },
                                      )
                                    ],
                                  ),
                                ),
                              );
                            });
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
