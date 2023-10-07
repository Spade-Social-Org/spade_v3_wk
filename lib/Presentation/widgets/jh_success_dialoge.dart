import 'package:flutter/material.dart';
import 'package:spade_v4/Presentation/Screens/Home/home_screen_ui.dart';

class SuccessDialog extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('Success!'),
      content: Text('Post Uploaded Successfully.',),
      actions: <Widget>[
        TextButton(
          onPressed: () {
            Navigator.of(context).push(MaterialPageRoute(
                builder: (BuildContext context) => HomeScreenUi(),
              ));
          },
          child: Text('Close'),
        ),
      ],
    );
  }
}