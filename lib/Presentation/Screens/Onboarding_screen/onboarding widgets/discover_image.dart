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
      elevation: 7,
      color: Colors.white,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
        width: MediaQuery.of(context).size.width * 0.43,
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(20)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(
              widget.image,
              height: 80,
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
              textAlign: TextAlign.center,
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
