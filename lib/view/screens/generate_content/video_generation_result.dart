import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:uzyio/constants/app_colors.dart';
import 'package:uzyio/constants/app_images.dart';
import 'package:uzyio/constants/app_sizes.dart';
import 'package:uzyio/controller/categories_controller/categories_controller.dart';
import 'package:uzyio/controller/video_controller/video_controller.dart';
import 'package:uzyio/view/widget/common_image_view_widget.dart';
import 'package:uzyio/view/widget/my_round_button.dart';
import 'package:uzyio/view/widget/my_text_widget.dart';
import 'package:video_player/video_player.dart';

class VideoGenerationResultPage extends StatefulWidget {
  final String videoUrl;
  final bool isVideo;

  const VideoGenerationResultPage({
    super.key,
    required this.videoUrl,
    required this.isVideo,
  });

  @override
  State<VideoGenerationResultPage> createState() =>
      _VideoGenerationResultPageState();
}

class _VideoGenerationResultPageState extends State<VideoGenerationResultPage> {
  final VideoController videoController = Get.find<VideoController>();
  final CategoriesController _ctrl = Get.find<CategoriesController>();

  @override
  void initState() {
    super.initState();

    // Only initialize video when isVideo == true
    if (widget.isVideo) {
      videoController.initializeVideo(widget.videoUrl);
    }
  }

  @override
  void dispose() {
    // Only dispose if video was loaded
    if (widget.isVideo) {
      videoController.controller.pause();
      videoController.disposeVideo();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        children: [
          /// -------------------- FULLSCREEN CONTENT --------------------
          widget.isVideo
              ? Obx(() {
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
              })
              : SizedBox.expand(
                child: Image.network(
                  widget.videoUrl,
                  fit: BoxFit.cover,
                  errorBuilder:
                      (_, __, ___) => Center(
                        child: Icon(Icons.broken_image, color: Colors.white),
                      ),
                ),
              ),

          /// -------------------- UI OVERLAY --------------------
          SafeArea(
            child: Padding(
              padding: AppSizes.DEFAULT,
              child: Column(
                children: [
                  /// Back button
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

                  const Spacer(),

                  // /// Like / Share buttons
                  // Align(
                  //   alignment: Alignment.centerRight,
                  //   child: Column(
                  //     crossAxisAlignment: CrossAxisAlignment.end,
                  //     children: [
                  //       const SizedBox(height: 5),
                  //       MyText(text: "1.5k", size: 17, weight: FontWeight.w700),
                  //       const SizedBox(height: 20),
                  //       CommonImageView(svgPath: Assets.imagesShareIconS),
                  //       const SizedBox(height: 5),
                  //       MyText(text: "44", size: 17, weight: FontWeight.w700),
                  //     ],
                  //   ),
                  // ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
