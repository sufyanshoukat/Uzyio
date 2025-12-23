import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:uzyio/constants/app_colors.dart';
import 'package:uzyio/constants/app_images.dart';
import 'package:uzyio/constants/app_sizes.dart';
import 'package:uzyio/constants/app_styling.dart';
import 'package:uzyio/constants/loading_animation.dart';
import 'package:uzyio/view/screens/generate_content/image_generation_result.dart';
import 'package:uzyio/view/widget/common_image_view_widget.dart';
import 'package:uzyio/view/widget/my_button.dart';
import 'package:uzyio/view/widget/my_round_button.dart';
import 'package:uzyio/view/widget/pro_card.dart';

class ConvertImagePage extends StatefulWidget {
  const ConvertImagePage({super.key});

  @override
  State<ConvertImagePage> createState() => _ConvertImagePageState();
}

class _ConvertImagePageState extends State<ConvertImagePage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: AppStyling().background(image: Assets.imagesModelImage),
      child: Scaffold(
        backgroundColor: kTransperentColor,
        body: SafeArea(
          child: Padding(
            padding: AppSizes.DEFAULT,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                /// Back button top-left
                Align(
                  alignment: Alignment.topLeft,
                  child: MyRoundButton(
                    onTap: () => Get.back(),
                    splashColor: kWhiteColor.withValues(alpha: 0.9),
                    height: 60,

                    child: CommonImageView(
                      height: 28,
                      svgPath: Assets.imagesBackBtnNewStyleSvgIcon,
                    ),
                  ),
                ),
                Spacer(),

                // ------- Try Style & Regenerate Button --------
                Stack(
                  children: [
                    MyButton(
                      mTop: 20,
                      mBottom: 30,
                      onTap: () async {
                        showLoadingDialog();

                        await Future.delayed(Duration(seconds: 5), () {
                          Get.to(
                            () => ImageGenerationResultPage(),
                            duration: Duration(milliseconds: 600),
                            transition: Transition.rightToLeft,
                          );
                          // displayToast(msg: "Image Converted");
                        });
                      },
                      buttonText: "Convert",
                    ),

                    Positioned(left: Get.width / 2.5, top: 1, child: ProCard()),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
