import 'package:flutter/material.dart';
import 'package:gomobie/util/card_background_painter.dart';

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
          painter: CardBackgroundPainter(backgroundColor: Colors.black12),
          child: Container(
            width: MediaQuery.of(context).size.width * 0.85,
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
                        value: 0.85,
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
                                color: Colors.red,
                              ),
                            ),
                            Text(
                              '100.00€',
                              style: TextStyle(
                                color: Colors.grey.shade800,
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
                SizedBox(
                  width: 25,
                ),
                Column(
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      title,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: _mainColor,
                        fontWeight: FontWeight.bold,
                        fontSize: 15,
                      ),
                    ),
                    SizedBox(height: 10),
                    Text(
                      'Enddatum: 24.03.2020',
                      style: TextStyle(
                        color: Colors.grey.shade800,
                      ),
                    ),
                    FlatButton(
                      onPressed: () {
                        // Nicht vorhergesehen beim MVP
                      },
                      child: Text(
                        'DETAILS',
                        style: TextStyle(color: Colors.grey.shade800),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
        /*
        SizedBox(
          //TODO: @Dominik Wie spalte ich den Container farblich in 2 Teile auf, so dass ich den FlatButton nicht separat machen muss?
          width: MediaQuery.of(context).size.width * 0.8,
          height: MediaQuery.of(context).size.width * 0.09,
          child: FlatButton(
            color: _mainColor,
            onPressed: () {},
            child: Align(
              alignment: Alignment(0.49, 0),
              child: Text(
                'DETAILS',
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),
        ),*/
      ],
    );
  }
}
