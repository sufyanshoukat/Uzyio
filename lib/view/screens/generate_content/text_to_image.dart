import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:uzyio/constants/app_colors.dart';
import 'package:uzyio/constants/app_images.dart';
import 'package:uzyio/constants/app_sizes.dart';
import 'package:uzyio/constants/app_styling.dart';
import 'package:uzyio/controller/categories_controller/categories_controller.dart';
import 'package:uzyio/view/widget/custom_textfield.dart';
import 'package:uzyio/view/widget/general_appbar.dart';
import 'package:uzyio/view/widget/my_button.dart';
import 'package:uzyio/view/widget/my_text_widget.dart';

class TextToImagePage extends StatefulWidget {
  const TextToImagePage({super.key});

  @override
  State<TextToImagePage> createState() => _TextToImagePageState();
}

class _TextToImagePageState extends State<TextToImagePage> {
  final ctrl = Get.find<CategoriesController>();

  @override
  void dispose() {
    super.dispose();
    ctrl.textToImageController.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: AppStyling().background(image: Assets.imagesBkImageSimple),
      child: Scaffold(
        backgroundColor: kTransperentColor,
        appBar: GeneralAppBar2(title: "Create Style", isBackButton: false),
        body: Padding(
          padding: AppSizes.DEFAULT,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Spacer(),
              // MyButton(
              //   onTap: () {},
              //   isGradientBackground: false,
              //   buttonText: "Change Image To Animated",
              //   backgroundColor: kWhiteColor,
              //   fontColor: kBlackColor,
              // ),
              Spacer(),

              MyText(
                paddingBottom: 15,
                text: "Type Your Prompt",
                size: 20,
                weight: FontWeight.w800,
              ),

              CustomTextField(
                controller: ctrl.textToImageController,
                focusedBorderColor: kSecondaryColor,
                outlineBorderColor: kTransperentColor,
                backgroundColor: Color(0xff2C2C2C),
                height: 150,
                maxLines: 10,
                contentPaddingTop: 20,
                contentPaddingRight: 10,
                contentPaddingLeft: 15,
                hintText: "",

                txtColor: kWhiteColor,
              ),
              MyButton(
                mTop: 32,
                mBottom: 18,
                onTap: () {
                  ctrl.getTextToImage(promt: ctrl.textToImageController.text);
                },
                isGradientBackground: true,
                buttonText: "Generate Image",
              ),

              Align(
                alignment: Alignment.center,
                child: MyText(
                  text: "50 Coins",
                  size: 16,
                  weight: FontWeight.w500,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
