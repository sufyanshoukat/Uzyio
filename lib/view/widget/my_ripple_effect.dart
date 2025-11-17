// ignore: must_be_immutable
import 'package:flutter/material.dart';
import 'package:uzyio/constants/app_colors.dart';

class MyRippleEffect extends StatelessWidget {
  final Widget child;
  final VoidCallback onTap;
  Color? splashColor;
  double? radius;
  MyRippleEffect({
    super.key,
    required this.child,
    required this.onTap,
    this.splashColor,
    this.radius = 12,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onTap,
        splashColor: splashColor ?? kSecondaryColor.withOpacity(0.05),
        highlightColor: splashColor ?? kSecondaryColor.withOpacity(0.05),
        borderRadius: BorderRadius.circular(radius!),
        child: child,
      ),
    );
  }
}
