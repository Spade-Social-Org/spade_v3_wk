import 'package:flutter/material.dart';

class GroupedAvatar extends StatelessWidget {
  const GroupedAvatar({super.key});

  @override
  Widget build(BuildContext context) {
    return const CircleAvatar(
      radius: 20,
      backgroundColor: Colors.transparent,
      child: Stack(clipBehavior: Clip.none, children: [
        Positioned(
          top: -5,
          child: CircleAvatar(
            radius: 15,
            backgroundImage: AssetImage('assets/images/avatar.png'),
          ),
        ),
        Positioned(
          right: -5,
          child: CircleAvatar(
            radius: 15,
            backgroundImage: AssetImage('assets/images/avatar.png'),
          ),
        ),
        Positioned(
          bottom: -5,
          child: CircleAvatar(
            radius: 15,
            backgroundImage: AssetImage('assets/images/avatar.png'),
          ),
        ),
        Positioned(
          left: -8,
          child: CircleAvatar(
            radius: 15,
            backgroundImage: AssetImage('assets/images/avatar.png'),
          ),
        ),
      ]),
    );
  }
}
