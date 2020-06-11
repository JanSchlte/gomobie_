import 'package:flutter/material.dart';

class RegistrationScreenOne extends StatefulWidget {
  @override
  _RegistrationScreenOneState createState() => _RegistrationScreenOneState();
}

class _RegistrationScreenOneState extends State<RegistrationScreenOne> {
  String country = '';
  String title = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Center(
          child: Column(
            children: <Widget>[
              SizedBox(
                height: 30.0,
              ),
              Image.asset('assets/registration_screens/registration_head.png'),
              SizedBox(height: 30.0),
              Text(
                'Persönliche Daten',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 22.0,
                  fontWeight: FontWeight.w600,
                ),
              ),
              SizedBox(
                height: 48.0,
              ),
              Row(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(left: 40.0),
                    child: Text(
                      'Land',
                      style: TextStyle(
                          color: Colors.grey.shade500, fontSize: 15.0),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 190.0),
                    // TODO: Adjust the position so that it is not hard coded but dependent on the individual screen size
                    child: DropdownButton<String>(
                      style: TextStyle(fontSize: 15.0),
                      hint: country == '' ? Text('Auswählen') : Text(country),
                      items: <String>['Deutschland', 'Österreich']
                          .map((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                      onChanged: (String newValue) {
                        setState(() {
                          country = newValue;
                        });
                      },
                    ),
                  )
                ],
              ),
              SizedBox(
                height: 4.0,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 40.0),
                child: Container(
                  height: 3.0,
                  color: Colors.grey.shade200,
                ),
              ),
              Row(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(left: 40.0),
                    child: Text(
                      'Anrede',
                      style: TextStyle(
                          color: Colors.grey.shade500, fontSize: 15.0),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 190.0),
                    // TODO: Adjust the position so that it is not hard coded but dependent on the individual screen size
                    child: DropdownButton<String>(
                      style: TextStyle(
                        color: Colors.grey.shade500,
                        fontSize: 15,
                      ),
                      hint: title == '' ? Text('Auswählen') : Text(title),
                      items: <String>['Herr', 'Frau', 'Andere']
                          .map((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                      onChanged: (String newValue) {
                        setState(() {
                          title = newValue;
                        });
                      },
                    ),
                  )
                ],
              ),
              SizedBox(
                height: 4.0,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 40.0),
                child: Container(
                  height: 3.0,
                  color: Colors.grey.shade200,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
