import 'package:auto_route/auto_route.dart';
import 'package:em_poverty/Helpers/current_location_finder.dart';
import 'package:em_poverty/uicomponent/map_component.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';

@RoutePage()
class CustomerScreen extends  StatelessWidget {
  final CurrentLocationFinder _currentLocationFinder = CurrentLocationFinder();

  CustomerScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Csutomer Screen"),
      ),
      body: SafeArea(child:
      Center(
        child: Column(
          mainAxisAlignment: .center,
          children: [
            Expanded(child:
        // Text("Welcome Customer"),
        FutureBuilder(
        future: _currentLocationFinder.getCurrentLocation(),
        builder: (BuildContext context, AsyncSnapshot<Position> snapshot) {
        if (snapshot.connectionState == .waiting) {
        return Text("Loading");
        }
        if (snapshot.hasError) {
        return Text("Error: ${snapshot.error}");
        }
        if (snapshot.hasData) {
        final pos = snapshot.data!;
        Position userLocation = snapshot.data ?? Position(
        longitude: 0.0,
        latitude: 0.0,
        timestamp: DateTime.now(),
        accuracy: 0.0,
        altitude: 0.0,
        altitudeAccuracy: 0.0,
        heading: 0.0,
        headingAccuracy: 0.0,
        speed: 0,
        speedAccuracy: 0.0);

        return MapComponent(userPosition: userLocation);
        }

        return const Text("Initializing...");
        }
        ),
        ),
          ]
      ),
      )
      ),
    );
  }
}