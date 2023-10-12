import 'package:flutter/material.dart';
import 'package:spade_v4/Common/size_config/size_config.dart';

void loadingDialog() => showDialog(
      context: kNavigatorKey.currentContext!,
      barrierDismissible: false,
      builder: (BuildContext dialogContext) {
        return Container(
          color: Colors.white,
          child: Center(child: Image.asset("assets/images/ShuffleE.gif")),
        );
      },
    );
