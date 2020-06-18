import 'package:flutter/material.dart';
import 'package:gomobie/util/card_background_painter.dart';
import 'package:gomobie/util/home_painter.dart';

class GroupCard extends StatelessWidget {
  final String title;

  GroupCard(this.title);

  Color _mainColor = Color(0xFF1ABC9C);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        SizedBox(
          height: 30,
        ),
        CustomPaint(
          painter: CardBackgroundPainter(backgroundColor: Colors.white),
          child: Container(
            width: MediaQuery.of(context).size.width * 0.8,
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  height: MediaQuery.of(context).size.width * 0.3,
                  width: MediaQuery.of(context).size.width * 0.3,
                  //margin: EdgeInsets.all(30),
                  child: Stack(
                    fit: StackFit.expand,
                    children: [
                      CircularProgressIndicator(
                        value: 0.8,
                        strokeWidth: 10,
                        valueColor: AlwaysStoppedAnimation<Color>(Colors.red),
                        backgroundColor: Colors.grey.shade400,
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
                                color: Colors.red,
                              ),
                            ),
                            Text(
                              '100.00€',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.grey.shade500,
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
                Column(
                  children: <Widget>[
                    Text(
                      title,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: _mainColor,
                        fontWeight: FontWeight.bold,
                        fontSize: 10,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
        SizedBox(
          width: MediaQuery.of(context).size.width * 0.8,
          height: MediaQuery.of(context).size.width * 0.09,
          child: FlatButton(
            color: _mainColor,
            onPressed: () {},
            child: Align(
              alignment: Alignment(0.33, 0),
              child: Text(
                'DETAILS',
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
