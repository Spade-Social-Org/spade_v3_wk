import 'package:flutter/material.dart';

import '../../Presentation/Screens/Login_&_sign_up/login_&_sign_up.dart';
import 'routes.dart';

class RouteGenerator {
  static Route? onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.login:
        return MaterialPageRoute(builder: (context) => const LoginOrSignupScreen(key: ValueKey(Routes.login)), settings: settings);
      default:
        return null;
    }
  }

  static Route unKnownRoute(_) {
    return MaterialPageRoute(
      builder: (context) => const Scaffold(
        body: Center(child: Text("Page Not Found")),
      ),
    );
  }
}
