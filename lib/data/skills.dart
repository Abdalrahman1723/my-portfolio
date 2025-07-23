import 'package:flutter/widgets.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:my_portfolio/widgets/neumorphic_progress_bar.dart';

const double topSpace = 8;
const double bottomSpace = topSpace;
final List<Widget> skills = const [
  // Flutter skill 
  Column(
    children: [
      Text('Flutter'),
      SizedBox(height: topSpace),
      NeumorphicProgressBar(
        progress: 0.80,
        logo: Icon(FontAwesomeIcons.flutter),
      ),
      SizedBox(height: bottomSpace),
    ],
  ),
  // Dart skill
  Column(
    children: [
      Text('Dart'),
      SizedBox(height: topSpace),
      NeumorphicProgressBar(
        progress: 0.9,
        logo: Icon(FontAwesomeIcons.dartLang),
      ),
      SizedBox(height: bottomSpace),
    ],
  ),
  //---firebase skill
  Column(
    children: [
      Text('Firebase'),
      SizedBox(height: topSpace),
      NeumorphicProgressBar(progress: 0.8, logo: Icon(FontAwesomeIcons.fire)),
      SizedBox(height: bottomSpace),
    ],
  ),
  // Android skill
  Column(
    children: [
      Text('Android'),
      SizedBox(height: topSpace),
      NeumorphicProgressBar(
        progress: 0.75,
        logo: Icon(FontAwesomeIcons.android),
      ),
      SizedBox(height: bottomSpace),
    ],
  ),
  // Git skill
  Column(
    children: [
      Text('Git'),
      SizedBox(height: topSpace),
      NeumorphicProgressBar(progress: 0.65, logo: Icon(FontAwesomeIcons.git)),
      SizedBox(height: bottomSpace),
    ],
  ),
  // GitHub skill
  Column(
    children: [
      Text('GitHub'),
      SizedBox(height: topSpace),
      NeumorphicProgressBar(
        progress: 0.72,
        logo: Icon(FontAwesomeIcons.github),
      ),
      SizedBox(height: bottomSpace),
    ],
  ),
  // Docker skill
  Column(
    children: [
      Text('Docker'),
      SizedBox(height: topSpace),
      NeumorphicProgressBar(progress: 0.6, logo: Icon(FontAwesomeIcons.docker)),
      SizedBox(height: bottomSpace),
    ],
  ),
  // Python skill
  Column(
    children: [
      Text('Python'),
      SizedBox(height: topSpace),
      NeumorphicProgressBar(progress: 0.7, logo: Icon(FontAwesomeIcons.python)),
      SizedBox(height: bottomSpace),
    ],
  ),
  // Database skill
  Column(
    children: [
      Text('Database'),
      SizedBox(height: topSpace),
      NeumorphicProgressBar(
        progress: 0.7,
        logo: Icon(FontAwesomeIcons.database),
      ),
      SizedBox(height: bottomSpace),
    ],
  ),
  // Java skill
  Column(
    children: [
      Text('Java'),
      SizedBox(height: topSpace),
      NeumorphicProgressBar(progress: 0.75, logo: Icon(FontAwesomeIcons.java)),
      SizedBox(height: bottomSpace),
    ],
  ),
  // HTML skill
  Column(
    children: [
      Text('HTML'),
      SizedBox(height: topSpace),
      NeumorphicProgressBar(progress: 0.8, logo: Icon(FontAwesomeIcons.html5)),
      SizedBox(height: bottomSpace),
    ],
  ),
  //?---
  // Column(
  //   children: [
  //     Text(''),
  //     const SizedBox(height: topSpace),
  //     NeumorphicProgressBar(
  //       progress: 0.0,
  //       logo: Icon(FontAwesomeIcons.computer),
  //     ),
  // SizedBox(height: bottomSpace),
  //   ],
  // ),
];
