import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:hive/hive.dart';
import 'package:pizza_app/location_service.dart';

part 'address.g.dart';

@HiveType(typeId: 1)
class Address extends HiveObject {
  @HiveField(0)
  int? id;
  @HiveField(1)
  String city;
  @HiveField(2)
  String street;
  @HiveField(3)
  String houseNumber;
  @HiveField(4)
  double? latitude;
  @HiveField(5)
  double? longitude;

  Address({
    this.id,
    required this.city,
    required this.street,
    required this.houseNumber,
  });

  set latLng(LatLng latLng) {
    latitude = latLng.latitude;
    longitude = latLng.longitude;
  }

  LatLng get latLng {
    if (latitude == null || longitude == null) {
      return SZEGED_LATLNG;
    }
    return LatLng(latitude!, longitude!);
  }
}
