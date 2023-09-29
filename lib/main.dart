import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:provider/provider.dart';
import 'package:spade_v4/Data/Models/discover_service.dart';

import 'Common/size_config/size_config.dart';
import 'Presentation/Screens/Buttom_nav/navigation_container.dart';
import 'Presentation/Screens/Login_&_sign_up/landing_screen.dart';
import 'Presentation/Screens/Onboarding_screen/save_user_tokens/save_user_tokens.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool isLogin = false;

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
          theme: ThemeData(scaffoldBackgroundColor: Colors.white),
          // home: Onbording()
          //initialRoute: Routes.getStarted,

          navigatorKey: kNavigatorKey,
          // onGenerateRoute: RouteGenerator.onGenerateRoute,
          //onUnknownRoute: RouteGenerator.unKnownRoute,
          home: isLogin ? const NavigationContainer() : const LandingScreen()),
    );
  }
}
