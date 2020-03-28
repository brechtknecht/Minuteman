import 'package:flutter/material.dart';
import 'package:minutemen/services/auth.dart';

class ProfileView extends StatelessWidget {
  
  // Jedes mal, wenn man die Authentifizierung eines Users benötigt
  // muss der »AuthService« instanziiert werden
  final AuthService auth = AuthService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center (
        child: FlatButton(
          child: Text("Logout"),
          color: Colors.red,
          onPressed: () async {
            await auth.signOut();

            // An dieser Stelle wird der Route Tree einfach zurückgesetzt
            Navigator.of(context)
              .pushNamedAndRemoveUntil('/', (route) => false);
          }
        ),
      )  
    );
  }
}