import 'package:flutter/material.dart';
import 'package:spade_v4/Presentation/widgets/posts/image_%20filter_screen.dart';

import '../../Presentation/Screens/Camera/camera_screen.dart';
import '../../Presentation/Screens/Camera/sending_image_preview.dart';
import '../../Presentation/Screens/Camera/sending_video.dart';
import '../../Presentation/widgets/posts/image_editing_screen.dart';
import 'routes.dart';

class RouteGenerator {
  static Route? onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      // case Routes.login:
      //   return MaterialPageRoute(
      //       builder: (context) =>
      //           const LoginOrSignupScreen(key: ValueKey(Routes.login)),
      //       settings: settings);
      case Routes.cameraRoute:
        final arguments = settings.arguments as Map<String, dynamic>;
        //final String name =arguments['name'];
        final String uId = arguments['uId'];
        return MaterialPageRoute(
          builder: (_) => CameraScreen(receiverId: uId),
        );
      case Routes.sendingImageViewRoute:
        final arguments = settings.arguments as Map<String, dynamic>;
        //final String name =arguments['name'];
        final String uId = arguments['uId'];
        final String path = arguments['path'];
        return MaterialPageRoute(
          builder: (_) => SendingImageViewPage(path: path, receiverId: uId),
        );
      case Routes.sendingVideoViewRoute:
        final arguments = settings.arguments as Map<String, dynamic>;
        //final String name =arguments['name'];
        final String uId = arguments['uId'];
        final String path = arguments['path'];
        return MaterialPageRoute(
          builder: (_) => SendingVideoViewPage(path: path, receiverId: uId),
        );
      case Routes.imageSendingScreen:
        return MaterialPageRoute(
            builder: (context) =>
                const SendImageScreen(key: ValueKey(Routes.imageSendingScreen)),
            settings: settings);
      case Routes.imageSendingScreen2:
        return MaterialPageRoute(
            builder: (context) =>
                const SendImageScreen2(key: ValueKey(Routes.imageSendingScreen2)),
            settings: settings);
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
