import 'package:flutter/material.dart';
import 'package:my_portfolio/core/gradient_text.dart';
import 'package:my_portfolio/core/responsive/screen_type.dart';
import 'package:my_portfolio/core/utils/avatar.dart';
import 'package:my_portfolio/core/utils/constants.dart';
import 'package:my_portfolio/widgets/bio.dart';

class AboutMeSection extends StatelessWidget {
  const AboutMeSection({super.key});
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.05),
        borderRadius: BorderRadius.circular(24),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.08),
            blurRadius: 12,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          //------header
          GradientBackground.gradientText(
            'About Me',
            [Colors.deepPurpleAccent, Colors.blueAccent],
            style: const TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 24),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // ---------Avatar
              CustomCircularAvatar(
                imageUrl: 'assets/me2.jpg',
                radius: ScreenType(context: context).isMobile ? 50 : 80,
              ),
              const SizedBox(width: 32),
              //-------------- Info
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    //---------my name
                    Text(
                      Constants.myName,
                      style: TextStyle(
                        fontSize: ScreenType(context: context).isMobile
                            ? 22
                            : 36,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 8),
                    //---------my title
                    Text(
                      Constants.myTitle,
                      style: TextStyle(
                        fontSize: ScreenType(context: context).isMobile
                            ? 18
                            : 22,
                        color: Colors.blueGrey,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    const SizedBox(height: 16),
                    //show the bio and social links
                    ?!ScreenType(context: context).isMobile ? Bio() : null,
                    //----------Bio
                  ],
                ),
              ),
            ],
          ),
          //show the bio and social links
          ?ScreenType(context: context).isMobile ? Bio() : null,
        ],
      ),
    );
  }
}
