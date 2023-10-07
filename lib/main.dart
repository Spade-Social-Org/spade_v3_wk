import 'dart:io';

import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:provider/provider.dart' as p;
import 'package:spade_v4/Data/Models/discover_service.dart';
import 'package:spade_v4/injection.dart' as di;
import 'Common/size_config/size_config.dart';
import 'Data/Service/geo_locator.dart';
import 'Presentation/Bloc/places_bloc.dart';
import 'Presentation/Screens/Buttom_nav/navigation_container.dart';
import 'Presentation/Screens/Camera/camera_screen.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'Presentation/Screens/Login_&_sign_up/landing_screen.dart';
import 'Presentation/Screens/Onboarding_screen/save_user_tokens/save_user_tokens.dart';
import 'injection.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  cameras = await availableCameras();
  di.init();
  runApp(
    p.MultiProvider(
      providers: [
        p.Provider<GeoLocatorService>(create: (context) => GeoLocatorService()),
        p.Provider<DiscoverService>(create: (context) => DiscoverService()),
        BlocProvider<PlacesBloc>(
          create: (context) => locator<PlacesBloc>(),
        ),
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String isLogin = '';

  @override
  void initState() {
    super.initState();
    getvalue();
  }

  getvalue() async {
    await GetUserToken.getLoginValue().then((value) {
      if (value != null) {
        setState(() {
          isLogin = value;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return ProviderScope(
      child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Spade',
          theme: ThemeData(
              scaffoldBackgroundColor: Colors.white, useMaterial3: true),
          navigatorKey: kNavigatorKey,
          home: isLogin.isNotEmpty
              ? const NavigationContainer()
              : const LandingScreen()),
    );
  }
}
