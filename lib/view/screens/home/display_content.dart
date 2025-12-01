import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:like_button/like_button.dart';
import 'package:uzyio/controller/categories_controller/categories_controller.dart';
import 'package:uzyio/controller/video_controller/video_controller.dart';
import 'package:uzyio/view/screens/generate_content/create_style.dart';
import 'package:video_player/video_player.dart';
import 'package:uzyio/constants/app_colors.dart';
import 'package:uzyio/constants/app_images.dart';
import 'package:uzyio/constants/app_sizes.dart';
import 'package:uzyio/view/widget/common_image_view_widget.dart';
import 'package:uzyio/view/widget/my_button.dart';
import 'package:uzyio/view/widget/my_round_button.dart';
import 'package:uzyio/view/widget/my_text_widget.dart';
import 'package:uzyio/view/widget/pro_card.dart';

// class DisplayContentPage extends StatefulWidget {
//   final String videoUrl;
//   final bool isVideo;

//   const DisplayContentPage({
//     super.key,
//     required this.videoUrl, // Pass your network video URL here
//     required this.isVideo, // Pass your network video URL here
//   });

//   @override
//   State<DisplayContentPage> createState() => _DisplayContentPageState();
// }

// class _DisplayContentPageState extends State<DisplayContentPage> {
//   final VideoController videoController = Get.find<VideoController>();
//   final CategoriesController _ctrl = Get.find<CategoriesController>();

//   @override
//   void initState() {
//     super.initState();
//     videoController.initializeVideo(widget.videoUrl);
//   }

//   @override
//   void dispose() {
//     videoController.controller.pause();
//     // Properly dispose video when leaving screen
//     videoController.disposeVideo();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.black,
//       body: Stack(
//         children: [
//           // Video Background
//           Obx(() {
//             if (videoController.isInitialized.value) {
//               return SizedBox.expand(
//                 child: FittedBox(
//                   fit: BoxFit.cover,
//                   child: SizedBox(
//                     width: videoController.controller.value.size.width,
//                     height: videoController.controller.value.size.height,
//                     child: VideoPlayer(videoController.controller),
//                   ),
//                 ),
//               );
//             } else {
//               // Loading indicator
//               return Center(
//                 child: CircularProgressIndicator(
//                   color: kWhiteColor,
//                   strokeWidth: 3,
//                 ),
//               );
//             }
//           }),

//           // Play/Pause button in center - COMMENTED OUT
//           // Obx(() {
//           //   if (videoController.isInitialized.value &&
//           //       videoController.showPlayButton.value) {
//           //     return Center(
//           //       child: GestureDetector(
//           //         onTap: videoController.togglePlayPause,
//           //         child: Container(
//           //           height: 80,
//           //           width: 80,
//           //           decoration: BoxDecoration(
//           //             color: Colors.black.withOpacity(0.5),
//           //             shape: BoxShape.circle,
//           //           ),
//           //           child: Icon(
//           //             videoController.isPlaying.value
//           //                 ? Icons.pause
//           //                 : Icons.play_arrow,
//           //             color: kWhiteColor,
//           //             size: 50,
//           //           ),
//           //         ),
//           //       ),
//           //     );
//           //   }
//           //   return SizedBox.shrink();
//           // }),

//           // Your existing UI overlays
//           SafeArea(
//             child: Padding(
//               padding: AppSizes.DEFAULT,
//               child: Column(
//                 mainAxisAlignment: MainAxisAlignment.start,
//                 children: [
//                   /// Back button top-left
//                   Align(
//                     alignment: Alignment.topLeft,
//                     child: MyRoundButton(
//                       onTap: () => Get.back(),
//                       splashColor: kWhiteColor.withValues(alpha: 0.9),
//                       height: 60,
//                       child: CommonImageView(
//                         height: 28,
//                         svgPath: Assets.imagesBackBtnNewStyleSvgIcon,
//                       ),
//                     ),
//                   ),

//                   Spacer(),

