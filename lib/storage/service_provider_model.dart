import 'package:nominatim_flutter/model/request/reverse_request.dart';
import 'package:objectbox/objectbox.dart';
import 'package:nominatim_flutter/nominatim_flutter.dart';

@Entity()
class ServiceProviderModel {
  @Id()
  int id = 0;
  String name;
   List<String> skills;
  double lat;
  double long;
  String phonenumber;

  ServiceProviderModel({
    required this.name,
     required this.skills,
    required this.lat,
    required this.long,
    required this.phonenumber,
  });

  @override
  String toString() {
    return 'ServiceProviderModel{id: $id, name: $name, skills: $skills, lat: $lat, long: $long, phonenumber: $phonenumber}';
  }
}