import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'package:geolocator/geolocator.dart';

class MapComponent extends StatelessWidget {
  final Position userPosition;
  final LatLng? selectedLocation;
  final Function(LatLng) onLocationSelected;

  const MapComponent({
    super.key,
    required this.userPosition,
    required this.selectedLocation,
    required this.onLocationSelected,
  });

  @override
  Widget build(BuildContext context) {
    final LatLng currentLatLng = LatLng(userPosition.latitude, userPosition.longitude);
    List<Marker> markers = [];
    if (userPosition != null) {
      markers.add(
        Marker(
          point: LatLng(userPosition.latitude, userPosition.longitude),
          width: 80,
          height: 80,
          child: const Icon(
            Icons.location_pin,
            size: 40,
            color: Colors.red,
          ),
        ),
      );
    }

    if (selectedLocation != null) {
      markers.add(
        Marker(
          point: selectedLocation!,
          width: 80,
          height: 80,
          child: const Icon(
            Icons.location_pin,
            size: 40,
            color: Colors.blue,
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