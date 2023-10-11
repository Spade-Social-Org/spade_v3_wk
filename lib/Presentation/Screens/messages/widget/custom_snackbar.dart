import 'package:flutter/material.dart';

import '../../../../Common/size_config/size_config.dart';

void customSnackBar(data) =>
    ScaffoldMessenger.of(kNavigatorKey.currentContext!).showSnackBar(SnackBar(
        duration: const Duration(minutes: 1),
        content: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              data,
              style: const TextStyle(
                  fontSize: 16,
                  color: Colors.white,
                  fontWeight: FontWeight.w500),
            ),
            Align(
                alignment: Alignment.bottomRight,
                child: TextButton(
                    onPressed: () =>
                        ScaffoldMessenger.of(kNavigatorKey.currentContext!)
                            .removeCurrentSnackBar(),
                    child: const Text(
                      'DISMISS',
                      style: TextStyle(
                          fontSize: 16,
                          color: Colors.white,
                          fontWeight: FontWeight.w600),
                    )))
          ],
        )));
