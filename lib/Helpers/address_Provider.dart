import 'package:flutter/cupertino.dart';
import 'package:nominatim_flutter/model/request/reverse_request.dart';
import 'package:nominatim_flutter/nominatim_flutter.dart';

class AddressProvider  {
  final double latitude;
  final double Longitude;

  AddressProvider(this.latitude, this.Longitude);

  Future<String> get address async {
    // 1. Create the request object using the model's lat/long
    final request = ReverseRequest(
      lat: latitude,
      lon: Longitude,
      addressDetails: true,
    );

    // 2. Await the response from Nominatim
    try {
      final response = await NominatimFlutter.instance.reverse(
        reverseRequest: request,
        language: 'en-US',
      );
      return response.displayName ?? "Unknown Address";
    } catch (e) {
      return "Error fetching address";
    }
  }
}