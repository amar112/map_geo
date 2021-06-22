import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';

import 'package:google_maps_flutter/google_maps_flutter.dart';

class PolylineMap extends StatefulWidget {
  const PolylineMap({Key? key}) : super(key: key);

  @override
  _PolylineMapState createState() => _PolylineMapState();
}

class _PolylineMapState extends State<PolylineMap> {
  var markers = HashSet<Marker>();
  List<Polyline> mypolyline = [];
   // Position currentposition = 0;
   var geolocator = Geolocator();
   late Position currentposition;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    createpolyline();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            'Polyline map',
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
        ),
        body: GoogleMap(
          initialCameraPosition: CameraPosition(

              target: LatLng(37.42796133580664, -122.085749655962), zoom: 14,),
          onMapCreated: (googlemapcontroller){
            setState(() {
              markers.add(
                Marker(
                  markerId: MarkerId('1'),
                  position: LatLng(37.42796133580664, -122.085749655962),
                ),
              );
            });
          },
          markers: markers,
          polylines: mypolyline.toSet(),
        ),
    );
  }

  createpolyline(){
    mypolyline.add(
      Polyline(
          polylineId: PolylineId('1'),
        width: 3,
        color: Colors.blue,
        points: [LatLng(29.990000, 31.149000),LatLng(29.999000, 31.149900)]
      )
    );
  }

}


