import 'package:flutter/material.dart';
import 'package:my_portfolio/widgets/neon_card.dart';

class CustomDivider extends StatelessWidget {
  const CustomDivider({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Divider(color: Colors.white, thickness: 3, endIndent: 12),
        ),
        NeonGradientCardDemo(),
        Expanded(child: Divider(color: Colors.white, thickness: 3, indent: 12)),
      ],
    );
  }
}
