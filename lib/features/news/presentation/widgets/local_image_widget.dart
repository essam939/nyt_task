import 'dart:io';

import 'package:flutter/material.dart';

class MyLocalImageWidget extends StatelessWidget {
  final String imagePath;

  const MyLocalImageWidget({super.key, required this.imagePath});

  @override
  Widget build(BuildContext context) {
    return Image.file(
      File(imagePath),
      // You can specify additional parameters like width, height, fit, etc.
      width: 200,
      height: 200,
      fit: BoxFit.cover,
    );
  }
}