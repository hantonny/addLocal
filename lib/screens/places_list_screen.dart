import 'package:flutter/material.dart';
import 'package:localiza/providers/great_places.dart';
import 'package:localiza/utils/app_routes.dart';

import 'package:provider/provider.dart';

class PlacesListScreen extends StatelessWidget {
  const PlacesListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).primaryColor,
          title: const Text(
            'Meus Lugares',
            style: TextStyle(color: Colors.white),
          ),
          actions: [
            IconButton(
              color: Colors.white,
              icon: const Icon(Icons.add),
              onPressed: () =>
                  {Navigator.of(context).pushNamed(AppRoutes.PLACE_FORM)},
            )
          ],
        ),
        body: FutureBuilder(
          future: Provider.of<GreatPlaces>(context, listen: false).loadPlaces(),
          builder: (ctx, snapshot) => snapshot.connectionState ==
                  ConnectionState.waiting
              ? const Center(child: CircularProgressIndicator())
              : Consumer<GreatPlaces>(
                  child: const Center(
                    child: Text('Nenhum local cadastrado!'),
                  ),
                  builder: (ctx, greatPlaces, ch) => greatPlaces.itemsCount == 0
                      ? ch!
                      : ListView.builder(
                          itemCount: greatPlaces.itemsCount,
                          itemBuilder: (ctx, i) => ListTile(
                            leading: CircleAvatar(
                              backgroundImage: FileImage(
                                greatPlaces.itemByIndex(i).image,
                              ),
                            ),
                            title: Text(greatPlaces.itemByIndex(i).title),
                            onTap: () {},
                          ),
                        ),
                ),
        ));
  }
}
