import 'dart:async';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';

class BicycleMapScreen extends StatefulWidget {
  final Map<String, double?> data;

  //final double longitude;
  const BicycleMapScreen({Key? key, required this.data}) : super(key: key);

  @override
  State<BicycleMapScreen> createState() => BicycleMapScreenState();
}

class BicycleMapScreenState extends State<BicycleMapScreen> {
  final Completer<GoogleMapController> _controller = Completer();
  bool isLoading = true;
  double? latitude;
  double? longitude;
  double? idData;
  int? id;
  Future<void> loadLatitudeLongitude() async {
    try {
      idData = widget.data['id'];
      if (mounted) {
        id = idData!.toInt();
        latitude = widget.data['latitude'];
        longitude = widget.data['longitude'];
        setState(() {
          isLoading = false;
        });
      }
    } catch (e) {
      if (mounted) {
        setState(() {
          isLoading = false;
        });
      }
    }
  }

  // Request location permissions
  @override
  void initState() {
    super.initState();
    loadLatitudeLongitude();
  }

  @override
  Widget build(BuildContext context) {
    final Marker bikeMarker = Marker(
      markerId: const MarkerId('bikeMarker'),
      infoWindow: const InfoWindow(title: 'Bike'),
      icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueBlue),
      position: LatLng(latitude!, longitude!),
    );

    CameraPosition bikePosition = CameraPosition(
      target: LatLng(latitude!, longitude!),
      zoom: 14.4746,
    );

    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text("Ubicación de la bicicleta"),
          leading: IconButton(
              onPressed: () {
                if (context.canPop()) {
                  return context.pop();
                }
                context.go('/bicycle/$id');
              },
              icon: const Icon(LineAwesomeIcons.angle_left_solid,
                  size: 30, color: Colors.black)),
        ),
        body: isLoading
            ? const Center(child: CircularProgressIndicator())
            : latitude == null || longitude == null
                ? const Center(child: Text('Bicycle location not found'))
                : GoogleMap(
                    mapType: MapType.normal,
                    markers: {bikeMarker},
                    initialCameraPosition: bikePosition,
                    myLocationEnabled: true, // Enable the MyLocation layer
                    onMapCreated: (GoogleMapController controller) {
                      _controller.complete(controller);
                    },
                  ));
  }
}
