import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../../Data/Models/location.dart';
import '../Repository/location_repository.dart';

class GetLocationDetailsUseCase {
  final LocationRepository repository;

  GetLocationDetailsUseCase(this.repository);

  Future<Locations> getLocationDetails(LatLng location) async {
    final details = await repository.getPlaceDetails(location);
    return Locations(name: details['name'], address: details['formatted_address'], urlImage: details['urlImage']);
  }
}
