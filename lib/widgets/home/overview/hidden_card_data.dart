import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:gomobie/provider/user_data/user_data_bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';

class HiddenCardData extends StatefulWidget {
  // ignore: public_member_api_docs
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
  String getUserName() {
    BlocBuilder<UserDataBloc, UserDataState>(
        bloc: GetIt.I.get<UserDataBloc>(),
        builder: (context, state) {
          if (state is LoggedInUserState) {
            return Text(
              state.name,
            );
          }
          return Text('Error');
        });
  }

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
            Text('${getUserName()}'),
            Expanded(
              child: Container(),
            ),
            IconButton(
              icon: Icon(Icons.content_copy),
              onPressed: () {
                Clipboard.setData(ClipboardData(text: '${getUserName()}'));
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
