import 'package:flutter/material.dart';
import 'package:my_portfolio/widgets/glass_hover.dart';

import '../models/project.dart';

class ProjectCard extends StatelessWidget {
  final Project project;
  const ProjectCard({super.key, required this.project});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ConstrainedBox(
        constraints: BoxConstraints(maxWidth: 600), // Adjust maxWidth as needed
        child: Card(
        
          margin: const EdgeInsets.symmetric(vertical: 12),
          elevation: 4,
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  project.title,
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                const SizedBox(height: 8),
                GlassHover(project: project),
                const SizedBox(height: 8),
                Wrap(
                  alignment: WrapAlignment.spaceEvenly,
                  spacing: 8,
                  clipBehavior: Clip.antiAlias,
                  children: project.technologies!
                      .map((tech) => Chip(label: Text(tech)))
                      .toList(),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
