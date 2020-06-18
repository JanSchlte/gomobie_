import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:gomobie/util/home_painter.dart';
import 'package:provider/provider.dart';
import 'package:qr_flutter/qr_flutter.dart';

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
                  ? SingleChildScrollView(
                      child: Column(
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
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  _buildIconButton(
                                      AssetImage(
                                          'assets/icon_buttons/money_get.png'),
                                      null),
                                  _buildIconButton(
                                      AssetImage(
                                          'assets/icon_buttons/money_send.png'),
                                      null),
                                  _buildIconButton(
                                      AssetImage(
                                          'assets/icon_buttons/money_get.png'),
                                      null),
                                ],
                              ),
                              //TODO: Add Family stack
                            ],
                          ),
                          Container(
                            width: double.infinity,
                            padding: EdgeInsets.only(top: 20),
                            color: Color(0xFF474747),
                            child: Wrap(
                              alignment: WrapAlignment.center,
                              children: [
                                _buildMockCollectionGroupCard(context),
                                _buildMockBillCard(context),
                                _buildAddFriendCard(context),
                                _buildQrCodeCard(context)
                              ],
                            ),
                          ),
                        ],
                      ),
                    )
                  : Text('LOADING...'),
            ),
          ),
        ));
  }

  Card _buildMockCollectionGroupCard(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(25),
        ),
      ),
      child: Container(
        width: MediaQuery.of(context).size.width * 0.44,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(
              height: 10,
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 20),
              child: Text(
                'Sammelgruppen',
                style: _headlinesBlack,
                textAlign: TextAlign.center,
              ),
            ),
            Container(
              height: 90,
              width: 90,
              margin: EdgeInsets.symmetric(vertical: 30),
              child: Stack(
                fit: StackFit.expand,
                children: [
                  CircularProgressIndicator(
                    value: 0.8,
                    strokeWidth: 6,
                    valueColor: AlwaysStoppedAnimation<Color>(_mainColor),
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
    );
  }

  Card _buildMockBillCard(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(25),
        ),
      ),
      color: _mainColor,
      child: Container(
        width: MediaQuery.of(context).size.width * 0.44,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(
              height: 10,
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 10),
              child: Text(
                'Offene Rechnungen',
                style: _headlinesWhite,
                textAlign: TextAlign.center,
              ),
            ),
            Container(
                height: 150,
                child: Text(
                  '34.99€',
                  style: _headlinesWhite,
                )),
          ],
        ),
      ),
    );
  }

  Card _buildAddFriendCard(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(25),
        ),
      ),
      color: _mainColor.withOpacity(0.5),
      child: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            fit: BoxFit.scaleDown,
            image:
                AssetImage('assets/registration_screens/registration_head.png'),
          ),
          color: _mainColor.withOpacity(0.8),
          borderRadius: BorderRadius.all(
            Radius.circular(25),
          ),
        ),
        width: MediaQuery.of(context).size.width * 0.44,
        height: MediaQuery.of(context).size.width * 0.44,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.add,
              color: Colors.white,
              size: 42,
            ),
            Text(
              'Freund hinzufügen',
              style: TextStyle(color: Colors.white),
            )
          ],
        ),
      ),
    );
  }

  InkResponse _buildQrCodeCard(BuildContext context) {
    return InkWell(
      onTap: () {
        showDialog(
          context: context,
          builder: (context) {
            return Dialog(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    color: _mainColor,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(width: 20),
                        Text('QR-Code'),
                        IconButton(
                          icon: Icon(Icons.close),
                          onPressed: () => Navigator.of(context).pop(),
                        )
                      ],
                    ),
                  ),
                  QrImage(
                    data: context.watch<AuthProvider>().userId,
                    padding: EdgeInsets.all(10),
                  ),
                ],
              ),
            );
          },
        );
      },
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(25),
          ),
        ),
        child: SizedBox(
          width: MediaQuery.of(context).size.width * 0.44,
          height: MediaQuery.of(context).size.width * 0.44,
          child: Material(
            color: Color(0xFFEEEEEE),
            borderRadius: BorderRadius.all(
              Radius.circular(25),
            ),
            child: Stack(
              children: [
                QrImage(
                  data: context.watch<AuthProvider>().userId,
                  padding: EdgeInsets.all(30),
                ),
                Align(
                  child: Icon(
                    Icons.search,
                    color: _mainColor,
                    size: 100,
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
