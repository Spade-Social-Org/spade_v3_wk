//
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:spade_v4/Common/extensions/barrel_extensions.dart';

import '../../../Common/managers/asset_manager/asset_manager.dart';
import '../../../Common/managers/color_manager/color_manager.dart';
import '../../../Common/managers/font_style_manager/font_style_manager.dart.dart';
import '../../../Data/data_source/remote_data_sorce/api2.dart';

class SendImageScreen extends StatefulWidget {
  final File? image;
  String path;
  final String receiverId;

  SendImageScreen({
    super.key,
    this.image,
    required this.receiverId,
    required this.path,
  });

  @override
  State<SendImageScreen> createState() => _SendImageScreenState();
}

class _SendImageScreenState extends State<SendImageScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          // Image.file(
          //   widget.image!,
          //   fit: BoxFit.cover,
          // ),
          Image.file(
            File(widget.path),
            fit: BoxFit.cover,
            width: double.infinity,
            // height: double.infinity,
          ),
          Positioned(
            bottom: 0,
            child: Container(
              height: 64.height(),
              width: 428.width(),
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(15),
                  topRight: Radius.circular(15),
                ),
                color: Colors.black,
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.only(
                        top: 13.height(),
                        left: 16.width(),
                        bottom: 15.height()),
                    child: GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Container(
                        width: 105.width(),
                        height: 38.height(),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          color: ColorManager.black101,
                        ),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: EdgeInsets.only(
                                left: 8.width(),
                              ),
                              child: Center(
                                  child: Image.asset(
                                AssetManager.arrowIcon1,
                                width: 14.9.width(),
                              )),
                            ),
                            SizedBox(
                              width: 5.width(),
                            ),
                            const Center(
                                child: Text(
                              "Discard",
                              style: Inter.font14,
                            )),
                          ],
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 195.width(),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                        top: 13.height(),
                        right: 16.width(),
                        bottom: 15.height()),
                    child: GestureDetector(
                      onTap: () async {
                        // await ApiService.createPost3(widget.image!);
                        await ApiService.createAndDisplayPost(widget.image!);
                      },
                      child: Container(
                        width: 95.width(),
                        height: 36.height(),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          color: ColorManager.black101,
                        ),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: EdgeInsets.only(
                                left: 14.width(),
                              ),
                              child: const Center(
                                  child: Text(
                                "Next",
                                style: Inter.font17,
                              )),
                            ),
                            SizedBox(
                              width: 9.width(),
                            ),
                            Center(
                                child: Image.asset(
                              AssetManager.arrowIcon2,
                              width: 14.9.width(),
                            )),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
