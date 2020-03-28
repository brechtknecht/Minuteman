import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'dart:async';
import 'task.dart';


class DatabaseService {
  final Firestore _db = Firestore.instance;


  // Future<Map> getTasks() {
  //   return _db.collection('tasks')
  //             .document('MTs6WLGfd2WYjwDGuFWH')
  //             .get()
  //             .then((snap) => snap.data);
  // }
}