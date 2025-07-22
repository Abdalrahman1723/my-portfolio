import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:my_portfolio/core/helper/url_launcher.dart';
import 'package:my_portfolio/core/utils/social_links.dart';
import 'package:url_launcher/url_launcher.dart';

class Footer extends StatelessWidget {
  const Footer({super.key});

  void _launch(String url) async {
    final uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri);
    }
  }

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Container(
      padding: const EdgeInsets.symmetric(vertical: 32, horizontal: 16),
      color: isDark ? Colors.grey[900] : Colors.grey[200],
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Text(
            'Thank you for scrolling this far 🧡',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
          ),
          const SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              //-------github
              IconButton(
                icon: const FaIcon(FontAwesomeIcons.github),
                tooltip: 'GitHub',
                onPressed: () => launchUrlGlobal(SocialLinks.github),
              ),
              //-------Linkedin
              IconButton(
                icon: const FaIcon(FontAwesomeIcons.linkedin),
                tooltip: 'LinkedIn',
                onPressed: () => launchUrlGlobal(SocialLinks.linkedin),
              ),
              //-------Facebook
              IconButton(
                icon: const FaIcon(FontAwesomeIcons.facebook),
                tooltip: 'Facebook',
                onPressed: () => launchUrlGlobal(SocialLinks.facebook),
              ),
              //-------Email
              IconButton(
                icon: const FaIcon(FontAwesomeIcons.envelope),
                tooltip: 'Email me',
                onPressed: () => launchUrlGlobal(SocialLinks.email),
              ),
              //-------WhatsApp
              IconButton(
                icon: const FaIcon(FontAwesomeIcons.whatsapp),
                tooltip: 'WhatsApp',
                onPressed: () => launchUrlGlobal(SocialLinks.whatsApp),
              ),
            ],
          ),
          const SizedBox(height: 16),
          Text(
            '© ${DateTime.now().year} Abdalrahman Alaa Eldin. All rights reserved.',
            style: TextStyle(
              fontSize: 14,
              color: isDark ? Colors.grey[400] : Colors.grey[700],
            ),
          ),
        ],
      ),
    );
  }
}
