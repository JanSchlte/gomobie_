import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../provider/auth_provider.dart';

class Overview extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final provider = context.watch<AuthProvider>();
    return Container(
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage('assets/backgrounds/skyscrapers.jpg'),
                fit: BoxFit.fill)),
        child: Material(
          color: Colors.grey.shade800.withOpacity(0.75),
          child: SafeArea(
            child: Center(
              child: provider.hasData
                  ? Column(
                      children: [
                        CircleAvatar(
                          radius: 50,
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              IconButton(
                                icon: Icon(Icons.add),
                                onPressed: () {
                                  //TODO: Add upload image page
                                },
                              ),
                              Text(
                                'Bild hinzufügen',
                                style: Theme.of(context).textTheme.caption,
                              ),
                            ],
                          ),
                          backgroundColor: Colors.white,
                        ),
                        Text(provider.userData.name),
                        Card(
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  CircleAvatar(
                                      child: Icon(Icons.call_received)),
                                  CircleAvatar(child: Icon(Icons.send)),
                                  CircleAvatar(child: Icon(Icons.group)),
                                ],
                              ),
                              Text(
                                  '${(provider.userData.balance / 100).toStringAsFixed(2)}€'),
                            ],
                          ),
                        ),
                        Wrap(
                          children: [
                            Card(
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Text('Sammelgruppe 1'),
                                  Container(
                                    height: 70,
                                    width: 70,
                                    margin: EdgeInsets.all(30),
                                    child: Stack(
                                      fit: StackFit.expand,
                                      children: [
                                        CircularProgressIndicator(
                                          value: 0.8,
                                          strokeWidth: 6,
                                        ),
                                        Align(
                                          alignment: Alignment.center,
                                          child: Column(
                                            mainAxisSize: MainAxisSize.min,
                                            children: [
                                              Text('80.00€'),
                                              Text('100.00€'),
                                            ],
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Card(
                              child: Container(
                                height: 145,
                                width: 130,
                                child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text('Offene\nRechnungen'),
                                    Text('-34.99€'),
                                    SizedBox()
                                  ],
                                ),
                              ),
                            ),
                          ],
                        )
                      ],
                    )
                  : Text('LOADING...'),
            ),
          ),
        ));
  }
}
