import 'package:flutter/material.dart';

import '../models/project.dart';

class ProjectCard extends StatelessWidget {
  final Project project;
  const ProjectCard({super.key, required this.project});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 12),
      elevation: 4,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(project.title, style: Theme.of(context).textTheme.titleLarge),
            const SizedBox(height: 8),
            Text(project.description),
            const SizedBox(height: 8),
            Wrap(
              spacing: 8,
              children: project.technologies
                  .map((tech) => Chip(label: Text(tech)))
                  .toList(),
            ),
            const SizedBox(height: 8),
            Row(
              children: [
                if (project.githubUrl != null)
                  TextButton(
                    onPressed: () {
                      _launchUrl(context, project.githubUrl!);
                    },
                    child: const Text('GitHub'),
                  ),
                if (project.liveDemoUrl != null)
                  TextButton(
                    onPressed: () {
                      _launchUrl(context, project.liveDemoUrl!);
                    },
                    child: const Text('Live Demo'),
                  ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  void _launchUrl(BuildContext context, String url) async {
    // You can use url_launcher package for actual implementation
    ScaffoldMessenger.of(
      context,
    ).showSnackBar(SnackBar(content: Text('Open: $url')));
  }
}
