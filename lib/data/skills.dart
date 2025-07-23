import 'package:flutter/widgets.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:my_portfolio/widgets/neumorphic_progress_bar.dart';

final List<NeumorphicProgressBar> skills = [
  //---flutter
  NeumorphicProgressBar(progress: 0.85, logo: Icon(FontAwesomeIcons.flutter)),
  //---dart
  NeumorphicProgressBar(progress: 0.9, logo: Icon(FontAwesomeIcons.dartLang)),

  //---android
  NeumorphicProgressBar(progress: 0.75, logo: Icon(FontAwesomeIcons.android)),

  //---git
  NeumorphicProgressBar(progress: 0.8, logo: Icon(FontAwesomeIcons.git)),

  //---github
  NeumorphicProgressBar(progress: 0.8, logo: Icon(FontAwesomeIcons.github)),

  //---docker
  NeumorphicProgressBar(progress: 0.8, logo: Icon(FontAwesomeIcons.docker)),

  //---python
  NeumorphicProgressBar(progress: 0.8, logo: Icon(FontAwesomeIcons.python)),

  //---database
  NeumorphicProgressBar(progress: 0.7, logo: Icon(FontAwesomeIcons.database)),

  //---java
  NeumorphicProgressBar(progress: 0.75, logo: Icon(FontAwesomeIcons.java)),

  //---HTML
  NeumorphicProgressBar(progress: 0.8, logo: Icon(FontAwesomeIcons.html5)),
];
