import 'package:objectbox/objectbox.dart';

@Entity()
class ServiceProviderModel {
  @Id()
  int id = 0;
  String name;
  String address;
  List<String> skills;
  int lat;
  int long;
  int phonenumber;

  ServiceProviderModel({
    required this.name,
    required this.address,
    required this.skills,
    required this.lat,
    required this.long,
    required this.phonenumber,
  });

  @override
  String toString() {
    return 'ServiceProviderModel{id: $id, name: $name, address: $address, skills: $skills, lat: $lat, long: $long, phonenumber: $phonenumber}';
  }
}