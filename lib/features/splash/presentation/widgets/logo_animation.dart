import 'package:flutter/material.dart';

import '../../../../core/utils/assets.dart';

class LogoAnimation extends StatelessWidget {
  const LogoAnimation({
    super.key,
    required this.logoAnimation,
  });

  final Animation<Offset> logoAnimation;

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
        animation: logoAnimation,
        builder: (context,_) {
          return SlideTransition(
              position: logoAnimation,
              child: Image.asset(AssetsData.logo));
        }
    );
  }
}
