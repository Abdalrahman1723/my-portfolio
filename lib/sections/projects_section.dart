import 'package:flutter/material.dart';
import 'package:my_portfolio/core/gradient_text.dart';
import 'package:my_portfolio/core/utils/app_colors.dart';
import 'package:my_portfolio/data/projects.dart';
import 'package:my_portfolio/widgets/project_card.dart';

class ProjectsSection extends StatelessWidget {
  const ProjectsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(24.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          GradientBackground.gradientText(
            'Projects',
            AppColors.gradientTextColors,
            style: TextStyle(fontSize: 36),
          ),
          const SizedBox(height: 24),
          GridView.count(
            crossAxisCount: projects.length,
            crossAxisSpacing: 12,
            shrinkWrap: true,
            children: [
              ...projects.map((project) => ProjectCard(project: project)),
            ],
          ),
        ],
      ),
    );
  }
}
