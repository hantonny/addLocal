import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:localiza/models/place.dart';

class MapScreen extends StatefulWidget {
  final PlaceLocation initialLocation;
  final bool isReadonly;
  const MapScreen(
      {this.initialLocation = const PlaceLocation(
        latitude: -20.480168447020752,
        longitude: -54.60436849485835,
      ),
      this.isReadonly = false,
      super.key});

  @override
  State<MapScreen> createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  LatLng? _pickedPosition;

  void _selectPosition(LatLng position) {
    setState(() {
      _pickedPosition = position;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Selecione...',
          style: TextStyle(color: Colors.white),
        ),
        actions: <Widget>[
          if (!widget.isReadonly)
            IconButton(
              icon: const Icon(Icons.check),
              onPressed: _pickedPosition == null
                  ? null
                  : () {
                      Navigator.of(context).pop(_pickedPosition);
                    },
            )
        ],
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
        onTap: widget.isReadonly ? null : _selectPosition,
        markers: (_pickedPosition == null && !widget.isReadonly)
            ? {}
            : {
                Marker(
                  markerId: const MarkerId('p1'),
                  position:
                      _pickedPosition ?? widget.initialLocation.toLatLng(),
                )
              },
      ),
    );
  }
}
