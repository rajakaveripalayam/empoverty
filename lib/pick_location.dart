import 'package:em_poverty/route/app_router.gr.dart';
import 'package:auto_route/auto_route.dart';
import 'package:em_poverty/uicomponent/map_component.dart';
import 'package:em_poverty/uicomponent/provider_details_view.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:latlong2/latlong.dart';
import 'package:em_poverty/uicomponent/button_component.dart';
import 'Helpers/current_location_finder.dart';

@RoutePage()
class PickLocation extends StatefulWidget {
  const PickLocation({super.key});

  @override
  State<PickLocation> createState() => _PickLocationState();
}

class _PickLocationState extends State<PickLocation> {
  LatLng? selectedLocation;
  final CurrentLocationFinder _currentLocationFinder = CurrentLocationFinder();

  void onLocationSelected(LatLng latLng) {
    setState(() {
      selectedLocation = latLng;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text("Home Page"),
      ),
      body: SafeArea(child:
      Center(
        child: Column(
            mainAxisAlignment: .center,
            children: [
              Expanded(
                flex: 3,
                child:
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

                        return MapComponent(userPosition: userLocation, selectedLocation: selectedLocation, onLocationSelected: onLocationSelected,);
                      }

                      return const Text("Initializing...");
                    }
                ),
              ),
              Expanded(
                  flex: 1,
                  child:
                  ProviderDetailsView(
                      name: "Sukumar",
                      address: "16 rue Moliere 92120",
                      phoneNumber: "9944047907", skills: ["Painting", "Plumber"])
              ),
              Expanded(
                  flex: 1,
                  child:
                  ButtonComponent(title: "Proceed", onPress: (){
                    if (selectedLocation != null) {
                      final LatLng selectedValue = selectedLocation!;

                      // This closes the screen and sends 'selectedValue' to whoever called it
                      context.router.maybePop(selectedValue);
                    }
                  })
              )
            ]
        ),
      )
      ),
    );
  }
}