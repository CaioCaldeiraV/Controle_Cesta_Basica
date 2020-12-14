import 'package:flutter/material.dart';

class LinearGradientMask extends StatelessWidget {
  LinearGradientMask({this.child});
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return ShaderMask(
      shaderCallback: (bounds) {
        return RadialGradient(
          center: Alignment.centerLeft,
          radius: 1.3,
          colors: [
            Theme.of(context).primaryColor,
            Colors.green,
          ],
          tileMode: TileMode.mirror,
        ).createShader(bounds);
      },
      child: child,
    );
  }
}
