import 'package:flutter/material.dart';
// import 'Common/routes/route_generator.dart';
import 'Common/size_config/size_config.dart';
import 'Presentation/Screens/Login_&_sign_up/login_&_sign_up.dart';

//import 'package:spade/onbording.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Spade',
        theme: ThemeData(),
        // home: Onbording()
        //initialRoute: Routes.getStarted,

        navigatorKey: kNavigatorKey,
        // onGenerateRoute: RouteGenerator.onGenerateRoute,
        //onUnknownRoute: RouteGenerator.unKnownRoute,
        home: const LoginOrSignupScreen());
  }
}
