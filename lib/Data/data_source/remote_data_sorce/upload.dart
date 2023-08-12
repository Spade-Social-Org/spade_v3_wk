// import 'dart:io';

// import 'package:flutter/material.dart';

// import 'api.dart';

// class UploadScreen extends StatefulWidget {
//   final String mediaPath;

//   UploadScreen({required this.mediaPath});

//   @override
//   _UploadScreenState createState() => _UploadScreenState();
// }

// class _UploadScreenState extends State<UploadScreen> {
//   final ApiProvider _apiProvider = ApiProvider();
//   bool _isUploading = false;

//   Future<void> _uploadMedia() async {
//     setState(() {
//       _isUploading = true;
//     });

//     try {
//       await _apiProvider.uploadMedia(widget.mediaPath);
//       setState(() {
//         _isUploading = false;
//       });
//       ScaffoldMessenger.of(context).showSnackBar(
//         SnackBar(content: Text('Media uploaded successfully!')),
//       );
//     } catch (e) {
//       setState(() {
//         _isUploading = false;
//       });
//       ScaffoldMessenger.of(context).showSnackBar(
//         SnackBar(content: Text('Failed to upload media.')),
//       );
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Upload Media'),
//       ),
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             _isUploading
//                 ? LinearProgressIndicator()
//                 : ElevatedButton(
//                     onPressed: _uploadMedia,
//                     child: Text('Upload Media'),
//                   ),
//             SizedBox(height: 20),
//             widget.mediaPath.isNotEmpty
//                 ? SizedBox(
//                   height: 100,
//                   child: Image.file(File(widget.mediaPath)))
//                 : SizedBox(),
//           ],
//         ),
//       ),
//     );
//   }
// }
