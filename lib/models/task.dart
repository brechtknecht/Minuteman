import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class Task {
  String id;
  String user;
  LatLng location;

  Task({ this.id, this.user, this.location });

  factory Task.fromFirestore(DocumentSnapshot doc) {
    Map data = doc.data;

    return Task (
      id: doc.documentID,
      user: data['user'] ?? '',
      location: data['LatLng'] ?? 0
    );
  } 


}