import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:uzyio/constants/app_colors.dart';
import 'package:uzyio/constants/app_images.dart';
import 'package:uzyio/controller/theme/theme_controller.dart';
import 'package:uzyio/view/widget/common_image_view_widget.dart';
import 'package:uzyio/view/widget/my_round_button.dart';
import 'package:uzyio/view/widget/my_text_widget.dart';
import 'package:uzyio/view/widget/pro_card.dart';

class GeneralAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String? title;
  final Color? appBarColor, backIconColor;
  final List<Widget>? action;
  final bool isBackButton;
  const GeneralAppBar({
    super.key,
    this.title,
    this.appBarColor,
    this.backIconColor,
    this.action,
    this.isBackButton = true,
  });

  Size get preferredSize => Size.fromHeight(kToolbarHeight);
  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: appBarColor ?? kTransperentColor,
      surfaceTintColor: appBarColor ?? kTransperentColor,
      automaticallyImplyLeading: false,
      leadingWidth: 50,
      centerTitle: true,
      leading: Row(
        children: [
          SizedBox(width: 10),
          Visibility(
            visible: isBackButton,
            child: MyRoundButton(
              onTap: () {
                Get.back();
              },
              child: CommonImageView(svgPath: Assets.imagesArrowBackS),
            ),
          ),
        ],
      ),
      title: MyText(text: '$title', size: 18, weight: FontWeight.w700),
      actions: action,
    );
  }
}

class HomeAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String? title, profileImage;
  final VoidCallback onDrawerTap;

  HomeAppBar({
    super.key,
    this.title,
    this.profileImage,
    required this.onDrawerTap,
  });
  Size get preferredSize => Size.fromHeight(80);

  var ctrl = Get.put(ThemeController());

  @override
  Widget build(BuildContext context) {
    return AppBar(
      toolbarHeight: 80,
      backgroundColor: kTransperentColor,
      surfaceTintColor: kTransperentColor,
      automaticallyImplyLeading: false,
      leadingWidth: Get.width,

      leading: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(width: 20),
          InkWell(
            onTap: onDrawerTap,
            child: CommonImageView(
              imagePath: profileImage ?? Assets.imagesProfileImage2,
              height: 41,
              width: 41,
              radius: 100,
            ),
          ),
          SizedBox(width: 12),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              MyText(
                text: title ?? "Balance",
                size: 18,
                weight: FontWeight.w500,
                color: (ctrl.isDarkTheme.value) ? kWhiteColor : kBlackColor,
              ),
              Row(
                children: [
                  CommonImageView(
                    height: 15,
                    imagePath: Assets.imagesCoinsIcon,
                  ),
                  MyText(
                    paddingLeft: 5,
                    text: "50 points",
                    size: 14,
                    weight: FontWeight.w500,
                    color: (ctrl.isDarkTheme.value) ? kWhiteColor : kBlackColor,
                  ),
                ],
              ),
            ],
          ),
          Spacer(),

          ProBtn(),
          SizedBox(width: 20),
        ],
      ),
    );
  }
}

class GeneralAppBar2 extends StatelessWidget implements PreferredSizeWidget {
  final String? title;
  final Color? appBarColor, backIconColor;
  final List<Widget>? action;
  final bool isBackButton;
  const GeneralAppBar2({
    super.key,
    this.title,
    this.appBarColor,
    this.backIconColor,
    this.action,
    this.isBackButton = true,
  });

  Size get preferredSize => Size.fromHeight(80);
  @override
  Widget build(BuildContext context) {
    return AppBar(
      toolbarHeight: 80,
      backgroundColor: appBarColor ?? kTransperentColor,
      surfaceTintColor: appBarColor ?? kTransperentColor,
      automaticallyImplyLeading: false,
      leadingWidth: 50,
      centerTitle: true,
      leading: Row(
        children: [
          SizedBox(width: 10),
          Visibility(
            visible: isBackButton,
            child: MyRoundButton(
              onTap: () {
                Get.back();
              },
              child: CommonImageView(svgPath: Assets.imagesCrossIconS),
            ),
          ),
        ],
      ),
      title: MyText(text: '$title', size: 18, weight: FontWeight.w700),
      actions: action,
    );
  }
}
