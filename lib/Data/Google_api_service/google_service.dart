import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:google_maps_flutter/google_maps_flutter.dart';

class ApiService {
  Future<Map<String, dynamic>> getPlaceDetails(LatLng location) async {
    const apiKey = "";
    final url =
        "https://maps.googleapis.com/maps/api/place/details/json?place_id=${location.latitude},${location.longitude}&key=$apiKey";

    final response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      return data['result'];
    } else {
      throw Exception("Failed to fetch location details");
    }
  }
}
