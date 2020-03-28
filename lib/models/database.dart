// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:google_maps_flutter/google_maps_flutter.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'dart:async';
// import 'task.dart';


// class DatabaseService {
//   final Firestore _db = Firestore.instance;

//   Stream<Task> streamTask(String id) {
//     return _db
//       .collection('tasks')
//       .document(id)
//       .snapshots()
//       .map((snap) => Task.fromMap(snap.data));
//   }

//   Future<void> createHero(FirebaseUser user) {
//     return _db
//         .collection('heroes')
//         .document(user.uid)
//         .setData({
//           'title': 'Test',
//           'location' : LatLng(52.405661, 13.043767)
//         });
//   }

// }