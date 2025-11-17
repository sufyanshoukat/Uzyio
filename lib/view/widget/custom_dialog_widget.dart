import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:uzyio/constants/app_colors.dart';

class CustomDialog extends StatelessWidget {
  final Widget child;
  final double? horizontalMargin;
  const CustomDialog({
    super.key,
    required this.child,
    this.horizontalMargin = 32,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            margin:
                MediaQuery.of(Get.context!).size.width < 600
                    ? EdgeInsets.symmetric(horizontal: horizontalMargin!)
                    : EdgeInsets.symmetric(horizontal: 150),
            decoration: BoxDecoration(
              color: kPrimaryColor,
              borderRadius: BorderRadius.circular(24),
            ),
            child: child,
          ),
        ],
      ),
    );
  }
}
