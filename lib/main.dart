import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'Common/routes/route_generator.dart';
import 'Common/size_config/size_config.dart';
import 'Data/Models/discover_service.dart';
import 'Data/Service/geo_locator.dart';
import 'Presentation/Bloc/places_bloc.dart';
import 'Presentation/Screens/Camera/camera_screen.dart';
import 'package:app/injection.dart' as di;
import 'Presentation/Screens/Login_&_sign_up/landing_screen.dart';
import 'injection.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  GeoLocatorService.getInitialLocation();
  cameras = await availableCameras();
  di.init();
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => DiscoverService()),
        Provider<GeoLocatorService>(create: (context) => GeoLocatorService()),
        BlocProvider<PlacesBloc>(
          create: (context) => locator<PlacesBloc>(),
        ),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Spade',
      theme: ThemeData(),
      navigatorKey: kNavigatorKey,
      onGenerateRoute: RouteGenerator.onGenerateRoute,
      onUnknownRoute: RouteGenerator.unKnownRoute,
      home: const LandingScreen(),
    );
  }
}
