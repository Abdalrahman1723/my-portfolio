import 'package:flutter/material.dart';
import 'package:my_portfolio/core/gradient_text.dart';
import 'package:my_portfolio/core/utils/avatar.dart';

class IntroSection extends StatelessWidget {
  const IntroSection({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    // Define breakpoints
    const smallScreenMax = 800.0;
    const mediumScreenMax = 1100.0;

    bool isSmall = screenWidth < smallScreenMax;
    bool isMedium =
        screenWidth >= smallScreenMax && screenWidth < mediumScreenMax;

    // Responsive values
    double avatarRadius = isSmall
        ? 60
        : isMedium
        ? 100
        : 150;
    double padding = isSmall
        ? 12
        : isMedium
        ? 24
        : 40;
    double helloFontSize = isSmall
        ? 18
        : isMedium
        ? 32
        : 50;
    double nameFontSize = isSmall
        ? 24
        : isMedium
        ? 45
        : 70;
    double catchPhraseFontSize = isSmall
        ? 14
        : isMedium
        ? 20
        : 28;
    double titlesFontSize = isSmall
        ? 12
        : isMedium
        ? 14
        : 18;
    double avatarSpacing = isSmall ? 12 : 20;
    double sectionSpacing = isSmall ? 8 : 12;

    Widget avatar = CustomCircularAvatar(
      imageUrl: "images/intro.jpg",
      radius: avatarRadius,
    );

    Widget nameAndBrief = Column(
      crossAxisAlignment: isSmall
          ? CrossAxisAlignment.start
          : CrossAxisAlignment.center,
      children: [
        GradientBackground.gradientText("Hello, World! I'm", [
          Colors.deepPurpleAccent,
          Colors.blueAccent,
        ], style: TextStyle(fontSize: helloFontSize)),
        Text(
          "Abdalrahman",
          style: TextStyle(fontSize: nameFontSize, fontWeight: FontWeight.bold),
        ),
        Text(
          "Developer by day, debugger by night,\nGoogler 24/7.",
          style: TextStyle(
            fontSize: catchPhraseFontSize,
            color: Colors.blueGrey,
          ),
          overflow: TextOverflow.clip,
          textAlign: TextAlign.start,
        ),
        SizedBox(height: sectionSpacing),
        Text(
          "Software engineer | Flutter developer | Part-Time Bug Creator 🐞",
          style: TextStyle(fontSize: titlesFontSize),
          overflow: TextOverflow.visible,
        ),
      ],
    );

    return Container(
      padding: EdgeInsets.all(padding),
      decoration: BoxDecoration(),
      child: isSmall
          ? Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                avatar,
                SizedBox(height: avatarSpacing),
                nameAndBrief,
              ],
            )
          : Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                avatar,
                SizedBox(width: avatarSpacing),
                nameAndBrief,
              ],
            ),
    );
  }
}
