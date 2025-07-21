import 'package:flutter/material.dart';

class CustomCircularAvatar extends StatelessWidget {
  final double radius;
  final String? imageUrl;
  final IconData? icon;
  final Color? backgroundColor;
  final Color? iconColor;
  final String? initials;
  final TextStyle? initialsStyle;

  const CustomCircularAvatar({
    super.key,
    this.radius = 40,
    this.imageUrl,
    this.icon,
    this.backgroundColor,
    this.iconColor,
    this.initials,
    this.initialsStyle,
  });

  @override
  Widget build(BuildContext context) {
    if (imageUrl != null && imageUrl!.isNotEmpty) {
      return CircleAvatar(
        radius: radius,
        backgroundImage: NetworkImage(imageUrl!),
        backgroundColor: backgroundColor ?? Colors.grey[300],
      );
    } else if (icon != null) {
      return CircleAvatar(
        radius: radius,
        backgroundColor: backgroundColor ?? Colors.grey[300],
        child: Icon(icon, color: iconColor ?? Colors.white, size: radius),
      );
    } else if (initials != null && initials!.isNotEmpty) {
      return CircleAvatar(
        radius: radius,
        backgroundColor: backgroundColor ?? Colors.grey[300],
        child: Text(
          initials!,
          style:
              initialsStyle ??
              TextStyle(
                color: Colors.white,
                fontSize: radius * 0.6,
                fontWeight: FontWeight.bold,
              ),
        ),
      );
    } else {
      return CircleAvatar(
        radius: radius,
        backgroundColor: backgroundColor ?? Colors.grey[300],
        child: Icon(
          Icons.person,
          color: iconColor ?? Colors.white,
          size: radius,
        ),
      );
    }
  }
}
