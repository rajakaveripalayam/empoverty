import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'package:geolocator/geolocator.dart';

class MapComponent extends StatelessWidget {
  final Position userPosition;
  final LatLng? selectedLocation;
  final Function(LatLng) onLocationSelected;
  final Function( LatLng) currentLocationSelection;
  final Function( LatLng) providerSelection;

  const MapComponent({
    super.key,
    required this.userPosition,
    required this.selectedLocation,
    required this.onLocationSelected,
    required this.currentLocationSelection,
    required this.providerSelection
  });

  @override
  Widget build(BuildContext context) {
    final LatLng currentLatLng = LatLng(userPosition.latitude, userPosition.longitude);
    // // Create the markers list inside the build method
    // // Helper function to show the alert
    // void _showLocationInfo(BuildContext context, String type, LatLng point) {
    //   showDialog(
    //     context: context,
    //     builder: (context) => AlertDialog(
    //       title: Text("$type Details"),
    //       content: Text("Latitude: ${point.latitude}\nLongitude: ${point.longitude}"),
    //       actions: [
    //         TextButton(
    //           onPressed: () => Navigator.pop(context),
    //           child: const Text("Close"),
    //         ),
    //       ],
    //     ),
    //   );
    // }

    List<Marker> markers = [
      // 1. User Location Marker
      Marker(
        point: currentLatLng,
        width: 80,
        height: 80,
        child: GestureDetector(
          onTap: () {
            currentLocationSelection(currentLatLng);},
          child: const Icon(Icons.person_pin_circle, size: 45, color: Colors.red),
        ),
      ),
    ];

    // 2. Selected Location Marker (if exists)
    if (selectedLocation != null) {
      markers.add(
        Marker(
          point: selectedLocation!,
          width: 80,
          height: 80,
          child: GestureDetector(
            onTap: () {
              providerSelection(selectedLocation!);},
             child: const Icon(Icons.location_pin, size: 45, color: Colors.blue),
          ),
        ),
      );
    }

    return Column(
      children: [
        const Text("User Location"),
        Expanded(
          child: FlutterMap(
            options: MapOptions(
              initialCenter: currentLatLng,
              initialZoom: 15.0,
              onTap: (tapPosition, latlng) {
                onLocationSelected(latlng);
              },
            ),
            children: [
              TileLayer(
                urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
                userAgentPackageName: 'com.yourdomain.app',
              ),
               MarkerLayer(markers: markers),
            ],
          ),
        ),
      ],
    );
  }
}