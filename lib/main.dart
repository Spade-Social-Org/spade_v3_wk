import 'package:flutter/material.dart';

// import 'Common/routes/route_generator.dart';
import 'Common/size_config/size_config.dart';
import 'Presentation/Screens/Buttom_nav/navigation_container.dart';
import 'Presentation/Screens/Login_&_sign_up/login_&_sign_up.dart';
import 'Presentation/Screens/Onboarding_screen/save_user_tokens/save_user_tokens.dart';

//import 'package:spade/onbording.dart';

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
  void initState() async {
    super.initState();
    await GetUserToken.getLoginValue().then((value) {
      if (value != null) {
        setState((){
          isLogin = value;
          });   
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Spade',
      theme: ThemeData(scaffoldBackgroundColor: Colors.white),
      // home: Onbording()
      //initialRoute: Routes.getStarted,

      navigatorKey: kNavigatorKey,
      // onGenerateRoute: RouteGenerator.onGenerateRoute,
      //onUnknownRoute: RouteGenerator.unKnownRoute,
      home: isLogin
          ? const NavigationContainer()
          : const LoginOrSignupScreen()
    );
  }
}
