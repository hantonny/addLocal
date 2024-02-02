// ignore_for_file: constant_identifier_names

const GOOGlE_API_KEY = 'AIzaSyDMvPYuHLuEaJtDBZBqGyMsr45UtglskTU';

class LocationUtil {
  static String generateLocationPreviewImage({
    required double latitude,
    required double longitude,
  }) {
    return 'https://maps.googleapis.com/maps/api/staticmap?center=$latitude,$longitude&zoom=13&size=600x300&maptype=roadmap&markers=color:red%7Clabel:A%7C$latitude,$longitude&key=$GOOGlE_API_KEY';
  }
}
