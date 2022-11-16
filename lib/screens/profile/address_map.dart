import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_map/plugin_api.dart';
import 'package:pizza_app/hive/address.dart';

class AddressMap extends StatefulWidget {
  final Address address;

  AddressMap({Key? key, required this.address}) : super(key: key);

  @override
  _AddressMapState createState() => _AddressMapState();
}

class _AddressMapState extends State<AddressMap> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      child: FlutterMap(
        options: MapOptions(
          allowPanning: false,
          center: widget.address.latLng,
        ),
        nonRotatedChildren: [
          AttributionWidget.defaultWidget(
            source: 'OpenStreetMap contributors',
            onSourceTapped: null,
          ),
        ],
        children: [
          TileLayerWidget(
            options: TileLayerOptions(
              urlTemplate: "https://tile.openstreetmap.org/{z}/{x}/{y}.png",
            ),
          ),
          MarkerLayerWidget(
            options: MarkerLayerOptions(
              markers: [
                Marker(
                    point: widget.address.latLng,
                    builder: (context) => Icon(Icons.location_on)),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
