import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:uzyio/constants/app_styling.dart';
import 'package:uzyio/controller/categories_controller/categories_controller.dart';
import 'package:uzyio/controller/video_controller/video_controller.dart';
import 'package:video_player/video_player.dart';
import 'package:uzyio/constants/app_colors.dart';
import 'package:uzyio/constants/app_images.dart';
import 'package:uzyio/constants/app_sizes.dart';
import 'package:uzyio/view/widget/common_image_view_widget.dart';
import 'package:uzyio/view/widget/my_round_button.dart';

class GeneratedStylePage extends StatefulWidget {
  final String videoUrl;

  const GeneratedStylePage({super.key, required this.videoUrl});

  @override
  State<GeneratedStylePage> createState() => _GeneratedStylePageState();
}

class _GeneratedStylePageState extends State<GeneratedStylePage> {
  final VideoController videoController = Get.find<VideoController>();
  final CategoriesController _ctrl = Get.find<CategoriesController>();

  @override
  void initState() {
    super.initState();
    videoController.initializeVideo(widget.videoUrl);
  }

  @override
  void dispose() {
    videoController.controller.pause();
    videoController.disposeVideo();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        children: [
          Obx(() {
            if (videoController.isInitialized.value) {
              return SizedBox.expand(
                child: FittedBox(
                  fit: BoxFit.cover,
                  child: SizedBox(
                    width: videoController.controller.value.size.width,
                    height: videoController.controller.value.size.height,
                    child: VideoPlayer(videoController.controller),
                  ),
                ),
              );
            } else {
              return Center(
                child: CircularProgressIndicator(
                  color: kWhiteColor,
                  strokeWidth: 3,
                ),
              );
            }
          }),

          SafeArea(
            child: Padding(
              padding: AppSizes.DEFAULT,
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
                    onTap: () {
                      log("Download Button Press");
                      _ctrl.downloadVideo(widget.videoUrl);
                    },
                    splashColor: kBlackColor.withValues(alpha: 0.7),
                    height: 60,
                    width: 60,
                    child: CommonImageView(svgPath: Assets.imagesDownloadIconS),
                  ),

                  // MyRoundButton(
                  //   onTap: () {},
                  //   splashColor: kBlackColor.withValues(alpha: 0.7),
                  //   height: 60,
                  //   width: 60,
                  //   child: CommonImageView(
                  //     svgPath: Assets.imagesShareUpdatedIconSvg,
                  //   ),
                  // ),
                  SizedBox(height: 30),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class GeneratedStylePageDummyPage extends StatefulWidget {
  const GeneratedStylePageDummyPage({super.key});

  @override
  State<GeneratedStylePageDummyPage> createState() =>
      _GeneratedStylePageDummyPageState();
}

class _GeneratedStylePageDummyPageState
    extends State<GeneratedStylePageDummyPage> {
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
