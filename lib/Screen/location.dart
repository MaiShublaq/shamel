import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:shamel/Controlleelper/controller_helper.dart';
import 'constants.dart';
class Location extends StatefulWidget {
  const Location({Key? key}) : super(key: key);

  @override
  State<Location> createState() => _LocationState();
}

class _LocationState extends State<Location> {

  final Completer<GoogleMapController> _controller =Completer();
  final LatLng sourceLocation =LatLng(19.018255973653343, 72.84793849278007);
  final LatLng destnationLocation =LatLng(37.33429383, -122.06600055);
  List<LatLng> PolylineCoordinates = [];

 void getPolyPoint() async{
    PolylinePoints polylinePoints = PolylinePoints();
   PolylineResult result = await polylinePoints.getRouteBetweenCoordinates(
     "AIzaSyBWB3BAmPLFtVwhmRdrNrXguu3EEx4NNuk",
       PointLatLng(sourceLocation.latitude, destnationLocation.longitude),
     PointLatLng(destnationLocation.latitude, sourceLocation.longitude),
   );
   if(result.points.isNotEmpty){
     result.points.forEach((PointLatLng point) {
       PolylineCoordinates.add(LatLng(point.latitude, point.longitude));
     });
     setState(() {

     });
   }
  }

  @override
  void initState() {
   getPolyPoint();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: GoogleMap(initialCameraPosition: CameraPosition(target:
            sourceLocation , zoom: 11.5
        ),
          markers: {
          Marker(markerId: MarkerId("source"),
          position: sourceLocation
          ),
            Marker(markerId: MarkerId("destination"),
                position: destnationLocation
            ),
          },
         polylines: {
          Polyline(polylineId: PolylineId("route"),
            points: PolylineCoordinates,
            color: Color(context.greenColor),
            width: 4
          )

         },
        ),
      ),

    );
  }
}
