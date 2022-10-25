import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:shamel/Controlleelper/controller_helper.dart';
import 'constants.dart';
class Test extends StatefulWidget {
  const Test({Key? key}) : super(key: key);

  @override
  State<Test> createState() => _TestState();
}

class _TestState extends State<Test> {

  static final LatLng _kMapCenter =
  LatLng(19.018255973653343, 72.84793849278007);

  static final CameraPosition _kInitialPosition =
  CameraPosition(target: _kMapCenter, zoom: 11.0, tilt: 0, bearing: 0);


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children:[
          Text("nasdfghjkjhg"),
          GoogleMap(
            initialCameraPosition: _kInitialPosition,
          ),
        ]
      ),
    );
  }
}

