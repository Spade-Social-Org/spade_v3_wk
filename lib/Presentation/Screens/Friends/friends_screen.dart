import 'package:flutter/material.dart';
import 'package:spade_v4/Common/extensions/barrel_extensions.dart';

class FriendsScreen extends StatefulWidget {
  const FriendsScreen({Key? key}) : super(key: key);

  @override
  State<FriendsScreen> createState() => _FriendsScreenState();
}

class _FriendsScreenState extends State<FriendsScreen> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 25.width(), bottom: 20.height()),
      child: SizedBox(
        height: 30.height(),
        width: 200.width(),
      ),
    );
  }
}
