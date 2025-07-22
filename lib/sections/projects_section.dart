import 'package:dynamic_height_grid_view/dynamic_height_grid_view.dart';
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
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          GradientBackground.gradientText(
            'Projects',
            AppColors.gradientTextColors,
            style: TextStyle(fontSize: 36),
          ),
          const SizedBox(height: 24),
          LayoutBuilder(
            builder: (context, constraints) {
              int crossAxisCount;
              double width = constraints.maxWidth;
              if (width < 800) {
                crossAxisCount = 1;
              } else if (width < 1100) {
                crossAxisCount = 2;
              } else {
                crossAxisCount = 3;
              }
              return DynamicHeightGridView(
                shrinkWrap: true,
                itemCount: projects.length,
                crossAxisCount: crossAxisCount,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
                builder: (ctx, index) {
                  return ProjectCard(project: projects[index]);
                },
              );
            },
          ),
        ],
      ),
    );
  }
}
