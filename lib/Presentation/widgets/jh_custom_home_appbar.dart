import 'package:flutter/material.dart';

class JHCustomHomeAppBar extends StatelessWidget {
  const JHCustomHomeAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      leading: const Text(""),
      elevation: 0,
      backgroundColor: Colors.black,
      pinned: true,
      centerTitle: false,
      title: const Text(
        "FEED",
        style: TextStyle(color: Colors.white),
      ),
      actions: [
        SizedBox(
          height: 60,
          width: 60,
          child: Image.asset("assets/images/Camera.png"),
        ),
        SizedBox(
          height: 60,
          width: 60,
          child: Image.asset("assets/images/Group 1723.png"),
        ),
        SizedBox(
          height: 60,
          width: 60,
          child: Image.asset("assets/images/mdi_bell-notification-outline.png"),
        ),
      ],
    );
  }
}
