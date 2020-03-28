import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import 'package:flutter/services.dart'
show rootBundle;

String _mapStyle;

class MapSample extends StatefulWidget {
  @override
  State < MapSample > createState() => MapSampleState();
}

class MapSampleState extends State < MapSample > {
  @override
  void initState() {
    super.initState();

    rootBundle.loadString('assets/map_style.txt').then((string) {
      _mapStyle = string;
    });
  }

  Completer < GoogleMapController > _controller = Completer();

  static final CameraPosition initialCameraPosition = CameraPosition(
    target: LatLng(52.3921234, 13.034952),
    zoom: 14.4746,
  );

  static final CameraPosition fhp = CameraPosition(
    // bearing: 192.8334901395799,
    target: LatLng(52.413955, 13.050977),
    // tilt: 59.440717697143555,
    zoom: 19.151926040649414);

  final db = Firestore.instance;
  
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: StreamBuilder<DocumentSnapshot>(
        stream: db.collection('tasks').document('MTs6WLGfd2WYjwDGuFWH').snapshots(),
        builder: (context, snapshot) {

          Map data = snapshot.data.data;

          return GoogleMap(
            mapType: MapType.normal,
            initialCameraPosition: initialCameraPosition,

            onMapCreated: (GoogleMapController controller) {
              _controller.complete(controller);
              controller.setMapStyle(_mapStyle);
            },

            myLocationEnabled: true,

            padding: EdgeInsets.only(bottom: MediaQuery.of(context).size.height - 150),

            markers: {
              Marker(
                markerId: MarkerId('test-1'),
                position: LatLng(data['LatLng'].latitude, data['LatLng'].longitude),
                onTap: () => _goToFHP(),
                icon: BitmapDescriptor.defaultMarkerWithHue(
                  BitmapDescriptor.hueRed
                )
              )
            }
          );
        }
      )
    );
  }

  Future < void > _goToFHP() async {
    final GoogleMapController controller = await _controller.future;
    controller.animateCamera(CameraUpdate.newCameraPosition(fhp));
  }
}