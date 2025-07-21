import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:my_portfolio/core/utils/nav_buttons.dart';
import 'package:my_portfolio/sections/intro_section.dart';
import 'package:url_launcher/url_launcher.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  //launch URLs
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
    return Scaffold(
      appBar: AppBar(
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
            onTap: () => _launchURL("https://wa.me/qr/KWV6YJ7TFZOTH1"),
            child: Container(
              padding: EdgeInsets.only(left: 12, right: 10, top: 6, bottom: 6),
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
            SizedBox(width: 100),
            Text("|"),
            SizedBox(width: 100),
            NavButtons(title: "Projects", navigate: () {}),
            SizedBox(width: 100),
            Text("|"),
            SizedBox(width: 100),
            NavButtons(title: "Contact", navigate: () {}),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(32),
            child: Center(
              child: Column(
                children: [
                  SizedBox(height: 30),
                  //short brief intro
                  IntroSection(),
                  SizedBox(height: 30),
                  Divider(thickness: 4, color: Colors.white70, indent: 15),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
