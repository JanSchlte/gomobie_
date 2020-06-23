import 'package:flutter/material.dart';

class GroupDetails extends StatelessWidget {
  final String groupName;
  final double moneyAvailable;
  final double moneyNeeded;

  GroupDetails(this.groupName, this.moneyAvailable, this.moneyNeeded);

  Color _mainColor = Color(0xFF1ABC9C);
  TextStyle _contentStyle = TextStyle(
    color: Colors.white,
    fontSize: 15,
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          groupName.toUpperCase(),
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ),
      body: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
                //TODO: Add the Group-Profile-Picture from Firebase
                image: AssetImage('assets/backgrounds/group_background.png'),
                fit: BoxFit.fill)),
        child: Material(
          color: Colors.grey.shade800.withOpacity(0.89),
          child: SafeArea(
            child: Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.05,
                  ),
                  Container(
                    height: 175,
                    width: 175,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                        image:
                            AssetImage('assets/fake_backend/fake_avatar.jpg'),
                        fit: BoxFit.fill,
                      ),
                    ),
                    child: CircularProgressIndicator(
                      value: moneyAvailable / moneyNeeded,
                      strokeWidth: 10,
                      valueColor: AlwaysStoppedAnimation<Color>(_mainColor),
                      backgroundColor: Colors.white,
                    ),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.05,
                  ),
                  Column(
                    children: <Widget>[
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text(
                            '${moneyAvailable.toString()}€',
                            style: TextStyle(
                              color: _mainColor,
                              fontSize: 30,
                            ),
                          ),
                          Text(
                            '/${moneyNeeded.toString()}€',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 30,
                            ),
                          ),
                        ],
                      ),
                      Text(
                        'gesammelt',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 30,
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: <Widget>[
                      Padding(
                        padding: EdgeInsets.only(left: 35, top: 40),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              'Enddatum',
                              style: _contentStyle,
                            ),
                            SizedBox(
                              height: MediaQuery.of(context).size.height * 0.03,
                            ),
                            Text(
                              'Sammelzweck',
                              style: _contentStyle,
                            ),
                            SizedBox(
                              height: MediaQuery.of(context).size.height * 0.03,
                            ),
                            Text(
                              'Betrag',
                              style: _contentStyle,
                            ),
                            SizedBox(
                              height: MediaQuery.of(context).size.height * 0.03,
                            ),
                            Text(
                              'Gruppenadmin',
                              style: _contentStyle,
                            ),
                          ],
                        ),
                      ),
                      Expanded(
                        child: SizedBox(),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 40, right: 40),
                        child: Column(
                          //TODO: Fetch this group-data from Firebase (Backend)
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: <Widget>[
                            Text(
                              '24.03.2020',
                              style: _contentStyle,
                            ),
                            SizedBox(
                              height:
                                  MediaQuery.of(context).size.height * 0.025,
                            ),
                            Text(
                              'Fußball',
                              style: _contentStyle,
                            ),
                            SizedBox(
                              height:
                                  MediaQuery.of(context).size.height * 0.025,
                            ),
                            Text(
                              '${moneyNeeded.toString()}€',
                              style: _contentStyle,
                            ),
                            SizedBox(
                              height:
                                  MediaQuery.of(context).size.height * 0.025,
                            ),
                            Text(
                              'Moritz',
                              style: _contentStyle,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.07,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      //TODO: Add the profile-pictures of group-members
                      Container(
                        height: 70,
                        width: 70,
                        child: FloatingActionButton(
                          heroTag: 'floating',
                          elevation: 5,
                          child: Icon(
                            Icons.add,
                            size: 25,
                          ),
                          onPressed: () {
                            //TODO: Backend: Now people must be includable to the group
                          },
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
    );
  }
}
