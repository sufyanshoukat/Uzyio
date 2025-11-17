import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:uzyio/constants/app_colors.dart';
import 'package:uzyio/constants/app_images.dart';
import 'package:uzyio/constants/app_sizes.dart';
import 'package:uzyio/constants/app_styling.dart';
import 'package:uzyio/constants/loading_animation.dart';
import 'package:uzyio/view/screens/home/convert_image.dart';
import 'package:uzyio/view/widget/general_appbar.dart';
import 'package:uzyio/view/widget/home_page_widgets.dart';
import 'package:uzyio/view/widget/my_button.dart';
import 'package:uzyio/view/widget/my_text_widget.dart';

class SeeAllAiPhotoPage extends StatefulWidget {
  String title;
  SeeAllAiPhotoPage({super.key, required this.title});

  @override
  State<SeeAllAiPhotoPage> createState() => _SeeAllAiPhotoPageState();
}

class _SeeAllAiPhotoPageState extends State<SeeAllAiPhotoPage> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: AppStyling().background(image: Assets.imagesBkImage),
      child: Scaffold(
        appBar: GeneralAppBar(title: widget.title),
        backgroundColor: kTransperentColor,
        body: Padding(
          padding: AppSizes.DEFAULT,
          child: GridView.builder(
            itemCount: 15,
            physics: BouncingScrollPhysics(),
            padding: EdgeInsets.zero,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisSpacing: 10,
              crossAxisSpacing: 10,
              mainAxisExtent: 260,
            ),
            itemBuilder: (context, index) {
              return AiImageCard(
                height: 260,
                width: Get.width,
                profileImage:
                    (index.isEven)
                        ? Assets.imagesAiGril1
                        : Assets.imagesAiGril2,
                aiImage:
                    (index.isEven) ? Assets.imagesAiBoy1 : Assets.imagesAiBoy2,
                profileName: (index.isEven) ? "Richman" : "Vishal",
              );
            },
          ),
        ),
      ),
    );
  }
}

class TakePhotoPopup extends StatefulWidget {
  const TakePhotoPopup({super.key});

  @override
  State<TakePhotoPopup> createState() => _TakePhotoPopupState();
}

class _TakePhotoPopupState extends State<TakePhotoPopup> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 14, vertical: 20),
      decoration: AppStyling().myDecoration(
        color: kDarkGrey1Color,
        borderColor: kTransperentColor,
        radius: 20,
      ),
      child: Column(
        children: [
          MyText(text: "Take Photo From", size: 20, weight: FontWeight.w800),
          MyButton(
            mTop: 29,
            onTap: () async {
              Get.back();
              showLoadingDialog();

              await Future.delayed(Duration(seconds: 5), () {
                log("is This works");
                Get.to(
                  () => ConvertImagePage(),
                  duration: Duration(milliseconds: 600),
                  transition: Transition.rightToLeft,
                );
              });

              // Get.back();
              // Get.back();
            },
            buttonText: "Gallery",
            isGradientBackground: false,
            backgroundColor: kDarkGrey2Color,
          ),
          MyButton(
            mTop: 13,
            onTap: () async {
              Get.back();
              showLoadingDialog();

              await Future.delayed(Duration(seconds: 5), () {
                log("is This works");
                Get.to(
                  () => ConvertImagePage(),
                  duration: Duration(milliseconds: 600),
                  transition: Transition.rightToLeft,
                );
              });
            },
            buttonText: "Camera",
            isGradientBackground: false,
            backgroundColor: kDarkGrey2Color,
          ),
        ],
      ),
    );
  }
}
