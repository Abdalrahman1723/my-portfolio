import 'package:flutter/material.dart';
import 'package:my_portfolio/core/gradient_text.dart';
import 'package:my_portfolio/core/utils/avatar.dart';

class IntroSection extends StatelessWidget {
  const IntroSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20),
      decoration: BoxDecoration(),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          //----------the avatar
          CustomCircularAvatar(imageUrl: "assets/me.jpg", radius: 150),
          SizedBox(width: 20),

          //----------the name and brief
          Column(
            children: [
              //---Hello!
              GradientBackground.gradientText("Hello, World! I'm", [
                Colors.deepPurpleAccent,
                Colors.blueAccent,
              ], style: TextStyle(fontSize: 50)),
              //---My name is
              Text(
                "Abdalrahman",
                style: TextStyle(fontSize: 70, fontWeight: FontWeight.bold),
              ),
              //---My catch phrase
              Text(
                "Developer by day, debugger by night,\n Googler 24/7.",
                style: TextStyle(fontSize: 28, color: Colors.blueGrey),
                overflow: TextOverflow.clip,
                textAlign: TextAlign.start,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
