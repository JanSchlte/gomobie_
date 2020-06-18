import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:gomobie/pages/home/transactions.dart';
import 'package:gomobie/widgets/home/family/family_card.dart';

class Family extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Center(
        child: Column(
          children: [
            SizedBox(height: 20),
            Image.asset(
              'assets/general_assets/family.png',
              height: 170,
            ),
            SizedBox(height: 10),
            Text(
              'Familie',
              style: TextStyle(fontSize: 23, fontWeight: FontWeight.w500),
            ),
            Text('Familienmitglieder'),
            SizedBox(height: 50),
            Stack(
              fit: StackFit.loose,
              children: [
                Padding(
                  padding:
                      const EdgeInsets.only(left: 16, right: 16, bottom: 35),
                  child: Card(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(20))),
                    elevation: 3,
                    child: Column(
                      children: [
                        //TODO: Fetch from firebase
                        FamilyCard(
                            name: 'Tobias Henning', type: AccountType.owner),
                        FamilyCard(
                            name: 'Emma Henning', type: AccountType.owner),
                        FamilyCard(
                            name: 'Mattis Henning', type: AccountType.child),
                      ],
                    ),
                  ),
                ),
                Positioned.fill(
                  child: Align(
                    alignment: Alignment.bottomCenter,
                    child: FloatingActionButton.extended(
                      onPressed: () {},
                      label: Text('Hinzufügen'),
                      icon: Icon(Icons.add),
                    ),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
