import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:gomobie/pages/home/actions/make_transactions.dart';
import 'package:gomobie/pages/home/groups.dart';
import 'package:gomobie/util/card_background_painter.dart';
import 'package:gomobie/util/home_painter.dart';
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

  bool sending;

  Widget _buildIconButton(AssetImage icon, VoidCallback onPressed) {
    return InkResponse(
      //TODO: Add action
      onTap: () {},
      child: CircleAvatar(
        radius: 25,
        child: Image(image: icon, fit: BoxFit.contain),
        backgroundColor: Color(0xFF505050),
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
                          child: Stack(
                            children: [
                              Positioned(
                                top: 30,
                                left: 30,
                                child: IconButton(
                                  icon: Icon(
                                    Icons.add,
                                    color: _mainColor,
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
                        Stack(
                          children: [
                            Padding(
                              padding: EdgeInsets.only(top: 26),
                              child: CustomPaint(
                                painter: HomePainter(),
                                child: Container(
                                  width: double.infinity,
                                  child: Column(
                                    children: [
                                      SizedBox(height: 50),
                                      Text('Hello')
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                InkResponse(
                                  onTap: () {
                                    Navigator.of(context).pushNamed(
                                        TransactionScreen.routeName,
                                        arguments: {
                                          sending: false,
                                        });
                                  },
                                  child: CircleAvatar(
                                    radius: 25,
                                    child: Image(
                                        image: AssetImage(
                                            'assets/icon_buttons/money_get.png'),
                                        fit: BoxFit.contain),
                                    backgroundColor: Color(0xFF505050),
                                  ),
                                ),
                                InkResponse(
                                  onTap: () {
                                    Navigator.of(context).pushNamed(
                                        TransactionScreen.routeName,
                                        arguments: {
                                          sending: true,
                                        });
                                  },
                                  child: CircleAvatar(
                                    radius: 25,
                                    child: Image(
                                        image: AssetImage(
                                            'assets/icon_buttons/money_send.png'),
                                        fit: BoxFit.contain),
                                    backgroundColor: Color(0xFF505050),
                                  ),
                                ),
                                InkResponse(
                                  onTap: () {
                                    Navigator.pushNamed(
                                        context, CollectionGroups.routeName);
                                  },
                                  child: CircleAvatar(
                                    radius: 25,
                                    child: Image(
                                        image: AssetImage(
                                            'assets/icon_buttons/group_icon_button.png'),
                                        fit: BoxFit.contain),
                                    backgroundColor: Color(0xFF505050),
                                  ),
                                ),
                              ],
                            )
                          ],
                        ),
                        SizedBox(
                          height: 25,
                        ),
                        Wrap(
                          children: [
                            CustomPaint(
                              painter: CardBackgroundPainter(
                                  backgroundColor: Color(0xFFffffff)),
                              child: Container(
                                width: MediaQuery.of(context).size.width * 0.45,
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
                                                AlwaysStoppedAnimation<Color>(
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
                            ),
                            SizedBox(
                              width: 25,
                            ),
                            CustomPaint(
                              painter: CardBackgroundPainter(
                                  backgroundColor: _mainColor),
                              child: Container(
                                width: MediaQuery.of(context).size.width * 0.45,
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Padding(
                                      padding: EdgeInsets.all(10),
                                      child: Text(
                                        'Offene Rechnungen',
                                        style: _headlinesWhite,
                                        textAlign: TextAlign.center,
                                      ),
                                    ),
                                    Container(
                                        height: 90,
                                        margin: EdgeInsets.all(30),
                                        child: Text(
                                          '34.99€',
                                          style: _headlinesWhite,
                                        )),
                                  ],
                                ),
                              ),
                            )
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
