import 'package:flutter/material.dart';
import 'package:uzyio/constants/app_colors.dart';
import 'package:uzyio/view/widget/common_image_view_widget.dart';
import 'package:uzyio/view/widget/my_text_widget.dart';

// ignore: must_be_immutable
class MyButton extends StatelessWidget {
  MyButton({
    this.onTap,
    required this.buttonText,
    this.height = 65,
    this.backgroundColor = kSecondaryColor,
    this.fontColor = kPrimaryColor,
    this.fontSize = 18,
    this.outlineColor = kTransperentColor,
    this.radius = 100,
    this.svgIcon,
    this.svgIconColor,
    this.haveIcon = false,
    this.mBottom = 0,
    this.mTop = 0,
    this.iconSize,
    this.fontWeight = FontWeight.w700,
    this.isGradientBackground = true,
  });

  final String buttonText;
  final VoidCallback? onTap;
  final double? height;
  final double radius;
  final double fontSize;
  final Color outlineColor;
  final Color backgroundColor, fontColor;
  final Color? svgIconColor;
  final String? svgIcon;
  final bool haveIcon;
  final double? iconSize;
  final double mTop, mBottom;
  final FontWeight fontWeight;
  final bool isGradientBackground;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: mTop, bottom: mBottom),
      height: height,
      decoration:
          isGradientBackground
              ? BoxDecoration(
                color: backgroundColor,
                border: Border.all(color: outlineColor),
                gradient: LinearGradient(
                  colors: [kTertiaryColor, kSecondaryColor],
                ),
                borderRadius: BorderRadius.circular(radius),
              )
              : BoxDecoration(
                color: backgroundColor,
                border: Border.all(color: outlineColor),
                borderRadius: BorderRadius.circular(radius),
              ),
      child: Material(
        color: kTransperentColor,
        child: InkWell(
          onTap: onTap,
          splashColor: kPrimaryColor.withOpacity(0.1),
          highlightColor: kTertiaryColor.withOpacity(0.1),
          borderRadius: BorderRadius.circular(10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              (haveIcon == true)
                  ? CommonImageView(
                    svgPath: svgIcon,
                    //svgIconColor: svgIconColor,
                    // height: iconSize,
                    width: iconSize,
                  )
                  : SizedBox(),
              MyText(
                paddingLeft: (haveIcon == true) ? 10 : 0,
                text: buttonText,
                size: fontSize,
                color: fontColor,
                weight: fontWeight,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class MyOutlineButton extends StatelessWidget {
  MyOutlineButton({
    required this.onTap,
    required this.buttonText,
    this.height = 48,
    this.backgroundColor = kTransperentColor,
    this.fontColor = kPrimaryColor,
    this.fontSize = 16,
    this.outlineColor = kPrimaryColor,
    this.radius = 100,
    this.svgIcon,
    this.svgIconColor,
    this.haveIcon = false,
    this.mBottom = 0,
    this.mTop = 0,
    this.iconSize,
    this.fontWeight = FontWeight.w700,
  });

  final String buttonText;
  final VoidCallback onTap;
  final double? height;
  final double radius;
  final double fontSize;
  final Color outlineColor;
  final Color backgroundColor, fontColor;
  final Color? svgIconColor;
  final String? svgIcon;
  final bool haveIcon;
  final double? iconSize;
  final double mTop, mBottom;
  final FontWeight fontWeight;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: mTop, bottom: mBottom),
      height: height,
      decoration: BoxDecoration(
        color: backgroundColor,
        border: Border.all(color: outlineColor),
        // boxShadow: [
        //   BoxShadow(
        //     offset: Offset(0, 4),
        //     color: kPrimaryColor.withOpacity(0.25),
        //     blurRadius: 15,
        //     spreadRadius: 0,
        //   ),
        // ],
        // gradient: LinearGradient(colors: [kTertiaryColor, kSecondaryColor]),
        borderRadius: BorderRadius.circular(radius),
      ),
      child: Material(
        color: kTransperentColor,
        child: InkWell(
          onTap: onTap,
          splashColor: kPrimaryColor.withOpacity(0.1),
          highlightColor: kTertiaryColor.withOpacity(0.1),
          borderRadius: BorderRadius.circular(10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              (haveIcon == true)
                  ? CommonImageView(
                    svgPath: svgIcon,
                    //svgIconColor: svgIconColor,
                    // height: iconSize,
                    width: iconSize,
                  )
                  : SizedBox(),
              MyText(
                paddingLeft: (haveIcon == true) ? 10 : 0,
                text: buttonText,
                size: fontSize,
                color: fontColor,
                weight: fontWeight,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
