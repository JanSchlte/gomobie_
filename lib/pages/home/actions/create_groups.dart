import 'package:flutter/material.dart';
import 'package:gomobie/widgets/birthday_form_field.dart';

class CreateGroup extends StatelessWidget {
  static const routeName = '/create_group';
  Color _mainColor = Color(0xFF1ABC9C);
  int _members = 1;

  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _amountController = TextEditingController();
  final TextEditingController _purposeController = TextEditingController();

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

  Widget _buildDatePicker() {
    return Padding(
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: Container(
          color: Color(0xFF949494).withOpacity(0.5),
          child: Row(
            children: <Widget>[
              Padding(
                padding: EdgeInsets.only(left: 10),
                child: Text(
                  'Enddatum',
                  style: TextStyle(color: Colors.white),
                ),
              ),
              /*BirthdayFormField(
                //TODO: Make the DatePicker work
                lastDate: DateTime.now().add(Duration(days: 365)),
                initialDate: DateTime.now(),
                firstDate: DateTime.now(),
              ),*/
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
      resizeToAvoidBottomInset: false,
      body: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage('assets/backgrounds/group_background.png'),
                fit: BoxFit.fill)),
        child: Material(
          color: Colors.grey.shade800.withOpacity(0.89),
          child: SafeArea(
            child: Center(
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: <Widget>[
                  SizedBox(
                    height: MediaQuery.of(context).size.width * 0.05,
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
                        Align(
                          alignment: Alignment(0, 0.55),
                          child: Text(
                            'Bild hinzufügen',
                            style: Theme.of(context).textTheme.caption,
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ],
                    ),
                    backgroundColor: Colors.white,
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
                  _buildNameTextfield(),
                  SizedBox(
                    height: MediaQuery.of(context).size.width * 0.05,
                  ),
                  _buildAmountTextfield(),
                  SizedBox(
                    height: MediaQuery.of(context).size.width * 0.05,
                  ),
                  _buildDatePicker(),
                  SizedBox(
                    height: MediaQuery.of(context).size.width * 0.05,
                  ),
                  _buildPurposeTextfield(),
                  SizedBox(
                    height: MediaQuery.of(context).size.width * 0.05,
                  ),
                  FloatingActionButton(
                    elevation: 5,
                    child: Icon(Icons.add),
                    onPressed: () {
                      //TODO: Add Group to Firebase
                    },
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.width * 0.02,
                  ),
                  Text(
                    'Mitglieder hinzufügen',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w100,
                    ),
                  ),
                  Expanded(
                    child: SizedBox(),
                  ),
                  SizedBox(
                    width: double.infinity,
                    height: MediaQuery.of(context).size.width * 0.17,
                    child: RaisedButton(
                      elevation: 30,
                      color: Color(0xFF1ABC9C),
                      onPressed: _members <= 1 ? null : () {},
                      child: Text(
                        'GRUPPE ERSTELLEN',
                        style: TextStyle(
                            color: Colors.white, fontWeight: FontWeight.w700),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
