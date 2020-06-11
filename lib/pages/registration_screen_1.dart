import 'package:flutter/material.dart';

class RegistrationScreenOne extends StatefulWidget {
  @override
  _RegistrationScreenOneState createState() => _RegistrationScreenOneState();
}

class _RegistrationScreenOneState extends State<RegistrationScreenOne> {
  List<String> availableCountries = ['Deutschland', 'Österreich'];
  List<String> titles = ['Herr', 'Frau', 'Andere'];

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
                height: 30.0,
              ),
              Row(
                children: <Widget>[
                  Text('Land'),
                  /*
                  DropdownButton<String>(
                    items: availableCountries,
                  ),*/
                ],
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
