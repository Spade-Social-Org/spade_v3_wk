import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_image_compress/flutter_image_compress.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:geolocator/geolocator.dart';
import 'package:geocoding/geocoding.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../widgets/jh_custom_marker.dart';
import '../Global/global.dart';

class GoogleMapScreen extends StatefulWidget {
  const GoogleMapScreen({Key? key}) : super(key: key);

  @override
  State<GoogleMapScreen> createState() => _GoogleMapState();
}

class _GoogleMapState extends State<GoogleMapScreen> {
  late GoogleMapController? mapController;
  TextEditingController _searchController = TextEditingController();

  Map<String, Marker> _markers = {};
  bool loadingLocation = true;
  late Geolocator geolocator;
  LatLng? _initialPosition;
  LatLng? _searchedLocation;

  @override
  void initState() {
    super.initState();
    _loadInitialPosition();
    _getCurrentLocation();
  }

  Future<void> _loadInitialPosition() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    double? cachedLatitude = prefs.getDouble('latitude');
    double? cachedLongitude = prefs.getDouble('longitude');

    if (cachedLatitude != null && cachedLongitude != null) {
      setState(() {
        _initialPosition = LatLng(cachedLatitude, cachedLongitude);
      });
    }

    _getCurrentLocation();
  }

  void _getCurrentLocation() async {
    try {
      /// Request location permissions explicitly
      LocationPermission permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied ||
          permission == LocationPermission.deniedForever) {
        /// Handle the case where permissions are denied
        /// You can show a dialog to inform the user or take any other action
        setState(() {
          loadingLocation = false;
        });
        return;
      }

      /// Permissions are granted or allowed while using the app, proceed with fetching the location
      Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high,
      );
      List<Placemark> placemarks = await placemarkFromCoordinates(
        position.latitude,
        position.longitude,
      );

      ///store the initial position in cache
      SharedPreferences prefs = await SharedPreferences.getInstance();
      prefs.setDouble('latitude', position.latitude);
      prefs.setDouble('longitude', position.longitude);

      String userAddress = placemarks.isNotEmpty
          ? "${placemarks.first.name}, ${placemarks.first.locality}, ${placemarks.first.administrativeArea}"
          : "Unknown Location";

      /// Center the map on the current location
      mapController?.animateCamera(
        CameraUpdate.newCameraPosition(
          CameraPosition(
            target: LatLng(position.latitude, position.longitude),
            zoom: 14,
          ),
        ),
      );

      /// Update the search bar text with the user's address
      setState(() {
        _initialPosition = LatLng(position.latitude, position.longitude);
        _searchController.text = userAddress;
        loadingLocation = false;
      });

      addMarker(
        'USER',
        LatLng(position.latitude, position.longitude),
      );
    } on PlatformException catch (e) {
      /// Handle errors that might occur when fetching the current location
      print("Error: ${e.message}");
      setState(() {
        loadingLocation = false;
      });
    }
  }

  void _searchLocation() async {
    String searchText = _searchController.text;
    if (searchText.isEmpty) return;

    try {
      List<Location> locations = await locationFromAddress(searchText);
      if (locations.isNotEmpty) {
        setState(() {
          _searchedLocation =
              LatLng(locations.first.latitude, locations.first.longitude);
          mapController?.animateCamera(
            CameraUpdate.newCameraPosition(
              CameraPosition(
                target: _searchedLocation!,
                zoom: 14,
              ),
            ),
          );
        });
      }
    } catch (e) {
      print("Error searching location: $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          GoogleMap(
            onMapCreated: (controller) {
              mapController = controller;
            },
            markers: _markers.values.toSet(),
            initialCameraPosition: _initialPosition != null
                ? CameraPosition(target: _initialPosition!, zoom: 14)
                : CameraPosition(target: LatLng(0, 0), zoom: 14),
          ),
          if (loadingLocation)
            const Center(
              child: CircularProgressIndicator(),
            ),
          Positioned(
            left: 20,
            bottom: 20,
            child: GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const GlobalScreen(),
                  ),
                );
              },
              child: const CircleAvatar(
                backgroundColor: Colors.black,
                radius: 40,
                child: Icon(Icons.home_work_outlined),
              ),
            ),
          ),
          Positioned(
            right: 70,
            bottom: 20,
            child: GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const GlobalScreen(),
                  ),
                );
              },
              child: const CircleAvatar(
                backgroundColor: Colors.black,
                radius: 40,
                child: Icon(Icons.home_work_outlined),
              ),
            ),
          ),
          Positioned(
            top: 40,
            left: 20,
            right: 20,
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _searchController,
                    decoration: InputDecoration(
                      hintText: "Search location",
                      border: OutlineInputBorder(),
                      suffixIcon: IconButton(
                        icon: Icon(Icons.search),
                        onPressed: _searchLocation,
                      ),
                    ),
                    onSubmitted: (_) {
                      _searchLocation();
                    },
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  addMarker(String id, LatLng location) async {
    var customMarkerIcon = CustomMarkerIcon(
      size: 85,
      imagePath: 'assets/images/Ellipse 365.png',
      backgroundColor: Colors.grey.withOpacity(0.5), color: Colors.lightGreenAccent,
    );
    var marker = Marker(
      markerId: MarkerId(id),
      position: location,
      infoWindow:
          const InfoWindow(title: 'Mr Josh', snippet: 'Hello friend'),
      icon: await customMarkerIcon.createMarkerIcon(),
    );
    _markers[id] = marker;
    setState(() {});
  }
}
