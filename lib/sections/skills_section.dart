import 'package:flutter/widgets.dart';
import 'package:my_portfolio/core/gradient_text.dart';
import 'package:my_portfolio/core/utils/app_colors.dart';
import 'package:my_portfolio/data/skills.dart';

class SkillsSection extends StatelessWidget {
  const SkillsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(8),
      child: Column(
        children: [
          GradientBackground.gradientText(
            "My skills",
            AppColors.gradientTextColors,
            style: TextStyle(fontSize: 36),
          ),
          const SizedBox(height: 12),
          Wrap(
            spacing: 8.0, // horizontal space between children
            runSpacing: 4.0, // vertical space between lines
            direction: Axis.horizontal, // or Axis.vertical
            children: skills,
          ),
        ],
      ),
    );
  }
}
