import 'package:dynamic_height_grid_view/dynamic_height_grid_view.dart';
import 'package:flutter/material.dart';
import 'package:my_portfolio/core/gradient_text.dart';
import 'package:my_portfolio/core/utils/app_colors.dart';
import 'package:my_portfolio/data/projects.dart';
import 'package:my_portfolio/widgets/project_card.dart';
import 'package:my_portfolio/core/responsive/screen_type.dart';

class _AnimatedScrollArrow extends StatefulWidget {
  @override
  _AnimatedScrollArrowState createState() => _AnimatedScrollArrowState();
}

class _AnimatedScrollArrowState extends State<_AnimatedScrollArrow> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1000),
    )..repeat(reverse: true);
    _animation = Tween<double>(begin: 0, end: 16).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeInOut),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _animation,
      builder: (context, child) {
        return Padding(
          padding: EdgeInsets.only(left: _animation.value),
          child: Row(
            children: const [
              Icon(Icons.arrow_forward_ios, size: 24, color: Colors.grey),
              SizedBox(width: 4),
              Text('Scroll', style: TextStyle(color: Colors.grey, fontSize: 14)),
            ],
          ),
        );
      },
    );
  }
}

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
              final screenType = ScreenType(context: context);
              int crossAxisCount;
              double width = constraints.maxWidth;
              if (width < 800) {
                crossAxisCount = 1;
              } else if (width < 1100) {
                crossAxisCount = 2;
              } else {
                crossAxisCount = 3;
              }
              if (screenType.isMobile) {
                // On mobile, show an animated arrow to indicate horizontal scroll
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _AnimatedScrollArrow(),
                    const SizedBox(height: 8),
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: projects
                            .map(
                              (project) => Padding(
                                padding: const EdgeInsets.only(right: 10.0),
                                child: ProjectCard(project: project),
                              ),
                            )
                            .toList(),
                      ),
                    ),
                  ],
                );
              } else {
                // On larger screens, use grid
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
              }
            },
          ),
        ],
      ),
    );
  }
}
