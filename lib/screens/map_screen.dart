import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:localiza/models/place.dart';

class MapScreen extends StatefulWidget {
  final PlaceLocation initialLocation;
  const MapScreen(
      {this.initialLocation = const PlaceLocation(
        latitude: 37.419857,
        longitude: -122.078827,
      ),
      super.key});

  @override
  State<MapScreen> createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Selecione...',
          style: TextStyle(color: Colors.white),
        ),
        iconTheme: Theme.of(context).iconTheme,
        backgroundColor: Theme.of(context).primaryColor,
      ),
      body: GoogleMap(
        initialCameraPosition: CameraPosition(
          target: LatLng(
            widget.initialLocation.latitude,
            widget.initialLocation.longitude,
          ),
          zoom: 13,
        ),
      ),
    );
  }
}
