import 'package:geolocator/geolocator.dart';

class CurrentLocationFinder {
  Future<Position> getCurrentLocation() async {
    bool isGPSServiceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!isGPSServiceEnabled) {
      return Future.error("GPS is not enabled Please enable it in settings");
    }

    LocationPermission permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      Geolocator.requestPermission();
      if (permission == LocationPermission.denied ||
          permission == LocationPermission.deniedForever) {
        return Future.error(
            "GPS is not enabled and we can not request inside the app Please enable it in settings");
      }
    }
    var currentPosition = await Geolocator.getCurrentPosition();
    return Future.value(currentPosition);
  }
}