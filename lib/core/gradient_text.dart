import 'package:flutter/material.dart';

class GradientBackground {
  static gradientText(String text, List<Color> colors, {TextStyle? style}) {
    return ShaderMask(
      // Gradient title
      shaderCallback: (bounds) => LinearGradient(
        colors: [...colors],
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
      ).createShader(Rect.fromLTWH(0, 0, bounds.width, bounds.height)),
      child: Text(text, style: style),
    );
  }

  //gradient icon
  static gradientIcon(IconData icon, List<Color> colors) {
    return ShaderMask(
      // Gradient title
      shaderCallback: (bounds) => LinearGradient(
        colors: [...colors],
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
      ).createShader(Rect.fromLTWH(0, 0, bounds.width, bounds.height)),
      child: Icon(icon, color: Colors.white),
    );
  }
}
