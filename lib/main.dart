import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'Common/routes/route_generator.dart';
import 'Common/size_config/size_config.dart';
import 'Data/Google_api_service/apiservice.dart';
import 'Data/Service/geo_locator.dart';
import 'Domain/Repository/places_repository.dart';
import 'Domain/Usecase/get_places_use_case.dart';
import 'Presentation/Bloc/places_bloc.dart';
import 'Presentation/Screens/Camera/camera_screen.dart';
import 'package:spade_v4/injection.dart' as di;
import 'Presentation/Screens/Login_&_sign_up/login_&_sign_up.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:http/http.dart' as http;

import 'injection.dart';


Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  cameras = await availableCameras();
  di.init();
  runApp(
    MultiProvider(
      providers: [
        Provider<GeoLocatorService>(create: (context) => GeoLocatorService()),
        BlocProvider<PlacesBloc>(
          create: (context) => locator<PlacesBloc>(),
        ),
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    final geoService = Provider.of<GeoLocatorService>(context, listen: false);

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Spade',
      theme: ThemeData(),
      // home: Onbording()
      //initialRoute: Routes.getStarted,
      navigatorKey: kNavigatorKey,
      onGenerateRoute: RouteGenerator.onGenerateRoute,
      onUnknownRoute: RouteGenerator.unKnownRoute,
      home: FutureBuilder(
        future: geoService.getInitialLocation(),
        builder: (context, _) => LoginOrSignupScreen(),
          //MyHomePages
      ),
    );
  }
}
