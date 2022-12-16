import 'package:flutter/material.dart';

class ImageList extends StatelessWidget {
  const ImageList(
      {super.key, required this.numberOfImages, required this.padding});

  final int numberOfImages;
  final double padding;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: List.generate(
            numberOfImages,
            (index) => Padding(
                  padding: EdgeInsets.all(padding),
                  child: Image.network(
                      'https://picsum.photos/seed/foobar$index/1280/960'),
                )),
      ),
    );
  }
}
