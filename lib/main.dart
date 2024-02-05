import 'package:flutter/material.dart';
import 'package:localiza/providers/great_places.dart';
import 'package:localiza/screens/place_detail_screen.dart';
import 'package:localiza/screens/places_form_screen.dart';
import 'package:localiza/screens/places_list_screen.dart';
import 'package:localiza/utils/app_routes.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (ctx) => GreatPlaces(),
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primaryColor: Colors.indigo,
          useMaterial3: true,
          iconTheme: const IconThemeData(color: Colors.white),
        ),
        home: const PlacesListScreen(),
        routes: {
          AppRoutes.PLACE_FORM: (ctx) => const PlaceFormScreen(),
          AppRoutes.PLACE_DETAIL: (ctx) => const PlaceDetailScreen()
        },
      ),
    );
  }
}
