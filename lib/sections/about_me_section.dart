import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:my_portfolio/core/gradient_text.dart';
import 'package:my_portfolio/core/utils/avatar.dart';
import 'package:my_portfolio/core/utils/social_links.dart';
import 'package:my_portfolio/widgets/neon_card.dart';
import 'package:url_launcher/url_launcher.dart';

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
              // Avatar
              CustomCircularAvatar(imageUrl: 'assets/me2.jpg', radius: 80),
              const SizedBox(width: 32),
              // Info
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    //---------my name
                    const Text(
                      'Abdalrahman Alaa Eldin Salah',
                      style: TextStyle(
                        fontSize: 36,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 8),
                    //---------my title
                    const Text(
                      'Flutter Developer | Mobile & Web Enthusiast',
                      style: TextStyle(
                        fontSize: 22,
                        color: Colors.blueGrey,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    const SizedBox(height: 16),
                    const Text(
                      'I am a passionate Flutter developer with a knack for building beautiful, performant, and scalable apps. I love turning ideas into reality using code, and I am always eager to learn new technologies and improve my skills.\n\nMy expertise includes cross-platform mobile and web development, UI/UX design, and integrating APIs. When I am not coding, you can find me exploring new tech, reading, or enjoying a good cup of coffee.',
                      style: TextStyle(fontSize: 16, height: 1.5),
                    ),
                    const SizedBox(height: 20),
                    //---------- Social links
                    Row(
                      children: [
                        //-------github
                        IconButton(
                          icon: const FaIcon(FontAwesomeIcons.github),
                          tooltip: 'GitHub',
                          onPressed: () => _launchURL(SocialLinks.github),
                        ),
                        //-------Linkedin
                        IconButton(
                          icon: const FaIcon(FontAwesomeIcons.linkedin),
                          tooltip: 'LinkedIn',
                          onPressed: () => _launchURL(SocialLinks.linkedin),
                        ),
                        //-------Facebook
                        IconButton(
                          icon: const FaIcon(FontAwesomeIcons.facebook),
                          tooltip: 'Facebook',
                          onPressed: () => _launchURL(SocialLinks.facebook),
                        ),
                        //-------Email
                        IconButton(
                          icon: const FaIcon(FontAwesomeIcons.envelope),
                          tooltip: 'Email',
                          onPressed: () => _launchURL(SocialLinks.email),
                        ),
                      ],
                    ),
                    SizedBox(height: 50),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  void _launchURL(String url) async {
    final uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri);
    } else {
      throw 'Could not launch $url';
    }
  }
}
