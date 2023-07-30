import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:provider/provider.dart';
import 'package:spade_v4/Presentation/Screens/Map/map_screen.dart';
import 'Common/routes/route_generator.dart';
import 'Common/size_config/size_config.dart';
import 'Data/Service/geo_locator.dart';
import 'Presentation/Screens/Login_&_sign_up/login_&_sign_up.dart';

//import 'package:spade/onbording.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

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
      // onGenerateRoute: RouteGenerator.onGenerateRoute,
      //onUnknownRoute: RouteGenerator.unKnownRoute,
      home: FutureBuilder(
        future: geoService.getInitialLocation(),
        builder: (context, _) => LoginOrSignupScreen(),
      ),
    );
  }
}
