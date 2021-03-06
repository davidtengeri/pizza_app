import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:quiver/core.dart';

class Address {
  int? id;
  String city;
  String street;
  String houseNumber;
  LatLng? latLng;

  Address({
    this.id,
    required this.city,
    required this.street,
    required this.houseNumber,
    this.latLng,
  });

  @override
  bool operator ==(Object value) =>
      value is Address &&
      value.city == city &&
      value.street == street &&
      value.houseNumber == houseNumber;

  @override
  int get hashCode => hash3(city, street, houseNumber);

  Map<String, dynamic> toMap() {
    Map<String, dynamic> map = <String, dynamic>{
      'city': city,
      'street': street,
      'houseNumber': houseNumber,
    };
    if (id != null) {
      map['id'] = id!;
    }
    if (latLng != null) {
      map['lat'] = latLng!.latitude;
      map['lng'] = latLng!.longitude;
    }
    return map;
  }
}
