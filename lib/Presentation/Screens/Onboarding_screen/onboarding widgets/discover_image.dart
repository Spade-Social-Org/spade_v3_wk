// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class DiscoverImage extends StatefulWidget {
  final String image;
  final String imageTile;
  final String imageDesc;
  final bool isSwitched;
  final Color color;
  final Function(bool)? onchange;
  const DiscoverImage({
    Key? key,
    required this.image,
    required this.imageTile,
    required this.imageDesc,
    required this.isSwitched,
    required this.color,
    required this.onchange,
  }) : super(key: key);

  @override
  State<DiscoverImage> createState() => _DiscoverImageState();
}

class _DiscoverImageState extends State<DiscoverImage> {
  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      child: Container(
        padding: const EdgeInsets.all(10),
        width: MediaQuery.of(context).size.width*0.43,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(
              widget.image,
              height: 40,
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              widget.imageTile,
              style: TextStyle(fontWeight: FontWeight.w600),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              widget.imageDesc,
              style: TextStyle(fontSize: 12),
            ),
            Switch(
              activeColor: widget.color,
              value: widget.isSwitched,
              onChanged: widget.onchange,
            ),
          ],
        ),
      ),
    );
  }
}
