import 'dart:async';

import 'package:bykefastgo/shared/util/shared_entities/map.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';

class MapScreen extends StatefulWidget {
  const MapScreen({super.key});

  @override
  State<MapScreen> createState() => MapScreenState();
}

class MapScreenState extends State<MapScreen> {
  final Completer<GoogleMapController> _controller = Completer();

  final Marker bikeMarker = Marker(
    markerId: const MarkerId('bikeMarker'),
    infoWindow: const InfoWindow(title: 'Bike'),
    icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueBlue),
    position: const LatLng(37.43296265331129, -122.08832357078792),
  );

  CameraPosition defaultPosition = CameraPosition(
    target: LatLng(userPosition!.latitude, userPosition!.longitude),
    zoom: 14.4746,
  );

  Marker userMarker = Marker(
    markerId: const MarkerId('userMaker'),
    infoWindow: const InfoWindow(title: 'Plex'),
    icon: BitmapDescriptor.defaultMarker,
    position: LatLng(userPosition!.latitude, userPosition!.longitude),
  );

  // Request location permissions
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Mapa"),
          leading: IconButton(
              onPressed: () {
                if (context.canPop()) {
                  return context.pop();
                }
                context.go('/');
              },
              icon: const Icon(LineAwesomeIcons.angle_left_solid,
                  size: 30, color: Colors.black)),
        ),
        body: GoogleMap(
          mapType: MapType.normal,
          markers: {userMarker, bikeMarker},

          initialCameraPosition: defaultPosition!,
          myLocationEnabled: true, // Enable the MyLocation layer
          onMapCreated: (GoogleMapController controller) {
            _controller.complete(controller);
          },
        ));
  }
}
