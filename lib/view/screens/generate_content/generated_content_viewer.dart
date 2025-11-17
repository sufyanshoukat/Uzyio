import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:uzyio/constants/app_colors.dart';
import 'package:uzyio/constants/app_images.dart';
import 'package:uzyio/constants/app_sizes.dart';
import 'package:uzyio/constants/app_styling.dart';
import 'package:uzyio/view/widget/common_image_view_widget.dart';
import 'package:uzyio/view/widget/my_round_button.dart';

class GeneratedContentViewerPage extends StatefulWidget {
  const GeneratedContentViewerPage({super.key});

  @override
  State<GeneratedContentViewerPage> createState() =>
      _GeneratedContentViewerPageState();
}

class _GeneratedContentViewerPageState
    extends State<GeneratedContentViewerPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: AppStyling().background(image: Assets.imagesModelImage),
      child: Scaffold(
        backgroundColor: kTransperentColor,
        body: SafeArea(
          child: Padding(
            padding: AppSizes.DEFAULT,
            child: SizedBox(
              width: Get.width,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.end,
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
                  MyRoundButton(
                    onTap: () {},
                    splashColor: kBlackColor.withValues(alpha: 0.7),
                    height: 60,
                    width: 60,
                    child: CommonImageView(svgPath: Assets.imagesDownloadIconS),
                  ),
                  MyRoundButton(
                    onTap: () {},
                    splashColor: kBlackColor.withValues(alpha: 0.7),
                    height: 60,
                    width: 60,
                    child: CommonImageView(
                      svgPath: Assets.imagesShareUpdatedIconSvg,
                    ),
                  ),

                  SizedBox(height: 30),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
