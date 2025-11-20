import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:uzyio/constants/app_colors.dart';
import 'package:uzyio/constants/app_images.dart';
import 'package:uzyio/constants/app_styling.dart';
import 'package:uzyio/controller/theme/theme_controller.dart';
import 'package:uzyio/view/screens/home/view_images.dart';
import 'package:uzyio/view/widget/common_image_view_widget.dart';
import 'package:uzyio/view/widget/my_ripple_effect.dart';
import 'package:uzyio/view/widget/my_text_widget.dart';
import 'package:uzyio/view/widget/pro_card.dart';

class CategorieButton extends StatelessWidget {
  final bool isSeleted;
  final String title, icon;
  final VoidCallback onTap;

  CategorieButton({
    super.key,
    this.isSeleted = true,
    required this.title,
    required this.icon,
    required this.onTap,
  });

  ThemeController controller = Get.put(ThemeController());

  @override
  Widget build(BuildContext context) {
    return (controller.isDarkTheme.value)
        ? GestureDetector(
          onTap: onTap,
          child: AnimatedContainer(
            padding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
            duration: Duration(milliseconds: 800),
            curve: Curves.easeOut,

            // transformAlignment: Alignment.topCenter,
            margin: EdgeInsets.only(right: 10),
            decoration: AppStyling().myDecoration(
              borderColor: kTransperentColor,
              color: (isSeleted) ? kWhiteColor : kBlackColor,
              radius: 100,
            ),

            child: Row(
              children: [
                CommonImageView(
                  svgNetwork: icon,
                  height: 20,
                  width: 20,
                  svgNetworkColor: (isSeleted) ? kBlackColor : kWhiteColor,
                ),
                SizedBox(width: 10),
                MyText(
                  text: title,
                  size: 14,
                  weight: FontWeight.w600,

                  color: (isSeleted) ? kBlackColor : kWhiteColor,
                ),
              ],
            ),
          ),
        )
        : GestureDetector(
          onTap: onTap,
          child: AnimatedContainer(
            padding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
            duration: Duration(milliseconds: 800),
            curve: Curves.easeOut,

            // transformAlignment: Alignment.topCenter,
            margin: EdgeInsets.only(right: 10),
            decoration: AppStyling().myDecoration(
              borderColor: kTransperentColor,
              color: (isSeleted) ? kBlackColor : kWhiteColor,
              radius: 100,
            ),

            child: Row(
              children: [
                CommonImageView(
                  svgNetwork: icon,
                  height: 20,
                  width: 20,
                  svgNetworkColor: (isSeleted) ? kWhiteColor : kBlackColor,
                ),
                SizedBox(width: 10),
                MyText(
                  text: title,
                  size: 14,
                  weight: FontWeight.w600,

                  color: (isSeleted) ? kWhiteColor : kBlackColor,
                ),
              ],
            ),
          ),
        );
  }
}

