import 'package:nominatim_flutter/model/request/reverse_request.dart';
import 'package:objectbox/objectbox.dart';
import 'package:nominatim_flutter/nominatim_flutter.dart';

@Entity()
class ServiceProviderModel {
  @Id()
  int id = 0;
  String name;
  String address;
  List<String> skills;
  double lat;
  double long;
  int phonenumber;

  ServiceProviderModel({
    required this.name,
    required this.address,
    required this.skills,
    required this.lat,
    required this.long,
    required this.phonenumber,
  });
// Inside your ServiceProviderModel class
  Future<String> get displayName async {
    // 1. Create the request object using the model's lat/long
    final request = ReverseRequest(
      lat: lat,
      lon: long,
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
  @override
  String toString() {
    return 'ServiceProviderModel{id: $id, name: $name, address: $address, skills: $skills, lat: $lat, long: $long, phonenumber: $phonenumber}';
  }
}