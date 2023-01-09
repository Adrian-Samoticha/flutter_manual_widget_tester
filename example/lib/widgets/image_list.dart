import 'package:flutter/material.dart';

class ImageList extends StatelessWidget {
  const ImageList(
      {super.key, required this.numberOfImages, required this.imagePadding});

  final int numberOfImages;
  final double imagePadding;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          const Text('Some pretty images:'),
          ...List.generate(
            numberOfImages,
            (index) => Padding(
              padding: EdgeInsets.all(imagePadding),
              child: Image.network(
                  'https://picsum.photos/seed/flutter$index/1280/960'),
            ),
          )
        ],
      ),
    );
  }
}
