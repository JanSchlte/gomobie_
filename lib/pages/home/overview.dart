import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../provider/auth_provider.dart';

class Overview extends StatelessWidget {
  Color _mainColor = Color(0xFF1ABC9C);
  TextStyle _headlinesBlack = TextStyle(
    fontWeight: FontWeight.bold,
    fontSize: 20,
  );
  TextStyle _headlinesWhite = TextStyle(
    fontWeight: FontWeight.bold,
    fontSize: 20,
    color: Colors.white,
  );

  Widget _buildIconButton(Icon icon, Function function) {
    return Padding(
      padding: EdgeInsets.all(15),
      child: CircleAvatar(
        radius: 30,
        child: IconButton(
          icon: icon,
          iconSize: 30,
          color: Colors.white,
          onPressed: () {
            function;
          },
        ),
        backgroundColor: _mainColor,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final provider = context.watch<AuthProvider>();
    return Container(
        decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage('assets/backgrounds/skyscrapers.jpg'),
              fit: BoxFit.fill),
        ),
        child: Material(
          color: Colors.grey.shade800.withOpacity(0.75),
          child: SafeArea(
            child: Center(
              child: provider.hasData
                  ? Column(
                      children: [
                        CircleAvatar(
                          radius: 60,
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              IconButton(
                                icon: Icon(
                                  Icons.add,
                                  color: _mainColor,
                                  size: 80,
                                  //TODO: Flutter scaled den Button innerhalb des CircleAvatars nicht korrekt. Issue muss noch behoben werden. Changed by min-AxisSiize
                                ),
                                onPressed: () {
                                  //TODO: Add upload image page and upload it to Firebase
                                },
                              ),
                              /*Text(
                                'Bild hinzufügen',
                                style: Theme.of(context).textTheme.caption,
                                textAlign: TextAlign.center,
                              ),*/
                            ],
                          ),
                          backgroundColor: Colors.white,
                        ),
                        SizedBox(
                          height: 25,
                        ),
                        Text(
                          provider.userData.name,
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w500,
                              fontSize: 25),
                        ),
                        SizedBox(
                          height: 25,
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 15),
                          child: Card(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(25.0),
                            ),
                            child: Column(
                              children: [
                                Padding(
                                  padding: EdgeInsets.symmetric(horizontal: 25),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      _buildIconButton(
                                          Icon(Icons.attach_money), null),
                                      _buildIconButton(
                                          Icon(Icons.money_off), null),
                                      _buildIconButton(Icon(Icons.group), null),
                                    ],
                                  ),
                                ),
                                /*Text(
                                //Warum diese komische Angabe?
                                    '${(provider.userData.balance / 100).toStringAsFixed(2)}€'),*/
                              ],
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 25,
                        ),
                        Wrap(
                          children: [
                            Card(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(25.0),
                              ),
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Padding(
                                    padding: EdgeInsets.all(10),
                                    child: Text(
                                      'Sammelgruppen',
                                      style: _headlinesBlack,
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                  Container(
                                    height: 90,
                                    width: 90,
                                    margin: EdgeInsets.all(30),
                                    child: Stack(
                                      fit: StackFit.expand,
                                      children: [
                                        CircularProgressIndicator(
                                          value: 0.8,
                                          strokeWidth: 6,
                                          valueColor:
                                              new AlwaysStoppedAnimation<Color>(
                                                  _mainColor),
                                        ),
                                        Align(
                                          alignment: Alignment.center,
                                          child: Column(
                                            mainAxisSize: MainAxisSize.min,
                                            children: [
                                              Text(
                                                '80.00€/',
                                                style: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                              Text(
                                                '100.00€',
                                                style: TextStyle(
                                                  color: _mainColor,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                            ],
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              width: 25,
                            ),
                            Card(
                              color: _mainColor,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(25.0),
                              ),
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Padding(
                                    padding: EdgeInsets.all(10),
                                    child: Text(
                                      'Offene\nRechnungen',
                                      style: _headlinesWhite,
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                  Container(
                                      height: 90,
                                      width: 90,
                                      margin: EdgeInsets.all(30),
                                      child: Text(
                                        '34.99€',
                                        style: _headlinesWhite,
                                      )),
                                ],
                              ),
                            ),
                            /*Card(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(5.0),
                              ),
                              child: Container(
                                color: _mainColor,
                                height: 145,
                                width: 130,
                                child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      'Offene\nRechnungen',
                                      style: _headlines,
                                      textAlign: TextAlign.center,
                                    ),
                                    Text('-34.99€'),
                                    SizedBox()
                                  ],
                                ),
                              ),
                            ),*/
                          ],
                        ),
                      ],
                    )
                  : Text('LOADING...'),
            ),
          ),
        ));
  }
}
