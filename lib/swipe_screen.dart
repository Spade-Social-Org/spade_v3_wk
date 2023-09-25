import 'package:flutter/material.dart';

import 'Presentation/Screens/Buttom_nav/navigation_container.dart';
import 'Presentation/Screens/Camera/camera_screen.dart';

class SwipeScreen extends StatelessWidget {
  const SwipeScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        children: const [
          NavigationContainer(),
          CameraScreen(
            receiverId: '',
          ),
        ],
      ),
    );
  }
}
