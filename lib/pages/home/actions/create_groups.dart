import 'package:flutter/material.dart';
import 'package:gomobie/util/generic_controller.dart';
import 'package:gomobie/widgets/birthday_form_field.dart';

import '../../home.dart';

class CreateGroup extends StatelessWidget {
  static const routeName = '/create_group';
  Color _mainColor = Color(0xFF1ABC9C);
  int _members = 2;
  final GenericController<DateTime> _dateController = GenericController();

  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _amountController = TextEditingController();
  final TextEditingController _purposeController = TextEditingController();

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
        child: Image.asset('assets/general_assets/group.png', height: 150),
      ),
      content: Text(
        'Sammelgruppe \n'
        'erfolgreich erstellt!',
        textAlign: TextAlign.center,
        style: TextStyle(
          color: Colors.black,
          fontWeight: FontWeight.bold,
          fontSize: 20,
        ),
      ),
      actions: [
        //Das Menü der Sammelgruppe ist in dem MVP noch nicht vorgesehen
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

  Widget _buildNameTextfield() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: TextFormField(
        controller: _nameController,
        decoration: InputDecoration(
          filled: true,
          fillColor: Color(0xFF949494).withOpacity(0.5),
          labelText: 'Gruppenname',
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
          labelText: 'Zielbetrag (in Euro)',
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

  Widget _buildDatePickerField() {
    return Padding(
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: Container(
          decoration: BoxDecoration(
            color: Color(0xFF949494).withOpacity(0.5),
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(4),
              topRight: Radius.circular(4),
            ),
          ),
          height: 55,
          child: Row(
            children: <Widget>[
              Padding(
                padding: EdgeInsets.only(left: 14),
                child: Text(
                  'Enddatum',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16.5,
                  ),
                ),
              ),
              Expanded(child: Container()),
              Padding(
                padding: EdgeInsets.only(right: 10),
                child: BirthdayFormField(
                  controller: _dateController,
                  buttonColor: Colors.white,
                  hintColor: Colors.black,
                  hint: 'Auswählen',
                  validator: (d) {
                    if (d == null) {
                      return 'Auswählen';
                    }
                    return null;
                  },
                  dialogBuilder: (BuildContext context, Widget child) {
                    return Theme(
                      data: ThemeData.light().copyWith(
                        primaryColor: const Color(0xFF1ABC9C),
                        accentColor: const Color(0xFF1ABC9C),
                        colorScheme: ColorScheme.light(
                          primary: const Color(0xFF1ABC9C),
                        ),
                        buttonTheme:
                            ButtonThemeData(textTheme: ButtonTextTheme.primary),
                      ),
                      child: child,
                    );
                  },
                  initialDate: DateTime.now(),
                  firstDate: DateTime.now(),
                  lastDate:
                      DateTime.now().add(Duration(days: (365.25 * 4).ceil())),
                  style: TextStyle(color: Colors.grey.shade800, fontSize: 15.0),
                ),
              ),
            ],
          ),
        ));
  }

  Widget _buildPurposeTextfield() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: TextFormField(
        maxLength: 200,
        controller: _purposeController,
        decoration: InputDecoration(
          counter: Offstage(),
          filled: true,
          fillColor: Color(0xFF949494).withOpacity(0.5),
          labelText: 'Sammelzweck',
          labelStyle: TextStyle(color: Colors.white),
        ),
        style: TextStyle(color: Colors.white),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'SAMMELGRUPPE ERSTELLEN',
          style: TextStyle(color: Colors.white),
        ),
      ),
      resizeToAvoidBottomInset: true,
      body: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage('assets/backgrounds/group_background.png'),
                fit: BoxFit.fill)),
        child: Material(
          color: Colors.grey.shade800.withOpacity(0.89),
          child: SafeArea(
            child: Center(
              child: SingleChildScrollView(
                child: Column(
                  //TODO: Make this column scrollable
                  mainAxisSize: MainAxisSize.max,
                  children: <Widget>[
                    SizedBox(
                      height: MediaQuery.of(context).size.width * 0.1,
                    ),
                    CircleAvatar(
                      radius: 60,
                      child: Stack(
                        children: [
                          Positioned(
                            top: 30,
                            left: 30,
                            child: IconButton(
                              icon: Icon(
                                Icons.add,
                                color: Colors.grey,
                                size: 60,
                              ),
                              padding: EdgeInsets.only(),
                              onPressed: () {
                                //TODO: Add upload image page and upload it to Firebase
                              },
                            ),
                          ),
                        ],
                      ),
                      backgroundColor: Colors.white,
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.width * 0.03,
                    ),
                    Text(
                      'Profilbild hinzufügen',
                      style: TextStyle(color: Colors.white),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.width * 0.1,
                    ),
                    _buildNameTextfield(),
                    SizedBox(
                      height: MediaQuery.of(context).size.width * 0.05,
                    ),
                    _buildAmountTextfield(),
                    SizedBox(
                      height: MediaQuery.of(context).size.width * 0.05,
                    ),
                    _buildDatePickerField(),
                    SizedBox(
                      height: MediaQuery.of(context).size.width * 0.05,
                    ),
                    _buildPurposeTextfield(),
                    SizedBox(
                      height: MediaQuery.of(context).size.width * 0.05,
                    ),
                    SizedBox(),
                    Column(
                      children: <Widget>[
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            //TODO: Hier die Profilbilder aller Member platzieren, sobald welche hinzugefügt wurden
                            Column(
                              children: <Widget>[
                                FloatingActionButton(
                                  heroTag: 'floating',
                                  elevation: 5,
                                  child: Icon(Icons.add),
                                  onPressed: () {
                                    //TODO: Backend: Now people must be includable to the group
                                  },
                                ),
                                SizedBox(
                                  height:
                                      MediaQuery.of(context).size.width * 0.03,
                                ),
                                Text(
                                  'Mitglieder hinzufügen',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w100,
                                  ),
                                ),
                                SizedBox(
                                  height:
                                      MediaQuery.of(context).size.width * 0.04,
                                ),
                              ],
                            ),
                          ],
                        ),
                        SizedBox(
                          width: double.infinity,
                          height: MediaQuery.of(context).size.width * 0.17,
                          child: RaisedButton(
                            elevation: 30,
                            color: Color(0xFF1ABC9C),
                            onPressed: _members <= 1
                                ? null
                                : () {
                                    //TODO: Gruppe in Firebase hinzufügen und auf den Sammelgruppen-Screen zeigen
                                    showAlertDialog(context);
                                  },
                            child: Text(
                              'GRUPPE ERSTELLEN',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w700),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
