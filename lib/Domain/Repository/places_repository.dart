import 'package:google_maps_flutter/google_maps_flutter.dart';
import '../Entities/place.dart';

abstract class PlacesRepository {
  Future<List<Place>> getPlaces(String placeType, LatLng location, {String? nextPageToken});
}
