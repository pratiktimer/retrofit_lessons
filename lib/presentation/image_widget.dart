import 'package:flutter/material.dart';
import 'package:transparent_image/transparent_image.dart';

class ImageWidget extends StatelessWidget {
  final String imageUrl;
  const ImageWidget({
    Key? key,
    required this.imageUrl,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: 30,
      backgroundImage: FadeInImage.memoryNetwork(
        key: key,
        placeholder: kTransparentImage, // Placeholder image
        image: imageUrl, // Actual image URL
        fit: BoxFit.cover,
      ).image,
    );
  }
}
