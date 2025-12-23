import 'package:flutter/material.dart';
import 'package:uzyio/constants/app_colors.dart';
import 'package:uzyio/constants/app_images.dart';

class AppStyling {
  BoxDecoration myDecoration({
    Color color = kQuaternaryColor,
    double radius = 10,
    Color borderColor = kQuaternaryColor,
    double thickness = 1,
  }) {
    return BoxDecoration(
      color: color,
      borderRadius: BorderRadius.circular(radius),
      border: Border.all(color: borderColor, width: thickness),
    );
  }

  BoxDecoration allFourSideRaius({
    Color color = kPrimaryColor,
    double topLeft = 20,
    double topRight = 20,
    double bottomLeft = 0,
    double bottomRight = 0,
    Color borderColor = kTransperentColor,
    double thickness = 1,
  }) {
    return BoxDecoration(
      color: color,
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(topLeft),
        topRight: Radius.circular(topRight),
        bottomLeft: Radius.circular(bottomLeft),
        bottomRight: Radius.circular(bottomRight),
      ),
      border: Border.all(color: borderColor, width: thickness),
    );
  }

  BoxDecoration myShadowDecoration({
    Color color = kSecondaryColor,
    Color shadowColor = kBlackColor,
    double borderRadius = 10,
    double spreadRadius = 10,
    double blurRadius = 5,
    Color borderColor = kTransperentColor,
  }) {
    return BoxDecoration(
      color: color,
      borderRadius: BorderRadius.circular(borderRadius),
      border: Border.all(color: borderColor),
      boxShadow: [
        BoxShadow(
          color: shadowColor,
          spreadRadius: spreadRadius,
          blurRadius: blurRadius,
          offset: Offset(0, 4),
        ),
      ],
    );
  }

  BoxDecoration bottomSheetStyle({
    Color color = kSecondaryColor,
    double topRadius = 30,
    bool isTopBorder = true,
  }) {
    return BoxDecoration(
      color: color,
      borderRadius: BorderRadius.vertical(top: Radius.circular(topRadius)),
      // border: Border(top: BorderSide(color: kWhiteColor, width: 1)),
    );
  }

  BoxDecoration background({required String image}) {
    return BoxDecoration(
      image: DecorationImage(image: AssetImage(image), fit: BoxFit.cover),
    );
  }

  BoxDecoration netWorkImageStyle({required String image}) {
    return BoxDecoration(
      // image: DecorationImage(image: AssetImage(image), fit: BoxFit.cover),
      image: DecorationImage(image: NetworkImage(image), fit: BoxFit.cover),
    );
  }

  BoxDecoration gradientBK({double radius = 10}) {
    return BoxDecoration(
      borderRadius: BorderRadius.circular(radius),
      image: DecorationImage(
        image: AssetImage(Assets.imagesStreakBkImage),
        fit: BoxFit.fill,
      ),
    );
  }
}
