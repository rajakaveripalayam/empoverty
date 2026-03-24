import 'package:em_poverty/storage/service_provider_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'package:geolocator/geolocator.dart';

class MapComponent extends StatelessWidget {
  final Position userPosition;
  final LatLng? selectedLocation;
  final List<ServiceProviderModel>? allProvidersLatLong;
  final Function(LatLng) newLocationSelectedByProvider;
  final Function( LatLng) currentLocationSelection;
  final Function( LatLng) providerSelection;

  const MapComponent({
    super.key,
    required this.userPosition,
    this.selectedLocation,
    this.allProvidersLatLong,
    required this.newLocationSelectedByProvider,
    required this.currentLocationSelection,
    required this.providerSelection
  });

  @override
  Widget build(BuildContext context) {
    final LatLng currentLatLng = LatLng(userPosition.latitude, userPosition.longitude);
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
    if (allProvidersLatLong != null) {
      for (var provider in allProvidersLatLong!) {
        LatLng _latlong = LatLng(provider.lat, provider.long);
        markers.add(
          Marker(
            point: _latlong,
            width: 80,
            height: 80,
            child: GestureDetector(
              onTap: () {
                providerSelection(_latlong);},
              child: const Icon(Icons.location_pin, size: 45, color: Colors.blue),
            ),
          ),
        );
      }

    }

    return Column(
      children: [
         Expanded(
          child: FlutterMap(
            options: MapOptions(
              initialCenter: currentLatLng,
              initialZoom: 15.0,
              onTap: (tapPosition, latlng) {
                newLocationSelectedByProvider(latlng);
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