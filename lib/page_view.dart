import 'package:flutter/material.dart';

import 'Presentation/Screens/Buttom_nav/navigation_container.dart';
import 'Presentation/Screens/Camera/camera_screen.dart';

class SwipeScreens extends StatelessWidget {
  const SwipeScreens({super.key});
///This page controls the swipe of right to left of the page
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        children: const [
          NavigationContainer(),
          CameraScreen(receiverId: '',),
        ],
      ),
    );
  }
}
