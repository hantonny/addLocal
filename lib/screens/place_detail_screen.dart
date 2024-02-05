import 'package:flutter/material.dart';
import 'package:localiza/models/place.dart';
import 'package:localiza/screens/map_screen.dart';

class PlaceDetailScreen extends StatelessWidget {
  const PlaceDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Place place = ModalRoute.of(context)!.settings.arguments as Place;
    return Scaffold(
      appBar: AppBar(
        iconTheme: Theme.of(context).iconTheme,
        backgroundColor: Theme.of(context).primaryColor,
        title: Text(
          place.title,
          style: const TextStyle(color: Colors.white),
        ),
      ),
      body: Column(
        children: <Widget>[
          SizedBox(
            height: 250,
            width: double.infinity,
            child: Image.file(
              place.image,
              fit: BoxFit.cover,
              width: double.infinity,
            ),
          ),
          const SizedBox(height: 10),
          Text(
            place.location!.address!,
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 20,
              color: Colors.grey,
            ),
          ),
          const SizedBox(height: 10),
          TextButton.icon(
            icon: const Icon(Icons.map),
            label: const Text('Ver no Mapa'),
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  fullscreenDialog: true,
                  builder: (ctx) => MapScreen(
                    isReadonly: true,
                    initialLocation: place.location!,
                  ),
                ),
              );
            },
          )
        ],
      ),
    );
  }
}
