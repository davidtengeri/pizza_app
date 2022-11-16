import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:latlong2/latlong.dart';

import 'hive/address.dart';

const szegedLat = 46.2587;
const szegedLng = 20.14222;

class LocationService {
  static Future<LatLng> find(Address address) async {
    var response = await http.get(_buildUrl(address));
    if (response.statusCode == HttpStatus.ok) {
      var data = jsonDecode(response.body);
      if (data.length > 0) {
        return LatLng(
            double.parse(data[0]['lat']), double.parse(data[0]['lon']));
      }
    }
    return LatLng(szegedLat, szegedLng);
  }

  static Uri _buildUrl(Address address) {
    return Uri.parse(
        'https://nominatim.openstreetmap.org/search?format=json&counrty=Hungary&city=${address.city}&street=${address.houseNumber} ${address.street}');
  }
}
