// ignore_for_file: must_be_immutable

import 'dart:io';

import 'package:flutter/material.dart';

import '../../../Common/camera_components/image_top_view_icon.dart';
import '../../../Common/camera_components/sending_image_video.dart';
import '../../../Common/image_properties.dart';

class SendingImageViewPage extends StatefulWidget {
  String path;
  final String receiverId;

  SendingImageViewPage({
    super.key,
    required this.path,
    required this.receiverId,
  });

  @override
  State<SendingImageViewPage> createState() => _SendingImageViewPageState();
}

class _SendingImageViewPageState extends State<SendingImageViewPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Stack(
          children: [
            Image.file(
              File(widget.path),
              fit: BoxFit.contain,
              width: double.infinity,
              height: double.infinity,
            ),
            Positioned(
              // top: 10,
              child: ImageViewTopRowIcons(
                onCropButtonTaped: () {
                  cropImage(widget.path).then((value) {
                    widget.path = value!.path;
                    setState(() {});
                  });
                },
              ),
            ),
            Positioned(
              bottom: 5,
              right: 0,
              left: 0,
              child: SendingImageVideoBottomRowWidget(
                onSendButtonTaped: () {
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
