import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class HiddenCardData extends StatefulWidget {
  HiddenCardData({Key key}) : super(key: key);

  @override
  _HiddenCardDataState createState() => _HiddenCardDataState();
}

class _HiddenCardDataState extends State<HiddenCardData> {
  final String cardNumber = '1234 5678 9012 3456';
  final String cvc = '371';

  TextStyle titleStyle = TextStyle(
    fontWeight: FontWeight.bold,
    color: Colors.black,
  );
  bool hide = true;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Row(
          children: [
            Expanded(child: Container()),
            IconButton(
              icon: Icon(Icons.close),
              onPressed: () => Navigator.of(context).pop(),
            )
          ],
        ),
        Text('Kartennummer', style: titleStyle),
        Row(
          children: <Widget>[
            Text(hide
                ? cardNumber.replaceRange(2, 17, '** **** **** **')
                : cardNumber),
            Expanded(
              child: Container(),
            ),
            IconButton(
              icon: Icon(Icons.content_copy),
              onPressed: () {
                Clipboard.setData(ClipboardData(text: cardNumber));
              },
            ),
          ],
        ),
        Text('Karteninhaber', style: titleStyle),
        Row(
          children: <Widget>[
            Text('Dominik Schuwa'),
            Expanded(
              child: Container(),
            ),
            IconButton(
              icon: Icon(Icons.content_copy),
              onPressed: () {
                Clipboard.setData(ClipboardData(text: 'Dominik Schuwa'));
              },
            ),
          ],
        ),
        Text('Gültig bis', style: titleStyle),
        Row(
          children: <Widget>[
            Text('12/21'),
            Expanded(
              child: Container(),
            ),
            IconButton(
              icon: Icon(Icons.content_copy),
              onPressed: () {
                Clipboard.setData(ClipboardData(text: '21/21'));
              },
            ),
          ],
        ),
        Text('CVC', style: titleStyle),
        Row(
          children: <Widget>[
            Text(hide ? '***' : cvc),
            Expanded(
              child: Container(),
            ),
            IconButton(
              icon: Icon(Icons.content_copy),
              onPressed: () {
                Clipboard.setData(ClipboardData(text: cvc));
              },
            ),
          ],
        ),
        SizedBox(height: 10),
        Row(
          children: <Widget>[
            Expanded(
              child: RaisedButton(
                child: Text(hide ? 'Anzeigen' : 'Verstecken'),
                textColor: Colors.white,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(6)),
                elevation: 8,
                padding: EdgeInsets.symmetric(horizontal: 92, vertical: 20),
                onPressed: () {
                  setState(() {
                    hide = !hide;
                  });
                },
              ),
            ),
          ],
        )
      ],
    );
  }
}