class AiImageCard extends StatelessWidget {
  final String aiImageURL, profileName;
  final String? profileImage;
  final double width, height;
  final bool isProCard;
  final VoidCallback? onTap;
  const AiImageCard({
    super.key,
    this.profileImage,
    required this.aiImageURL,
    required this.profileName,
    this.width = 140,
    this.height = 247,
    this.isProCard = false,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Stack(
        children: [
          CommonImageView(
            height: height,
            width: width,
            url: aiImageURL,
            radius: 10,
            fit: BoxFit.cover,
          ),

          Positioned.fill(
            child: Container(
              decoration: AppStyling().myDecoration(
                borderColor: kTransperentColor,
                color: kBlackColor.withValues(alpha: 0.3),
                radius: 10,
              ),
            ),
          ),
          SizedBox(
            height: height,
            width: width,
            child: Padding(
              padding: EdgeInsets.all(10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Visibility(visible: isProCard, child: ProCard()),
                  Spacer(),
                  // CommonImageView(
                  //   height: 42,
                  //   width: 42,
                  //   imagePath: profileImage,
                  //   radius: 100,
                  // ),
                  MyText(
                    paddingTop: 8,
                    text: profileName,
                    size: 14,
                    weight: FontWeight.bold,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class AiVideoCard extends StatelessWidget {
  final String aiImage, title;
  const AiVideoCard({super.key, required this.aiImage, required this.title});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        CommonImageView(
          height: 247,
          width: 140,
          imagePath: aiImage,
          radius: 10,
          fit: BoxFit.cover,
        ),

        Positioned.fill(
          child: Container(
            decoration: AppStyling().myDecoration(
              borderColor: kTransperentColor,
              color: kBlackColor.withValues(alpha: 0.3),
              radius: 10,
            ),
          ),
        ),
        SizedBox(
          height: 247,
          width: 140,
          child: Padding(
            padding: EdgeInsets.all(10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.end,
              // mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CommonImageView(height: 34, svgPath: Assets.imagesPlayIconS),

                Spacer(),
                MyText(
                  paddingBottom: 10,
                  paddingTop: 8,
                  text: title,
                  size: 14,
                  weight: FontWeight.bold,
                ),

                Row(
                  children: [
                    CommonImageView(
                      svgPath: Assets.imagesFavVideoCardIconSvg,
                      height: 15,
                    ),
                    MyText(
                      paddingLeft: 4,
                      paddingRight: 10,

                      text: "12",
                      size: 12,
                      weight: FontWeight.bold,
                    ),
                    CommonImageView(
                      svgPath: Assets.imagesShareVideoCardIconSvg,
                      height: 15,
                    ),
                    MyText(
                      paddingLeft: 4,
                      text: "17",
                      size: 12,
                      weight: FontWeight.bold,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class SeeAll extends StatelessWidget {
  final String? title;
  final VoidCallback? onTap;
  SeeAll({super.key, this.title, this.onTap});

  ThemeController controller = Get.put(ThemeController());

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 20, bottom: 12),
      child: Row(
        children: [
          Expanded(
            child: MyText(
              text: title ?? "AI Photoshoots Male",
              size: 18,
              weight: FontWeight.w700,
              color:
                  (controller.isDarkTheme.value) ? kPrimaryColor : kBlackColor,
            ),
          ),
          InkWell(
            onTap: onTap,
            child: Row(
              children: [
                MyText(
                  paddingRight: 3,
                  text: "See All",
                  size: 14,
                  weight: FontWeight.w600,
                  color:
                      (controller.isDarkTheme.value)
                          ? kPrimaryColor
                          : kBlackColor,
                ),
                Icon(
                  Icons.arrow_forward_ios_rounded,
                  color:
                      (controller.isDarkTheme.value)
                          ? kPrimaryColor
                          : kBlackColor,
                  size: 15,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

// -------- _Drawer Title --------

class DrawerTile extends StatelessWidget {
  final String title, icon;
  final VoidCallback onTap;
  final bool isCardSelected;
  final double paddingBottom;

  const DrawerTile({
    super.key,
    required this.title,
    required this.onTap,
    this.icon = '',
    this.isCardSelected = false,
    this.paddingBottom = 0.0,
  });

  @override
  Widget build(BuildContext context) {
    return MyRippleEffect(
      onTap: onTap,
      radius: 8,
      splashColor: kSecondaryColor.withOpacity(0.1),
      child: Padding(
        padding: EdgeInsets.only(left: 16, right: 16, top: 7, bottom: 7),
        child: Row(
          children: [
            Container(
              height: 33,
              width: 33,
              // decoration: AppStyling().myShadowDecoration(
              //   color: kPrimaryColor,
              //   borderRadius: 100,
              //   shadowColor: kBlackColor.withValues(alpha: 0.1),
              //   blurRadius: 5,
              //   spreadRadius: 1,
              // ),
              child: Center(child: CommonImageView(svgPath: icon)),
            ),
            Expanded(
              child: MyText(
                text: title,
                size: 14,
                weight: FontWeight.w400,
                maxLines: 1,
                textOverflow: TextOverflow.ellipsis,
                paddingLeft: 12,
              ),
            ),

            // CommonImageView(svgPath: Assets.imagesArrowForward),
          ],
        ),
      ),
    );
  }
}

class DrawerModel {
  String icon;
  String text;
  DrawerModel({required this.icon, required this.text});
}

class CategoriesModels {
  String icon;
  String title;
  CategoriesModels({required this.icon, required this.title});
}
