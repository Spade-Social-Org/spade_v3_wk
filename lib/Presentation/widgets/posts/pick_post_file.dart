// import 'dart:io';

// import 'package:flutter/material.dart';
// import 'package:image_picker/image_picker.dart';

// class PickPostFile extends StatefulWidget {
//   const PickPostFile({super.key});

//   @override
//   State<PickPostFile> createState() => _PickPostFileState();
// }

// class _PickPostFileState extends State<PickPostFile> {

// final List<File> _selectedFiles = [];

//   void _selectMedia() async {
//     final pickedMedia =
//         await ImagePicker().pickVideo(source: ImageSource.gallery);

//     // if (pickedMedia != null) {
//     //   setState(() {
//     //     _selectedFiles.add(File(pickedMedia.path));
//     //   });
      
//     // }
//      if (pickedMedia != null) {
//       // ignore: use_build_context_synchronously
//       Navigator.push(
//         context,
//         MaterialPageRoute(
//           builder: (context) => ImageDisplayScreen(image: File(pickedMedia.path)),
//         ),
//       );
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Container();
//   }
// }