import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:my_portfolio/core/helper/url_launcher.dart';
import 'package:my_portfolio/core/utils/constants.dart';
import 'package:my_portfolio/core/utils/social_links.dart';

class Bio extends StatelessWidget {
  const Bio({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(Constants.myBio, style: TextStyle(fontSize: 16, height: 1.5)),
        const SizedBox(height: 20),
        //---------- Social links
        Row(
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
        SizedBox(height: 50),
      ],
    );
  }
}
