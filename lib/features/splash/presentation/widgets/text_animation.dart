import 'package:flutter/material.dart';

import '../../../../generated/l10n.dart';

class TextAnimation extends StatelessWidget {
  const TextAnimation({
    super.key,
    required this.slidingAntimation,
  });

  final Animation<Offset> slidingAntimation;

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
        animation: slidingAntimation,
        builder: (BuildContext context , _) {
          return SlideTransition(
            position: slidingAntimation,
            child: Text(
              S.of(context).welcome,
              textAlign: TextAlign.center,
              style: const TextStyle(fontSize: 20.0),
            ),
          );
        }
    );
  }
}