import 'package:flutter/material.dart';
import 'package:my_portfolio/core/utils/app_colors.dart';

class NavButtons extends StatelessWidget {
  final String title;
  final Function navigate;
  const NavButtons({super.key, required this.title, required this.navigate});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      splashColor: Colors.deepPurpleAccent.shade100,
      borderRadius: BorderRadius.circular(16),
      hoverColor: AppColors.hoverColor,
      onTap: () => navigate,
      child: Text(title),
    );
  }
}
