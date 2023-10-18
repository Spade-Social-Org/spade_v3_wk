import 'package:flutter/material.dart';

import '../navigator.dart';

class ImageViewTopRowIcons extends StatelessWidget {
  final VoidCallback onCropButtonTaped;
  const ImageViewTopRowIcons({
    super.key,
    required this.onCropButtonTaped,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        IconButton(
          splashRadius: 20,
          iconSize: 30,
          color: Colors.white,
          onPressed: () {
            pop();
          },
          icon: const Icon(Icons.clear),
        ),
        const Spacer(),
      ],
    );
  }
}
