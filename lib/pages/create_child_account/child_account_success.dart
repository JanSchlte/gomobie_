import 'package:flutter/material.dart';

class ChildRegistrationSuccess extends StatelessWidget {
  static const routeName = '/child_register_success';

  Widget _buildContinueButton() {
    return RaisedButton(
      onPressed: () {
        //Navigator.of(context).pushNamed(home-route.routeName);
        //TODO: Insert Home-Route
      },
      child: Text('FERTIG'),
      textColor: Colors.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(6)),
      elevation: 8,
      padding: EdgeInsets.symmetric(horizontal: 137, vertical: 20),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Image.asset(
                'assets/child_account/kinderkonto_successful.png',
                height: 150,
                //TODO: Higher resolution
              ),
              SizedBox(
                height: 20.0,
              ),
              Text(
                'Einrichtung eines \n'
                'Kinderkontos erfolgreich!',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 22.0,
                  fontWeight: FontWeight.w600,
                ),
              ),
              SizedBox(
                height: 20.0,
              ),
              Text(
                'Bitte bestätigen Sie den Link in der \n'
                'Bestätigungsmail, um das Konto zu \n'
                'aktivieren.',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 15.0,
                  color: Colors.grey,
                ),
              ),
              SizedBox(
                height: 150.0,
              ),
              _buildContinueButton(),
              SizedBox(
                height: 50.0,
              ),
              Text(
                'Weitere Einstellungen können Sie über das',
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.grey),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  ButtonTheme(
                    materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                    padding: EdgeInsets.zero,
                    minWidth: 0,
                    height: 0,
                    child: FlatButton(
                      onPressed: () {
                        //TODO: Insert Home-Route
                        //Navigator.of(context).pushNamed(home-route.routeName);
                      },
                      child: Text(
                        'Verwaltungskonto',
                        style: TextStyle(color: Theme.of(context).primaryColor),
                      ),
                    ),
                  ),
                  Text(
                    ' durchführen',
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.grey),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
