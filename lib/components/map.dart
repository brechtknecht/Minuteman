import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import 'package:flutter/services.dart' show rootBundle;

String _mapStyle;

class MapSample extends StatefulWidget {
  @override
  State<MapSample> createState() => MapSampleState();
}

class MapSampleState extends State<MapSample> {
  @override
  void initState() {
    super.initState();

    rootBundle.loadString('assets/map_style.txt').then((string) {
      _mapStyle = string;
    });
  }

  Completer<GoogleMapController> _controller = Completer();

  static final CameraPosition initialCameraPosition = CameraPosition(
    target: LatLng(52.3921234, 13.034952),
    zoom: 14.4746,
  );

  static final CameraPosition fhp = CameraPosition(
      // bearing: 192.8334901395799,
      target: LatLng(52.413955, 13.050977),
      // tilt: 59.440717697143555,
      zoom: 19.151926040649414);

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: GoogleMap(
        mapType: MapType.normal ,
        initialCameraPosition: initialCameraPosition,

        onMapCreated: (GoogleMapController controller) {
          _controller.complete(controller);
          controller.setMapStyle(_mapStyle);
        },

        myLocationEnabled: true,
        

        markers : {
          testMarker_1
        }
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: _goToFHP,
        label: Text('FH;P'),
        icon: Icon(Icons.directions_boat),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }

  Future<void> _goToFHP() async {
    final GoogleMapController controller = await _controller.future;
    controller.animateCamera(CameraUpdate.newCameraPosition(fhp));
  }
}

Marker testMarker_1 = Marker(
  markerId: MarkerId('test-1'),
  position: LatLng(52.413955, 13.050977),
  onTap: () {
    
  },
  icon: BitmapDescriptor.defaultMarkerWithHue(
    BitmapDescriptor.hueRed
  ) 
);