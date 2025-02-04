import 'package:flutter/material.dart';

import '../../../../util/color.dart';

class OnBoardingDotIndicator extends StatelessWidget {
  final bool isActive;

  const OnBoardingDotIndicator({required this.isActive});

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: Duration(milliseconds: 300),
      margin: EdgeInsets.symmetric(horizontal: 5),
      height: 10,
      width: isActive ? 20 : 10,
      decoration: BoxDecoration(
        color: isActive? ScreenColor.color6: Colors.grey,
        borderRadius: BorderRadius.circular(5),
      ),
    );
  }
}