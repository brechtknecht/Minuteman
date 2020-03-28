import 'package:flutter/material.dart';
import 'package:minutemen/services/auth.dart';

import 'package:provider/provider.dart';
import 'package:firebase_auth/firebase_auth.dart';

// All Views
import 'package:minutemen/views/mapView.dart';
import 'package:minutemen/views/messageView.dart';
import 'package:minutemen/views/profileView.dart';

// Data Models for Firestore
import 'models/database.dart';
import 'models/task.dart';

void main() => runApp(Minutemen());

class Minutemen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
      // Make user stream available
      StreamProvider<FirebaseUser>.value(value: AuthService().user),
    ],
    child: MaterialApp(
      title: 'Flutter Google Maps Demo',
      home: DefaultView(),

      initialRoute: '/',
      // routes: {
      //   // '/': (context) => MapView(),
      //   '/messages': (context) => MessageView(),
      //   '/profile': (context) => ProfileView()
      // }
    ));
  }
}

class DefaultView extends StatefulWidget {
  DefaultView({
    Key key
  }): super(key: key);

  @override
  _DefaultViewState createState() => _DefaultViewState();
}

class _DefaultViewState extends State < DefaultView > {
  int _selectedTab = 0;

  @override
  Widget build(BuildContext context) {
    var tabs = [
      MapView(),
      MessageView(),
      ProfileView()
    ];

    return Scaffold(
      body: tabs.elementAt(_selectedTab),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedTab,
        onTap: (int index) {
          setState(() {
            _selectedTab = index;
          });
        },
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.map),
            title: Text("Karte"),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.mail),
            title: Text("Nachrichten"),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            title: Text("Profil"),
          ),
        ],
      ),
    );

  }
}