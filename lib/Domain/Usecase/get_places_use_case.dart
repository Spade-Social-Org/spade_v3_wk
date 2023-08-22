import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../Entities/place.dart';
import '../Repository/places_repository.dart';

class GetPlaces {
  final PlacesRepository repository;

  GetPlaces(this.repository);

  Future<GetPlacesResult> call(String placeType, LatLng location,
      {String? nextPageToken}) async {
    final places = await repository.getPlaces(placeType, location,
        nextPageToken: nextPageToken);
    return GetPlacesResult(places, nextPageToken);
  }
}

class GetPlacesResult {
  final List<Place> places;
  final String? nextPageToken;

  GetPlacesResult(this.places, this.nextPageToken);
}
