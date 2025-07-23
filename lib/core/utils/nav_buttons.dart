import 'package:flutter/material.dart';
import 'package:my_portfolio/core/responsive/screen_type.dart';
import 'package:my_portfolio/core/utils/app_colors.dart';

class NavButtons extends StatelessWidget {
  final String title;
  final void Function() navigate;
  const NavButtons({super.key, required this.title, required this.navigate});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final double fontSize = screenWidth * .025;
    return InkWell(
      borderRadius: BorderRadius.circular(16),
      hoverColor: AppColors.hoverColor,
      onTap: navigate,
      child: Text(
        title,
        style: TextStyle(
          fontSize: ScreenType(context: context).isTablet ? fontSize : 26,
        ),
      ),
    );
  }
}
