import 'package:flutter/material.dart';
import '../../../constants/app_strings.dart';
import '../../../themes/responsive_helper.dart';

class StatusChip extends StatelessWidget {
  final int currentPhase;

  const StatusChip({super.key, required this.currentPhase});

  @override
  Widget build(BuildContext context) {
    final bool onChallenge = currentPhase != 0;
    Color bgColor;
    Color borderColor = Color(0xFF80A4FE);
    Color textColor = Color(0xFF80A4FE);
    String label;
    if (onChallenge) {
      label = AppStrings.instance.onChallenge;
      bgColor = Color(0xFF1A3B72);
      borderColor = Color(0xFF80A4FE);
    } else {
      label = AppStrings.instance.funded;
      bgColor = Color(0xFF053321);
      borderColor = Color(0xFF75DFA7);
      textColor = Color(0xFF75DFA7);
    }
    return Container(
      decoration: BoxDecoration(
        color: bgColor,
        shape: BoxShape.rectangle,
        border: Border.all(color: borderColor, width: 1.25),
        borderRadius: BorderRadius.circular(40),
      ),
      padding: EdgeInsets.symmetric(horizontal: 8, vertical: 6),
      child: Text(label,
          style: TextStyle(
            color: textColor,
            fontWeight: FontWeight.w600,
            fontSize: ResponsiveHelper.labelMedium(context),
          )),
    );
  }
}