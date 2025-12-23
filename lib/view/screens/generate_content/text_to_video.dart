import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:uzyio/constants/app_colors.dart';
import 'package:uzyio/constants/app_images.dart';
import 'package:uzyio/constants/app_sizes.dart';
import 'package:uzyio/constants/app_styling.dart';
import 'package:uzyio/controller/categories_controller/categories_controller.dart';
import 'package:uzyio/view/screens/generate_content/template_generated_style.dart';
import 'package:uzyio/view/screens/generate_content/image_generation_result.dart';
import 'package:uzyio/view/widget/custom_textfield.dart';
import 'package:uzyio/view/widget/general_appbar.dart';
import 'package:uzyio/view/widget/my_button.dart';
import 'package:uzyio/view/widget/my_text_widget.dart';

class TextToVideoPage extends StatefulWidget {
  const TextToVideoPage({super.key});

  @override
  State<TextToVideoPage> createState() => _TextToVideoPageState();
}

class _TextToVideoPageState extends State<TextToVideoPage> {
  final ctrl = Get.find<CategoriesController>();
  @override
  void dispose() {
    ctrl.textToImageController.clear();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: AppStyling().background(image: Assets.imagesBkImageSimple),
      child: Scaffold(
        backgroundColor: kTransperentColor,
        appBar: GeneralAppBar2(isBackButton: false, title: "Create Style"),
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
                // controller:
                txtColor: kWhiteColor,
              ),
              MyButton(
                mTop: 32,
                mBottom: 18,
                onTap: () {
                  ctrl.getTextToVideo(promt: ctrl.textToImageController.text);
                  // Get.to(() => GeneratedImagePage());
                },
                isGradientBackground: true,
                buttonText: "Generate Video",
              ),

              Align(
                alignment: Alignment.center,
                child: MyText(
                  text: "10 Coins",
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
