import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:my_portfolio/core/helper/url_launcher.dart';
import 'package:my_portfolio/core/responsive/screen_type.dart';
import 'package:my_portfolio/core/utils/nav_buttons.dart';
import 'package:my_portfolio/core/utils/social_links.dart';
import 'package:my_portfolio/sections/about_me_section.dart';
import 'package:my_portfolio/sections/contact_me_section.dart';
import 'package:my_portfolio/sections/footer.dart';
import 'package:my_portfolio/sections/intro_section.dart';
import 'package:my_portfolio/sections/projects_section.dart';
import 'package:my_portfolio/sections/medium_section.dart';
import 'package:my_portfolio/widgets/custom_divider.dart';
import 'package:url_launcher/url_launcher.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  void _launchURL(String url) async {
    final uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri);
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final double tabletSize = screenWidth * .035;
    return Scaffold(
      appBar: !ScreenType(context: context).isLargerThanMobile
          ? null
          : AppBar(
              flexibleSpace: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  gradient: LinearGradient(
                    colors: [
                      const Color.fromARGB(255, 83, 56, 200),
                      Colors.blueAccent,
                      const Color.fromARGB(255, 37, 22, 63),
                    ],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                ),
              ),
              //contact me on whatsApp icon button
              actions: [
                InkWell(
                  onTap: () => _launchURL(SocialLinks.whatsApp),
                  child: Container(
                    padding: EdgeInsets.only(
                      left: 12,
                      right: 10,
                      top: 6,
                      bottom: 6,
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(28),
                        bottomLeft: Radius.circular(28),
                      ),
                      gradient: LinearGradient(
                        colors: [Colors.green, Colors.lightGreen],
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                      ),
                    ),
                    child: Row(
                      children: [
                        MouseRegion(
                          cursor: SystemMouseCursors.click,
                          child: FaIcon(FontAwesomeIcons.whatsapp),
                        ),
                        SizedBox(width: 6),
                        Text("WhatsApp"),
                      ],
                    ),
                  ),
                ),
              ],
              title: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // SizedBox(width: 150),
                  NavButtons(title: "Home", navigate: () {}),
                  SizedBox(
                    width: ScreenType(context: context).isTablet
                        ? tabletSize
                        : 100,
                  ),
                  Text("|"),
                  SizedBox(
                    width: ScreenType(context: context).isTablet
                        ? tabletSize
                        : 100,
                  ),
                  NavButtons(title: "Projects", navigate: () {}),
                  SizedBox(
                    width: ScreenType(context: context).isTablet
                        ? tabletSize
                        : 100,
                  ),
                  Text("|"),
                  SizedBox(
                    width: ScreenType(context: context).isTablet
                        ? tabletSize
                        : 100,
                  ),
                  NavButtons(title: "Contact", navigate: () {}),
                ],
              ),
            ),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(16),
                child: Center(
                  child: Column(
                    children: [
                      SizedBox(height: 30),
                      //short brief intro
                      IntroSection(),
                      SizedBox(height: 30),

                      Divider(thickness: 4, color: Colors.white70, indent: 15),
                      SizedBox(height: 30),
                      AboutMeSection(),

                      SizedBox(height: 40),
                      CustomDivider(),
                      SizedBox(height: 30),
                      ProjectsSection(),
                      Divider(thickness: 4, color: Colors.white70, indent: 15),

                      SizedBox(height: 30),
                      MediumSection(),

                      SizedBox(height: 30),
                      Divider(thickness: 4, color: Colors.white70, indent: 15),
                      SizedBox(height: 30),
                      ContactSection(),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 30),
              Footer(),
            ],
          ),
        ),
      ),
      floatingActionButton: ScreenType(context: context).isMobile
          ? FloatingActionButton(
              tooltip: "contact on WhatsApp",
              onPressed: () => launchUrlGlobal(SocialLinks.whatsApp),
              backgroundColor: Colors.green,
              child: Icon(FontAwesomeIcons.whatsapp),
            )
          : null,
    );
  }
}
