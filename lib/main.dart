import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'Common/routes/route_generator.dart';
import 'Common/size_config/size_config.dart';
import 'Data/Service/geo_locator.dart';
import 'Presentation/Screens/Camera/camera_screen.dart';
import 'Presentation/Screens/Login_&_sign_up/login_&_sign_up.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';

//import 'package:spade/onbording.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  cameras = await availableCameras();

  runApp(
    MultiProvider(
      providers: [
        Provider<GeoLocatorService>(create: (context) => GeoLocatorService()),
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
      ),
    );
  }
}
