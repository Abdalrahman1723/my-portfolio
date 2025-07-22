import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:my_portfolio/core/gradient_text.dart';
import 'package:my_portfolio/core/utils/app_colors.dart';

class LoadingScreen extends StatelessWidget {
  const LoadingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black87,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('assets/dev.png', width: 100, height: 100),
            SizedBox(height: 16),
            LoadingAnimationWidget.staggeredDotsWave(
              color: Colors.white,
              size: 200,
            ),
            SizedBox(height: 12),
            GradientBackground.gradientText(
              'Loading awesome things...',
              AppColors.gradientTextColors,
              style: TextStyle(fontSize: 26),
            ),
          ],
        ),
      ),
    );
  }
}
