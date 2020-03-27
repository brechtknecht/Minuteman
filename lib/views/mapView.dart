import 'package:flutter/material.dart';
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
          Positioned(
            bottom: 80,
            left: 0,
            child: Card(
              color: Colors.yellow,
              child: Column(
                children: <Widget>[
                  Text('Willst du Horst helfen?'),
                  Row(
                    children: < Widget > [
                      RaisedButton(
                        onPressed: () {},
                        child: const Text(
                          'nich Helfen',
                          style: TextStyle(fontSize: 16)
                        ),
                      ),
                      RaisedButton(
                        onPressed: () {},
                        child: const Text(
                          'Helfen',
                          style: TextStyle(fontSize: 16)
                        ),
                      ),
                    ],
                  ),
                ],
              )
            ),
          )
        ],
      )
    );
  }
}