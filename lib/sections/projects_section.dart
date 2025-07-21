import 'package:flutter/material.dart';
import 'package:my_portfolio/widgets/project_card.dart';

import '../models/project.dart';

class ProjectsSection extends StatelessWidget {
  ProjectsSection({super.key});

  final List<Project> projects = [
    Project(
      title: 'Portfolio Website',
      description:
          'A personal portfolio website built with Flutter to showcase my projects and skills.',
      technologies: ['Flutter', 'Dart', 'Web'],
      githubUrl: 'https://github.com/yourusername/portfolio',
      liveDemoUrl: 'https://yourportfolio.com',
    ),
    Project(
      title: 'Weather App',
      description:
          'A cross-platform weather app with real-time data and beautiful UI.',
      technologies: ['Flutter', 'REST API'],
      githubUrl: 'https://github.com/yourusername/weather-app',
    ),
    // Add more projects here
  ];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(24.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Projects', style: Theme.of(context).textTheme.headlineMedium),
          const SizedBox(height: 24),
          ...projects.map((project) => ProjectCard(project: project)),
        ],
      ),
    );
  }
}
