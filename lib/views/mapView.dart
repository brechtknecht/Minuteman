import 'package:flutter/material.dart';
import 'package:grouped_buttons/grouped_buttons.dart';
import 'package:minutemen/components/ShoppingList.dart';

import 'package:minutemen/components/map.dart';

class MapView extends StatelessWidget {
  const MapView({
    Key key
  }): super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: < Widget > [
          MapSample(),
          TaskInformationCard()
        ],
      )
    );
  }
}

class TaskInformationCard extends StatelessWidget {
  const TaskInformationCard({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 0,
      left: 0,
      child: SizedBox(
        width: MediaQuery.of(context).size.width,
        child: Card(
          color: Colors.white,
          child: Padding(
            padding: EdgeInsets.only(left: 24.0, top: 18.0, right: 24.0, bottom: 5.0),
            child: Column(
              children: < Widget > [
                Padding(
                    padding: EdgeInsets.only(bottom: 12.0),
                    child: Text(
                    'Kiepenheuerallee 5, 14469 Potsdam',
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w300,
                      height: 1
                    ),
                  ),
                ),
                Padding(
                    padding: EdgeInsets.only(bottom: 6.0),
                    child: Text(
                    'Wobei kannst du Horst helfen?',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      height: 1
                    ),
                  ),
                ),
    
                Padding(
                    padding: EdgeInsets.only(bottom: 3.0, left: 12.0, right: 12.0),
                    child: Text(
                      'Bestätige in der Liste bitte bei welchen Aufgaben du Horst behilflich sein kannst',
                    style: TextStyle(
                      fontSize: 14,
                      height: 1.5
                    ),
                    textAlign: TextAlign.start
                  ),
                ),


                CheckboxGroup(
                  labels: <String>[
                    "Mit dem Hund walken",
                    "Fresserei ranschaffen",
                    "Kaggen gehen"
                  ],
                  onSelected: (List<String> checked) => print(checked.toString()),
                ),


                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: < Widget > [
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 5.0, horizontal: 8.0),
                      child: FlatButton(
                        onPressed: () {},
                        color: Colors.white,
                        textColor: Colors.red,
                        child: Text("zurück",
                          style: TextStyle(fontSize: 14)),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 5.0, horizontal: 8.0),
                      child: FlatButton.icon(
                        shape: new RoundedRectangleBorder(
                          borderRadius: new BorderRadius.circular(5.0),
                          side: BorderSide(color: Colors.red)
                        ),
                        icon: Icon(Icons.mail),
                        onPressed: () {},
                        color: Colors.red,
                        textColor: Colors.white,
                        label: Text("Helfen",
                          style: TextStyle(fontSize: 14)),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          )
        ),
      ),
    );
  }
}