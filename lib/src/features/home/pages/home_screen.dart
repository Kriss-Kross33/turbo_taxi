import 'dart:async';

import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:turbo_taxi/src/core/core.dart';
import 'package:turbo_taxi/src/features/home/widgets/widgets.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late Completer<GoogleMapController> _googleMapController;
  late GoogleMapController newGoogleMapController;
  late Position currentPosition;

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    _googleMapController = Completer<GoogleMapController>();
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  Future<void> locatePosition() async {
    currentPosition = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
    LatLng latLngPosition =
        LatLng(currentPosition.latitude, currentPosition.longitude);
    CameraPosition cameraPosition =
        CameraPosition(target: latLngPosition, zoom: 14);
    newGoogleMapController
        .animateCamera(CameraUpdate.newCameraPosition(cameraPosition));
  }

  final CameraPosition _cameraPosition = const CameraPosition(
    target: LatLng(37.42796133580664, -122.085749655962),
    zoom: 14.4746,
  );

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Scaffold(
        key: _scaffoldKey,
        drawer: const DrawerBody(),
        body: Stack(
          children: [
            GoogleMap(
              initialCameraPosition: _cameraPosition,
              mapType: MapType.normal,
              myLocationButtonEnabled: true,
              zoomControlsEnabled: true,
              zoomGesturesEnabled: true,
              onMapCreated: (GoogleMapController controller) async {
                _googleMapController.complete(controller);
                newGoogleMapController = controller;
                await TurboPermissionHandler.requestLocationPermission();
                await locatePosition();
              },
            ),
            const HomeBody(),
            DrawerIcon(
              scaffoldKey: _scaffoldKey,
            ),
          ],
        ),
      ),
    );
  }
}
