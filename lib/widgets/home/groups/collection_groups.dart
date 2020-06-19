import 'package:flutter/material.dart';

class GroupCard extends StatelessWidget {
  final String title;

  GroupCard(this.title);

  Color _mainColor = Color(0xFF1ABC9C);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 20),
      width: MediaQuery.of(context).size.width * 0.85,
      height: 150,
      child: Stack(
        children: [
          Card(
            clipBehavior: Clip.hardEdge,
            color: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(25),
              ),
            ),
            child: Container(
              height: MediaQuery.of(context).size.width * 0.3,
              child: Column(children: <Widget>[
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Expanded(child: Container()),
                    Column(
                      mainAxisSize: MainAxisSize.max,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        SizedBox(height: 10),
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
                      ],
                    ),
                    SizedBox(width: 20)
                  ],
                ),
                Expanded(child: Container()),
                Container(
                  //TODO: @Dominik Wie spalte ich den Container farblich in 2 Teile auf, so dass ich den FlatButton nicht separat machen muss?
                  width: double.infinity,
                  color: _mainColor,
                  child: FlatButton(
                    padding: EdgeInsets.zero,
                    materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
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
                ),
              ]),
            ),
          ),
          Container(
            width: 125,
            child: Stack(
              children: [
                Align(
                  alignment: Alignment.topLeft,
                  child: Container(
                    height: 125,
                    width: 125,
                    decoration: BoxDecoration(
                        color: Colors.white, shape: BoxShape.circle),
                    child: CircularProgressIndicator(
                      value: 0.85,
                      strokeWidth: 10,
                      valueColor: AlwaysStoppedAnimation<Color>(Colors.red),
                      backgroundColor: Colors.grey.shade400,
                    ),
                  ),
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
        ],
      ),
    );
  }
}
