import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:lucas_demo_project/themes/responsive_helper.dart';

import '../../../constants/app_strings.dart';
import '../../../themes/app_theme.dart';

class StepperBar extends StatelessWidget {
  final int currentPhase;
  const StepperBar({super.key, required this.currentPhase});

  @override
  Widget build(BuildContext context) {
    final steps = [
      {"label": AppStrings.instance.evaluation1, "icon": "assets/ic_bar_chart.svg", "locked": false},
      {"label": AppStrings.instance.evaluation2, "icon": "assets/ic_bar_chart.svg", "locked": false},
      {"label": AppStrings.instance.masterAccount, "icon": "assets/lock_open_rounded.svg", "locked": true},
    ];

    return Container(
      decoration: BoxDecoration(
        color: Color.fromRGBO(255, 255, 255, 0.05),
      ),
      width: double.infinity,
      padding: EdgeInsets.symmetric(horizontal: 0, vertical: 8),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: List.generate(steps.length * 2 + 1, (index) {
          if (index.isEven || index == 0) {
            return _DottedLine(index: index);
          }
          final stepIndex = index ~/ 2;
          final step = steps[stepIndex];
          final isActive = stepIndex + 1 <= currentPhase;
          return StepPill(
            label: step["label"] as String,
            icon: step["icon"] as String,
            isActive: isActive,
          );
        }),
      ),
    );
  }
}

class StepPill extends StatelessWidget {
  final String label;
  final String icon;
  final bool isActive;

  const StepPill({
    required this.label,
    required this.icon,
    required this.isActive,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 5),
      alignment: Alignment.center,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            isActive ? Color.fromRGBO(88, 101, 242, 1) : Color.fromRGBO(255, 255, 255, 0.1),
            isActive ? Color.fromRGBO(88, 101, 242, 0.4) : Color.fromRGBO(255, 255, 255, 0.1), // faded blue
          ],
          stops: [0.0, 1.0], // full smooth fade
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
        ),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
          color: Color.fromRGBO(255, 255, 255, 0.1),
          width: 0.75,
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SvgPicture.asset(icon, color: Colors.white),
          const SizedBox(width: 4),
          Text(
            label,
            style: Theme.of(context).textTheme.labelSmall!.copyWith(
                  color: Colors.white,
                  // fontSize: getResponsiveLabelSmallSize(context),
                ),
          ),
        ],
      ),
    );
  }
}

class _DottedLine extends StatelessWidget {
  final int index;
  final List<Color> gradientColors;

  const _DottedLine({
    required this.index,
    this.gradientColors = const [Colors.blue, Colors.purple],
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: (index == 0 || index == 6) ? 20 : 60,
      height: 0.4,
      margin: EdgeInsets.symmetric(horizontal: 1),
      child: CustomPaint(
        painter: _DottedLinePainter(gradientColors: gradientColors),
      ),
    );
  }
}

class _DottedLinePainter extends CustomPainter {
  final List<Color> gradientColors;

  _DottedLinePainter({required this.gradientColors});

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..shader = LinearGradient(
        colors: gradientColors,
        end: Alignment.centerLeft,
        begin: Alignment.centerRight,
      ).createShader(Rect.fromLTWH(0, 0, size.width, size.height))
      ..strokeWidth = size.height;

    const dashWidth = 3.5;
    const dashSpace = 1.25;
    double startX = 0;
    while (startX < size.width) {
      canvas.drawLine(Offset(startX, 0), Offset(startX + dashWidth, 0), paint);
      startX += dashWidth + dashSpace;
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
