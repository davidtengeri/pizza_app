import 'dart:convert';
import 'dart:io';

import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:http/http.dart' as http;
import 'package:pizza_app/models/address.dart';

const SZEGED_LATLNG = LatLng(46.2587, 20.14222);

class LocationService {
  static Future<LatLng> find(Address address) async {
    var response = await http.get(_buildUrl(address));
    if (response.statusCode == HttpStatus.ok) {
      var data = jsonDecode(response.body);
      if (data.length > 0) {
        return LatLng(
            double.parse(data[0]['lat']), double.parse(data[0]['lon']));
      }
      return SZEGED_LATLNG;
    }
  }

  static String _buildUrl(Address address) {
    return 'https://nominatim.openstreetmap.org/search?format=json&counrty=Hungary&city=${address.city}&street=${address.houseNumber} ${address.street}';
  }
}
