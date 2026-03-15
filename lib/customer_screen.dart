import 'package:auto_route/auto_route.dart';
import 'package:em_poverty/Helpers/current_location_finder.dart';
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
            // Text("Welcome Customer"),
            FutureBuilder(
                future: _currentLocationFinder.getCurrentLocation(),
                builder: (BuildContext context, AsyncSnapshot<Position> snapshot) {
                    if (snapshot.connectionState == .waiting) {
                       return  Text("Loading");
                      }
                   if (snapshot.hasError) {
                  return Text("Error: ${snapshot.error}");
                  }

                   if (snapshot.hasData) {
                  final pos = snapshot.data!;
                  return Text("Location: ${pos.latitude}, ${pos.longitude}");
                  }

                  return const Text("Initializing...");
                }
            ),
          ]
      ),
      )
      ),
    );
  }
}