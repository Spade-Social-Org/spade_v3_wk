import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../../Data/Google_api_service/google_service.dart';

abstract class LocationRepository {
  Future<Map<String, dynamic>> getPlaceDetails(LatLng location);
}

class LocationRepositoryImpl implements LocationRepository {
  final ApiService apiService;

  LocationRepositoryImpl(this.apiService);

  @override
  Future<Map<String, dynamic>> getPlaceDetails(LatLng location) {
    return apiService.getPlaceDetails(location);
  }
}
