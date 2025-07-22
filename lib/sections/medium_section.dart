import 'package:flutter/material.dart';
import 'package:my_portfolio/core/gradient_text.dart';
import 'package:my_portfolio/core/helper/url_launcher.dart';
import 'package:my_portfolio/core/responsive/screen_type.dart';
import 'package:my_portfolio/core/utils/app_colors.dart';
import 'package:my_portfolio/core/utils/social_links.dart';

class MediumSection extends StatelessWidget {
  const MediumSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(24.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          GradientBackground.gradientText(
            'Medium Articles',
            AppColors.gradientTextColors,
            style: const TextStyle(fontSize: 36, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 24),

          const SizedBox(height: 24),
          Text(
            'Check out my latest articles on Medium!',
            style: TextStyle(fontSize: 18, color: Colors.white70),
          ),
          const SizedBox(height: 24),
          // Article cards
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Expanded(
                child: _MediumArticleCard(
                  title: '🧼 Clean Architecture in Flutter: A Practical Guide',
                  description:
                      'As Flutter developers, we often face the challenge of keeping our codebase scalable, testable,'
                      ' and easy to maintain. That’s where Clean Architecture comes in — a powerful design pattern that promotes separation of concerns and helps us build robust applications. In this article, we’ll break down what Clean Architecture is, how it applies to Flutter, and walk through the structure with examples.',
                  url:
                      'https://medium.com/@abdalrahman.alaa.eldin/flutter-clean-architecture-09bda8afef29',
                ),
              ),
              const SizedBox(width: 24),
              //--------------------
              ?!ScreenType(context: context).isMobile
                  ? Expanded(
                      child: _MediumArticleCard(
                        title:
                            '🎯 From Complexity to Simplicity: Why I Rebuilt a Tic-Tac-Toe Game After a Complex Flutter Project',
                        description:
                            '🧠 The Transition Phase After completing my graduation project — a fully functional Health Care Management System built with Flutter — '
                            'I felt proud of what I had accomplished. The project involved working with advanced widgets, architectural patterns, third-party libraries, and dynamic UI/UX flows. I poured weeks of effort into it, and it paid off with an A+ grade and a deep learning experience. But once it was done, I stepped away from the screen for a while. Like many developers post-crunch, I took some time to breathe, recharge, and reflect. Then came the question: What should I build next?',
                        url:
                            'https://medium.com/@abdalrahman.alaa.eldin/from-graduation-to-simplicity-why-i-rebuilt-a-tic-tac-toe-game-after-a-complex-flutter-project-a62f6b10e65b',
                      ),
                    )
                  : null,
            ],
          ),
          const SizedBox(height: 16),
          ElevatedButton.icon(
            onPressed: () => launchUrlGlobal(SocialLinks.medium),
            icon: const Icon(Icons.open_in_new),
            label: const Text('View on Medium'),
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.deepPurpleAccent,
              foregroundColor: Colors.white,
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
              textStyle: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _MediumArticleCard extends StatelessWidget {
  final String title;
  final String description;
  final String url;

  const _MediumArticleCard({
    required this.title,
    required this.description,
    required this.url,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              maxLines: 3,
              overflow: TextOverflow.ellipsis,
            ),
            const SizedBox(height: 12),
            Text(
              "$description ... ",
              style: const TextStyle(fontSize: 16, color: Colors.white70),
              maxLines: 10,
              overflow: TextOverflow.ellipsis,
            ),
            const SizedBox(height: 20),
            Align(
              alignment: Alignment.bottomRight,
              child: TextButton.icon(
                onPressed: () => launchUrlGlobal(url),
                icon: const Icon(Icons.open_in_new),
                label: const Text('Read Article'),
                style: TextButton.styleFrom(
                  foregroundColor: Colors.deepPurpleAccent,
                  textStyle: const TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
