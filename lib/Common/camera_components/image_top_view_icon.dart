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
            navigatePop();
          },
          icon: const Icon(Icons.clear),
        ),
        const Spacer(),
        IconButton(
          splashRadius: 20,
          color: Colors.white,
          icon: const Icon(
            Icons.title,
            size: 27,
          ),
          onPressed: () {},
        ),
        IconButton(
          splashRadius: 20,
          color: Colors.white,
          splashColor: Colors.black38,
          icon: const Icon(
            Icons.edit,
            size: 27,
          ),
          onPressed: () {},
        ),
      ],
    );
  }
}