//                   // ------- Like & Share --------
//                   Align(
//                     alignment: Alignment.centerRight,
//                     child: Column(
//                       crossAxisAlignment: CrossAxisAlignment.end,
//                       children: [
//                         // Like Buttons
//                         SizedBox(
//                           height: 30,
//                           width: 40,
//                           child: LikeButton(
//                             mainAxisAlignment: MainAxisAlignment.end,
//                             circleColor: CircleColor(
//                               start: Color(0xff00ddff),
//                               end: Color(0xff0099cc),
//                             ),
//                             bubblesColor: BubblesColor(
//                               dotPrimaryColor: Colors.pink,
//                               dotSecondaryColor: Colors.white,
//                             ),
//                             likeBuilder: (bool isLiked) {
//                               return SizedBox(
//                                 height: 30,
//                                 width: 30,
//                                 child:
//                                     isLiked
//                                         ? Icon(
//                                           Icons.favorite,
//                                           color: Colors.red,
//                                           size: 29,
//                                         )
//                                         : Center(
//                                           child: CommonImageView(
//                                             svgPath:
//                                                 Assets.imagesFavOutlineIcon,
//                                           ),
//                                         ),
//                               );
//                             },
//                           ),
//                         ),
//                         MyText(
//                           paddingBottom: 20,
//                           paddingTop: 5,
//                           text: "1.5k",
//                           size: 17,
//                           weight: FontWeight.w700,
//                         ),

//                         // Share Button
//                         CommonImageView(svgPath: Assets.imagesShareIconS),
//                         MyText(
//                           paddingTop: 5,
//                           text: "44",
//                           size: 17,
//                           weight: FontWeight.w700,
//                         ),
//                       ],
//                     ),
//                   ),

//                   // ------- Profile Image & Name --------
//                   Row(
//                     children: [
//                       // CommonImageView(
//                       //   height: 65,
//                       //   width: 65,
//                       //   radius: 100,
//                       //   imagePath: Assets.imagesAiGril1,
//                       // ),
//                       MyText(
//                         paddingLeft: 10,
//                         text: "${_ctrl.singleTemplateData.value?.title}",
//                         size: 21,
//                         weight: FontWeight.w700,
//                       ),
//                     ],
//                   ),

//                   // ------- Try Style & Regenerate Button --------
//                   Stack(
//                     children: [
//                       MyButton(
//                         mTop: 20,
//                         mBottom: 30,
//                         onTap: () {
//                           videoController.disposeVideo();

//                           Get.to(
//                             () => CreateStylePage(
//                               endPoint:
//                                   "${_ctrl.singleTemplateData.value?.apiEndpoint}",
//                             ),
//                           );
//                         },
//                         buttonText: "Try Style",
//                       ),
//                       Positioned(
//                         left: Get.width / 2.5,
//                         top: 1,
//                         child: ProCard(),
//                       ),
//                     ],
//                   ),
//                 ],
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }

class DisplayContentPage extends StatefulWidget {
  final String videoUrl;
  final bool isVideo;

  const DisplayContentPage({
    super.key,
    required this.videoUrl,
    required this.isVideo,
  });

  @override
  State<DisplayContentPage> createState() => _DisplayContentPageState();
}

class _DisplayContentPageState extends State<DisplayContentPage> {
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

                  /// Like / Share buttons
                  Align(
                    alignment: Alignment.centerRight,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        SizedBox(
                          height: 30,
                          width: 40,
                          child: LikeButton(
                            circleColor: CircleColor(
                              start: Color(0xff00ddff),
                              end: Color(0xff0099cc),
                            ),
                            bubblesColor: BubblesColor(
                              dotPrimaryColor: Colors.pink,
                              dotSecondaryColor: Colors.white,
                            ),
                            likeBuilder: (bool isLiked) {
                              return Icon(
                                isLiked
                                    ? Icons.favorite
                                    : Icons.favorite_border,
                                color: isLiked ? Colors.red : Colors.white,
                                size: 28,
                              );
                            },
                          ),
                        ),
                        const SizedBox(height: 5),
                        MyText(text: "1.5k", size: 17, weight: FontWeight.w700),
                        const SizedBox(height: 20),
                        CommonImageView(svgPath: Assets.imagesShareIconS),
                        const SizedBox(height: 5),
                        MyText(text: "44", size: 17, weight: FontWeight.w700),
                      ],
                    ),
                  ),

                  /// Title
                  Row(
                    children: [
                      MyText(
                        paddingLeft: 10,
                        text: "${_ctrl.singleTemplateData.value?.title}",
                        size: 21,
                        weight: FontWeight.w700,
                      ),
                    ],
                  ),

                  /// Try Style Button
                  Stack(
                    children: [
                      MyButton(
                        mTop: 20,
                        mBottom: 30,
                        onTap: () {
                          if (widget.isVideo) videoController.disposeVideo();

                          Get.to(
                            () => CreateStylePage(
                              endPoint:
                                  "${_ctrl.singleTemplateData.value?.apiEndpoint}",
                            ),
                          );
                        },
                        buttonText: "Try Style",
                      ),
                      Positioned(
                        left: Get.width / 2.5,
                        top: 1,
                        child: ProCard(),
                      ),
                    ],
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
