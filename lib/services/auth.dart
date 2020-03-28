import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'dart:async';

class AuthService {

    // Holt sich die Instanzen von FirebaseAuth und Firestore & Google Sign In 
    // ...muss erweitert werden, je mehr Login-Funktionalitäten man implementiert
    final GoogleSignIn _googleSignIn = GoogleSignIn();
    final FirebaseAuth _auth = FirebaseAuth.instance;
    final Firestore _db = Firestore.instance;

    // FETCHING VON NUTZERDATEN

    // Gibt den Nutzer als Future Instanz zurück. Für Anfragen usw.
    Future<FirebaseUser> get getUser => _auth.currentUser();

    // Gibt den Nutzer als konstanten Stream zurück, wenn sich der 
    // des Users ändert
    Stream<FirebaseUser> get user => _auth.onAuthStateChanged;

    // LOGIN METHODEN
    // Wachsen an, je nachdem, welche Auth Möglichkeiten man noch mitliefert

    // Anonymes Einloggen
    Future<FirebaseUser> anonLogin() async {
      final FirebaseUser user = (await _auth.signInAnonymously()).user;
      updateUserData(user);
      return user;
    }

  // Einloggen mit Google Account
  Future<FirebaseUser> googleSignIn () async {
    try {

      // Die ersten Zeilen sind dafür zuständig den User auf der Google Platform
      // einzuloggen und zu authentifizieren
      GoogleSignInAccount googleSignInAccount = await _googleSignIn.signIn();
      GoogleSignInAuthentication googleAuth = await googleSignInAccount.authentication;

      final AuthCredential credential = GoogleAuthProvider.getCredential(
        accessToken: googleAuth.accessToken, idToken: googleAuth.idToken
      ); 

      // Ab hier wird die eingeloggte Instanz in einen Firebase User umgewandelt
      final FirebaseUser user = (await _auth.signInWithCredential(credential)).user;

      updateUserData(user);

      return user;

    } catch (error) {
      print(error);
      return null;
    } 
  }


  // HELPER FUNCTION, welche die Userdaten nach einloggen updatet
  Future<void> updateUserData(FirebaseUser user) {
    // An dieser Stelle kan man sich direkt daten aus der Datenbank holen welche mit dem
    // Nutzer zusammenhängen. Das ist sehr praktisch, wenn man sofort Daten darstellen will
    //   DocumentReference dataRef = _db.collection('test').document(user.uid);
    
    DocumentReference dataRef = _db.collection('test').document(user.uid);


    // Der Zugriff auf die Datenbank überschreibt die Daten des aktuellen Eintrags,
    //  da die Property »merge: true« gesetzt ist
    return dataRef.setData({
      'uid' : user.uid,
      'lastActivity': DateTime.now()
    }, merge: true);
  }

  Future<void> signOut () {
    return _auth.signOut();
  }
}


