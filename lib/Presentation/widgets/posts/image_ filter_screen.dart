//
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:spade_v4/Common/extensions/barrel_extensions.dart';

import '../../../Common/managers/asset_manager/asset_manager.dart';
import '../../../Common/managers/color_filter/color_filter.dart';
import '../../../Common/managers/color_manager/color_manager.dart';
import '../../../Common/managers/font_style_manager/font_style_manager.dart.dart';
import 'image_editing_screen.dart';

class SendImageScreen2 extends StatefulWidget {
  final File? image;

  const SendImageScreen2({super.key, this.image});

  @override
  State<SendImageScreen2> createState() => _SendImageScreen2State();
}

final GlobalKey _globalKey = GlobalKey();
final List<List<double>> filters = [
  noFilters,
  sepium,
  greyScale,
  sepia,
  colorShift,
  purple,
  yellow,
  blackAndhite,
  coldLife
];

// Future<void> _cropImage(BuildContext context) async {
// CroppedFile  = await ImageCropper().cropImage(
//       sourcePath: ,
//       aspectRatioPresets: [
//         CropAspectRatioPreset.square,
//         CropAspectRatioPreset.ratio3x2,
//         CropAspectRatioPreset.original,
//         CropAspectRatioPreset.ratio4x3,
//         CropAspectRatioPreset.ratio16x9
//       ],
//       uiSettings: [
//         AndroidUiSettings(
//             toolbarTitle: 'Cropper',
//             toolbarColor: Colors.deepOrange,
//             toolbarWidgetColor: Colors.white,
//             initAspectRatio: CropAspectRatioPreset.original,
//             lockAspectRatio: false),
//         IOSUiSettings(
//           title: 'Cropper',
//         ),
//         WebUiSettings(
//           context: context,
//         ),
//       ],
//     );
// }


// Future<void> _cropImage(BuildContext context) async {
//   File? croppedImage = await ImageCropper().cropImage(
//     sourcePath: widget.image!.path, 
//     aspectRatioPresets: [
//       CropAspectRatioPreset.square,
//       CropAspectRatioPreset.ratio3x2,
//       CropAspectRatioPreset.original,
//       CropAspectRatioPreset.ratio4x3,
//       CropAspectRatioPreset.ratio16x9,
//     ],
//     uiSettings: [
//       AndroidUiSettings(
//         toolbarTitle: 'Cropper',
//         toolbarColor: Colors.deepOrange,
//         toolbarWidgetColor: Colors.white,
//         initAspectRatio: CropAspectRatioPreset.original,
//         lockAspectRatio: false,
//       ),
//       IOSUiSettings(
//         title: 'Cropper',
//       ),
//       WebUiSettings(
//         context: context,
//       ),
//     ],
//   );
// }


class _SendImageScreen2State extends State<SendImageScreen2> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: RepaintBoundary(
          key: _globalKey,
          child: Stack(
            fit: StackFit.expand,
            children: [
              PageView.builder(
                itemCount: filters.length,
                itemBuilder: (context, index) {
                  return ColorFiltered(
                    colorFilter: ColorFilter.matrix(filters[index]),
                    child: Image.file(
                      widget.image!,
                      fit: BoxFit.cover,
                    ),
                  );
                },
              ),
              Positioned(
                top: 48.height(),
                left: 39.width(),
                child: GestureDetector(
                    onTap: () => Navigator.pop(context),
                    child: Image.asset(AssetManager.arrowIcon14,
                        width: 34.width())),
              ),
              // Positioned(
              //   top: 47.height(),
              //   left: 160.width(),
              //   child: GestureDetector(
              //     onTap: () {},
              //     child: Container(
              //       height: 25.height(),
              //       width: 110.width(),
              //       decoration: BoxDecoration(
              //         borderRadius: BorderRadius.circular(5),
              //         color: ColorManager.black101,
              //       ),
              //       child: Row(
              //         children: [
              //           Padding(
              //             padding: EdgeInsets.only(
              //               left: 24.width(),
              //             ),
              //             child: const Text(
              //               'Add sound',
              //               style: Inter.font144,
              //             ),
              //           )
              //         ],
              //       ),
              //     ),
              //   ),
              // ),
              Positioned(
                top: 59.width(),
                left: 387.width(),
                child: Column(
                  children: [
                    InkWell(
                        child: Image.asset(AssetManager.arrowIcon7,
                            width: 30.width())),
                    SizedBox(height: 20.height()),
                    InkWell(
                        child: Image.asset(AssetManager.arrowIcon10,
                            width: 30.width())),
                    SizedBox(height: 20.height()),
                    Image.asset(AssetManager.arrowIcon12, width: 30.width()),
                    SizedBox(height: 20.height()),
                    Image.asset(AssetManager.arrowIcon13, width: 30.width()),
                    SizedBox(height: 20.height()),
                    Image.asset(AssetManager.arrowIcon9, width: 30.width()),
                    SizedBox(height: 20.height()),
                    Image.asset(AssetManager.arrowIcon11, width: 30.width()),
                  ],
                ),
              ),
              Positioned(
                top: 454.height(),
                child: Row(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(left: 70.width()),
                      child: Image.asset(
                        AssetManager.arrowIcon6,
                        height: 64.height(),
                      ),
                    ),
                    SizedBox(
                      width: 10.width(),
                    ),
                    Container(
                      height: 39.height(),
                      width: 159.width(),
                      decoration: BoxDecoration(
                        borderRadius:
                            const BorderRadius.all(Radius.circular(20)),
                        color: Colors.black.withOpacity(0.4000000059604645),
                      ),
                      child: const Center(
                        child: Text(
                          "Swipe for filters!",
                          style: Inter.font16,
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(right: 70.width()),
                      child: Image.asset(
                        AssetManager.arrowIcon5,
                        height: 64.height(),
                      ),
                    )
                  ],
                ),
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
                            top: 18.height(),
                            left: 39.width(),
                            bottom: 19.height()),
                        child: GestureDetector(
                          onTap: () {},
                          child: Container(
                            width: 70.width(),
                            height: 27.height(),
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
                                    AssetManager.arrowIcon3,
                                    width: 17.width(),
                                  )),
                                ),
                                SizedBox(
                                  width: 6.width(),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(top: 4.height()),
                                  child: const Text(
                                    "Feed",
                                    style: Inter.font12,
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 15.width(),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 18.height()),
                        child: GestureDetector(
                          onTap: () {},
                          child: Container(
                            width: 73.width(),
                            height: 27.height(),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12),
                              color: ColorManager.black101,
                            ),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: EdgeInsets.only(
                                    left: 5.width(),
                                  ),
                                  child: Center(
                                      child: Image.asset(
                                    AssetManager.arrowIcon4,
                                    width: 17.width(),
                                  )),
                                ),
                                SizedBox(
                                  width: 5.width(),
                                ),
                                const Center(
                                    child: Text(
                                  "Story",
                                  style: Inter.font12,
                                )),
                              ],
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 119.width(),
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                            top: 13.height(),
                            right: 16.width(),
                            bottom: 15.height()),
                        child: GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                    SendImageScreen(image: widget.image!),
                              ),
                            );
                          },
                          child: Container(
                            width: 95.width(),
                            height: 36.height(),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
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
        ),
      ),
    );
  }
}
