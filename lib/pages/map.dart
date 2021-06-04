import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:weatherlora/pages/home.dart';
import 'package:weatherlora/pages/weather2.dart';
// class map extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Flutter Google Maps Demo',
//       home: MapSample(),
//     );
//   }
// }

class MapSample extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => MapSampleState();
}

class MapSampleState extends State<MapSample> {
  Completer<GoogleMapController> _controller = Completer();

  static final CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(16.246771601534313, 103.25201287865639),
    zoom: 14.4746,
  );

  // ignore: non_constant_identifier_names
  BitmapDescriptor IconImages;
  Set<Marker> myMarker() {
    return <Marker>[myWeather1(), myWeather2()].toSet();
  }

  static final CameraPosition _kLake = CameraPosition(
      bearing: 192.8334901395799,
      target: LatLng(16.246771601534313, 103.25201287865639),
      tilt: 59.440717697143555,
      zoom: 19.151926040649414);

  @override
  void initState() {
    super.initState();
  }

  myWeather1() {
    return Marker(
      markerId: MarkerId('1'),
      position: LatLng(16.246590, 103.251776),
      icon: IconImages,
      infoWindow: InfoWindow(
        title: 'Weather Station1',
        onTap: () {
          Navigator.push(
            context,
            new MaterialPageRoute(builder: (context) => home()),
          );
        },
      ),
    );
  }

  myWeather2() {
    return Marker(
      markerId: MarkerId('2'),
      position: LatLng(16.246850, 103.252063),
      icon: IconImages,
      infoWindow: InfoWindow(
        title: 'Weather Station2',
        onTap: () {
          Navigator.push(
            context,
            new MaterialPageRoute(builder: (context) => weather2()),
          );
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: GoogleMap(
        mapType: MapType.hybrid,
        markers: myMarker(),
        myLocationEnabled: true,
        initialCameraPosition: _kGooglePlex,
        onMapCreated: (GoogleMapController controller) {
          _controller.complete(controller);
        },
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: _goToTheLake,
        label: Text('ตำแหน่ง Weather'),
        icon: Icon(Icons.location_pin),
      ),
    );
  }

  Future<void> _goToTheLake() async {
    final GoogleMapController controller = await _controller.future;
    controller.animateCamera(CameraUpdate.newCameraPosition(_kLake));
  }
}
