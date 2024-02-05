// ignore_for_file: unnecessary_null_comparison, prefer_final_fields

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:localiza/screens/map_screen.dart';
import 'package:localiza/utils/location_util.dart';
import 'package:location/location.dart';

class LocationInput extends StatefulWidget {
  const LocationInput({super.key});

  @override
  State<LocationInput> createState() => _LocationInputState();
}

class _LocationInputState extends State<LocationInput> {
  String? _previewImageUrl;

  Future<void> _getCurrentUserLocation() async {
    final locData = await Location().getLocation();
    final staticMapImageUrl = LocationUtil.generateLocationPreviewImage(
      latitude: locData.latitude!.toDouble(),
      longitude: locData.longitude!.toDouble(),
    );

    setState(() {
      _previewImageUrl = staticMapImageUrl;
    });
  }

  Future<void> _selectOnMap() async {
    final LatLng selectedPosition = await Navigator.of(context).push(
      MaterialPageRoute(
        fullscreenDialog: true,
        builder: (ctx) => const MapScreen(),
      ),
    );
    if (selectedPosition == null) return;

    print(selectedPosition.latitude);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Container(
          height: 170,
          width: double.infinity,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            border: Border.all(
              width: 1,
              color: Colors.grey,
            ),
          ),
          child: _previewImageUrl == null
              ? const Text('Localização não informada!')
              : Image.network(
                  _previewImageUrl!,
                  fit: BoxFit.cover,
                  width: double.infinity,
                ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            TextButton.icon(
              onPressed: _getCurrentUserLocation,
              style: ButtonStyle(
                  iconColor: MaterialStateProperty.all(Colors.indigo)),
              icon: const Icon(Icons.location_on),
              label: const Text(
                'Localização atual',
                style: TextStyle(color: Colors.indigo),
              ),
            ),
            TextButton.icon(
              onPressed: _selectOnMap,
              style: ButtonStyle(
                  iconColor: MaterialStateProperty.all(Colors.indigo)),
              icon: const Icon(Icons.map),
              label: const Text('Selecione no Mapa',
                  style: TextStyle(color: Colors.indigo)),
            )
          ],
        )
      ],
    );
  }
}
