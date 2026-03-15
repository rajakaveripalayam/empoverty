import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'package:geolocator/geolocator.dart';

class MapComponent extends StatelessWidget {
  final Position userPosition;
  const MapComponent({super.key, required this.userPosition});

  @override
  Widget build(BuildContext context) {
    final LatLng currentLatLng = LatLng(userPosition.latitude, userPosition.longitude);

    return Column(
      children: [
        const Text("User Location"),
        Expanded(
          child: FlutterMap(
            options: MapOptions(
              initialCenter: currentLatLng,
              initialZoom: 15.0,
            ),
            children: [
              TileLayer(
                urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
                userAgentPackageName: 'com.yourdomain.app',
              ),
               MarkerLayer(
                markers: [
                  Marker(
                    point: currentLatLng,
                    width: 60,
                    height: 60,
                     child: const Icon(
                      Icons.location_on,
                      color: Colors.red,
                      size: 40,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}