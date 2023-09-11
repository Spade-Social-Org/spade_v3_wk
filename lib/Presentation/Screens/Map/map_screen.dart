import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:geolocator/geolocator.dart';
import 'package:geocoding/geocoding.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:spade_v4/Presentation/widgets/places_items.dart';
import '../../../Common/theme.dart';
import '../../widgets/jh_custom_marker.dart';
import '../../widgets/jh_loader.dart';
import '../../widgets/jh_logger.dart';
import '../../widgets/jh_schedule_button.dart';
import '../../widgets/jh_search_bar.dart';
import '../Global/global.dart';

class GoogleMapScreen extends StatefulWidget {
  const GoogleMapScreen({Key? key}) : super(key: key);

  @override
  State<GoogleMapScreen> createState() => _GoogleMapState();
}

class _GoogleMapState extends State<GoogleMapScreen>
    with SingleTickerProviderStateMixin {
  String mapTheme = '';

  late GoogleMapController? mapController;
  TextEditingController _searchController = TextEditingController();

  Map<String, Marker> _markers = {};
  Set<Polyline> polylines = {};
  bool loadingLocation = true;
  bool isLocationEnabled = false;
  bool trafficEnabled = false;
  late Geolocator geolocator;
  LatLng? _initialPosition;
  LatLng? _searchedLocation;

  @override
  void initState() {
    super.initState();
    //connect();
    ///Load map theme
    DefaultAssetBundle.of(context)
        .loadString('assets/maptheme/nighttheme.json')
        .then((value) {
      mapTheme = value;
    });
    _loadInitialPosition();
    _getCurrentLocation();
  }

  @override
  void dispose() {
    super.dispose();
  }

  // void connect() {
  //   IO.Socket socket = IO.io(
  //     'http://localhost:3000/',
  //     IO.OptionBuilder()
  //         .setTransports(['websocket'])
  //         .setExtraHeaders({'Authorization': 'Bearer $token'})
  //         .build(),
  //   );
  //   socket.connect();
  //   socket.on('event', (data) => print(data));
  //   socket.onDisconnect(() => print('disconnect'));
  //   socket.on('fromServer', () => print());
  //   print(socket.connected);
  // }

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

  void _toggleLocation() {
    setState(() {
      isLocationEnabled = !isLocationEnabled;
    });

    if (isLocationEnabled) {
      _getCurrentLocation();
    } else {
      _initialPosition = null;
    }
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
        //isLocationEnabled = true;
      });
      _addCircle(position);
      double markerOffset = 0.0002;
      addMarker(
        'USER',
        LatLng(position.latitude + markerOffset, position.longitude),
      );
      Polyline polyline = Polyline(
        polylineId: PolylineId('polyline_1'),
        color: Colors.blue,
        width: 5,
        points: [LatLng(position.latitude, position.longitude)],
      );

      setState(() {
        polylines = {polyline};
      });
    } on PlatformException catch (e) {
      /// Handle errors that might occur when fetching the current location
      logger.e("Error: ${e.message}");
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
            rotateGesturesEnabled: true,
            myLocationEnabled: isLocationEnabled,
            myLocationButtonEnabled: false,
            fortyFiveDegreeImageryEnabled: true,
            trafficEnabled: trafficEnabled,
            circles: _circle,
            polylines: polylines,
            onMapCreated: (controller) {
              controller.setMapStyle(mapTheme);
              mapController = controller;

              /// After fetching the location this [SETSTATE] we set the isLocationEnabled to true meaning the button is on
              setState(() {
                isLocationEnabled = true;
              });
            },
            markers: _markers.values.toSet(),
            initialCameraPosition: _initialPosition != null
                ? CameraPosition(target: _initialPosition!, zoom: 14)
                : CameraPosition(target: LatLng(0, 0), zoom: 14),
          ),
          if (loadingLocation)
            const Center(
              child: JHLoadingSpinner(),
            ),
          Positioned(
            left: 20,
            bottom: 20,
            child: GestureDetector(
              onTap: _showBottomSheet,
              child: CircleAvatar(
                backgroundColor: Colors.black,
                radius: 30,
                child: Image.asset('assets/images/places.png'),
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
              child: CircleAvatar(
                backgroundColor: Colors.black,
                radius: 30,
                child: Image.asset('assets/images/people.png'),
              ),
            ),
          ),
          Positioned(
            top: 64 * 2,
            left: 20,
            right: 20,
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _searchController,
                    style: const TextStyle(
                      color: Colors.white,
                    ),
                    decoration: InputDecoration(
                      hintText: "Where would you like to go?",
                      hintStyle: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                      fillColor: Colors.grey.withOpacity(0.8),
                      contentPadding: const EdgeInsets.symmetric(vertical: 12),
                      filled: true,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                        borderSide: BorderSide.none,
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                        borderSide: const BorderSide(
                          color: Colors.white,
                          width: 2.0,
                        ),
                      ),
                      suffixIcon: IconButton(
                        icon: const Icon(
                          Icons.search,
                          color: Colors.white,
                          weight: 30,
                          size: 30,
                        ),
                        onPressed: _searchLocation,
                      ),
                    ),
                    textAlign: TextAlign.center,
                    onSubmitted: (_) {
                      _searchLocation();
                    },
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            top: 36,
            right: 20,
            child: InkWell(
              onTap: _toggleLocation,
              child: Container(
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: isLocationEnabled ? Colors.green : Colors.grey,
                    width: 5.0,
                  ),
                ),
                child: CircleAvatar(
                  backgroundColor: Colors.black,
                  radius: 20,
                  child: Image.asset('assets/images/Union.png'),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Set<Circle> _circle = {};

  void _addCircle(Position position) {
    if (position != null) {
      _circle.add(
        Circle(
          circleId: const CircleId('circle_1'),
          center: LatLng(position.latitude, position.longitude),
          radius: 900,
          fillColor: Colors.grey.withOpacity(0.5),
          strokeWidth: 2,
          strokeColor: Colors.green,
        ),
      );
      setState(() {});
    }
  }

  addMarker(String id, LatLng location) async {
    var customMarkerIcon = CustomMarkerIcon(
      size: 120,
      imagePath: 'assets/images/Ellipse 365.png',
      backgroundColor: Colors.grey.withOpacity(0.5),
    );
    var marker = Marker(
      markerId: MarkerId(id),
      position: location,
      infoWindow: const InfoWindow(title: 'Mr Josh', snippet: 'Hello friend'),
      icon: await customMarkerIcon.createMarkerIcon(),
    );
    _markers[id] = marker;
    setState(() {});
  }

  void _showBottomSheet() {
    showModalBottomSheet<void>(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.black,
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
        top: Radius.circular(30),
      )),
      builder: (BuildContext context) {
        return DraggableScrollableSheet(
          expand: false,
          initialChildSize: 0.4,
          minChildSize: 0.1,
          builder: (BuildContext context, ScrollController) => ListView(
            controller: ScrollController,
            children: [
              const SizedBox(
                height: 2,
              ),
              Center(
                child: Container(
                  width: 20 * 7,
                  height: 6,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20),
                      shape: BoxShape.rectangle),
                ),
              ),
              const JHSearchField(),
              Row(
                children: [
                  const CircleAvatar(
                    radius: 30,
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Row(
                    children: [
                      GestureDetector(
                        onTap: () {},
                        child: Container(
                          decoration: BoxDecoration(
                              border: Border.all(color: Colors.white, width: 2),
                              color: Colors.white38,
                              borderRadius: BorderRadius.circular(20)),
                          height: 30,
                          width: 60,
                          child: Image.asset("assets/images/Vector (2).png"),
                        ),
                      ),
                      const SizedBox(
                        width: 4,
                      ),
                      Container(
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.white, width: 2),
                            color: Colors.white38,
                            borderRadius: BorderRadius.circular(20)),
                        height: 30,
                        width: 60,
                        child: const Icon(
                          Icons.favorite_border,
                          color: Colors.white,
                        ),
                      ),
                      const SizedBox(
                        width: 4,
                      ),
                      GestureDetector(
                        onTap: () {
                          // Navigator.push(
                          //     context,
                          //     MaterialPageRoute(
                          //         builder: (context) =>
                          //             CalenderScreen()));
                        },
                        child: Container(
                          decoration: BoxDecoration(
                              border: Border.all(color: Colors.white, width: 2),
                              color: Colors.white38,
                              borderRadius: BorderRadius.circular(20)),
                          height: 30,
                          width: 60,
                          child: const Icon(
                            Icons.calendar_month_outlined,
                            color: Colors.white,
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 4,
                      ),
                      Container(
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.white, width: 2),
                            color: Colors.white38,
                            borderRadius: BorderRadius.circular(20)),
                        height: 30,
                        width: 60,
                        child: const Icon(
                          Icons.bookmark_border_rounded,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  )
                ],
              ),
              SizedBox(
                height: 200,
                child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: images.length,
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          children: [
                            GestureDetector(
                              onTap: () {
                                Navigator.of(context).pop();
                                _placeShowBottomSheet();
                              },
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(30),
                                child: Container(
                                  color: Colors.white,
                                  height: 90,
                                  width: 100,
                                  child: Image.asset(
                                    images[index],
                                    fit: BoxFit.fill,
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            Text(
                              title[index],
                              style: const TextStyle(color: Colors.white),
                            ),
                          ],
                        ),
                      );
                    }),
              )
            ],
          ),
        );
      },
    );
  }

  void _placeShowBottomSheet() {
    showModalBottomSheet<void>(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.black,
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
        top: Radius.circular(30),
      )),
      builder: (BuildContext context) {
        return DraggableScrollableSheet(
          expand: false,
          initialChildSize: 0.4,
          minChildSize: 0.1,
          builder: (BuildContext context, ScrollController) => ListView(
            controller: ScrollController,
            children: [
              const SizedBox(
                height: 2,
              ),
              Center(
                child: Container(
                  width: 20 * 7,
                  height: 6,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20),
                      shape: BoxShape.rectangle),
                ),
              ),
              const JHSearchField(),
              Row(
                children: [
                  for (int i = 0; i < 3; i++)
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.white, width: 2),
                            color: Colors.white38,
                            borderRadius: BorderRadius.circular(20)),
                        height: 40,
                        width: 100,
                        child: Row(
                          children: [
                            const Icon(
                              Icons.bookmark_border_rounded,
                              color: Colors.white,
                            ),
                            Text(
                              text[i].toString(),
                              style: const TextStyle(
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                ],
              ),
              const Padding(
                padding: EdgeInsets.only(
                  left: 12,
                ),
                child: Text(
                  'Twisted Root Burger',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(
                  left: 12,
                ),
                child: Text(
                  'Burger joint',
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
              ),
              Row(
                children: [
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 12),
                        child: Text(
                          'Open now',
                          style: TextStyle(
                            fontSize: 14,
                            color: CustomColors.greenPrimary,
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      const Text(
                        '0.8 miles',
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.white,
                        ),
                      )
                    ],
                  ),
                  const SizedBox(
                    width: 14,
                  ),
                  Row(
                    children: [
                      JHScheduleButton(
                        title: 'Schedule',
                        onPressed: () {},
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Image.asset('assets/images/arrowforward.png'),
                      const SizedBox(
                        width: 10,
                      ),
                      Image.asset('assets/images/hearticon.png'),
                      const SizedBox(
                        width: 10,
                      ),
                      // Image.asset('assets/images/placeimage.png'),
                    ],
                  ),
                ],
              ),
              SizedBox(
                height: 250,
                child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: images.length,
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: GestureDetector(
                          onTap: () {},
                          child: Container(
                            height: 90 * 10,
                            width: 120,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              image: DecorationImage(
                                image: AssetImage(images[index]),
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        ),
                      );
                    }),
              )
            ],
          ),
        );
      },
    );
  }
}
