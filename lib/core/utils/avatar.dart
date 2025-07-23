import 'package:flutter/material.dart';

class CustomCircularAvatar extends StatelessWidget {
  final double radius;
  final String imageUrl;

  const CustomCircularAvatar({
    super.key,
    this.radius = 40,
    required this.imageUrl,
  });

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: radius,
      backgroundImage: AssetImage(imageUrl),
      backgroundColor: Colors.grey[300],
    );
  }
}
