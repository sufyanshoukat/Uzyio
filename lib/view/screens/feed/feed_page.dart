import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:like_button/like_button.dart';
import 'package:shimmer/shimmer.dart';
import 'package:uzyio/controller/feed_controller/feed_controller.dart';
import 'package:uzyio/view/widget/common_image_view_widget.dart';
import 'package:uzyio/view/widget/my_button.dart';

import 'package:uzyio/view/widget/my_text_widget.dart';
import 'package:video_player/video_player.dart';

// class FeedPage extends StatefulWidget {
//   const FeedPage({super.key});

//   @override
//   State<FeedPage> createState() => _FeedPageState();
// }

// class _FeedPageState extends State<FeedPage> {
//   final List<String> bgImages = [
//     Assets.imagesModelImage,
//     Assets.imagesAiGril1,
//     Assets.imagesAiGril2,
//     Assets.imagesAiBoy1,
//     Assets.imagesAiBoy2,
//   ];

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: PageView.builder(
//         scrollDirection: Axis.vertical, // IMPORTANT (TikTok style)
//         itemCount: bgImages.length,
//         itemBuilder: (context, index) {
//           return Stack(
//             children: [
//               /// ---------------- BACKGROUND IMAGE PER PAGE ----------------
//               Positioned.fill(
//                 child: Container(
//                   decoration: AppStyling().background(image: bgImages[index]),
//                 ),
//               ),

//               /// ---------------- FOREGROUND CONTENT (STICKY) ----------------
//               SafeArea(
//                 child: Padding(
//                   padding: AppSizes.DEFAULT,
//                   child: Column(
//                     children: [
//                       /// Back button
//                       Align(
//                         alignment: Alignment.topLeft,
//                         child: MyRoundButton(
//                           onTap: () => Get.back(),
//                           height: 60,
//                           child: CommonImageView(
//                             height: 28,
//                             svgPath: Assets.imagesBackBtnNewStyleSvgIcon,
//                           ),
//                         ),
//                       ),

//                       Spacer(),

//                       /// Right side like/share buttons
//                       Align(
//                         alignment: Alignment.centerRight,
//                         child: Column(
//                           crossAxisAlignment: CrossAxisAlignment.end,
//                           children: [
//                             SizedBox(
//                               height: 30,
//                               width: 40,
//                               child: LikeButton(
//                                 circleColor: CircleColor(
//                                   start: Color(0xff00ddff),
//                                   end: Color(0xff0099cc),
//                                 ),
//                                 bubblesColor: BubblesColor(
//                                   dotPrimaryColor: Colors.pink,
//                                   dotSecondaryColor: Colors.white,
//                                 ),
//                                 likeBuilder: (bool isLiked) {
//                                   return SizedBox(
//                                     height: 30,
//                                     width: 30,
//                                     child:
//                                         isLiked
//                                             ? Icon(
//                                               Icons.favorite,
//                                               color: Colors.red,
//                                               size: 29,
//                                             )
//                                             : CommonImageView(
//                                               svgPath:
//                                                   Assets.imagesFavOutlineIcon,
//                                             ),
//                                   );
//                                 },
//                               ),
//                             ),

//                             MyText(
//                               paddingBottom: 20,
//                               paddingTop: 5,
//                               text: "1.5k",
//                               size: 17,
//                               weight: FontWeight.w700,
//                             ),

//                             CommonImageView(svgPath: Assets.imagesShareIconS),

//                             MyText(
//                               paddingTop: 5,
//                               text: "44",
//                               size: 17,
//                               weight: FontWeight.w700,
//                             ),
//                           ],
//                         ),
//                       ),

//                       SizedBox(height: 20),

//                       /// Profile Row
//                       Row(
//                         children: [
//                           CommonImageView(
//                             height: 65,
//                             width: 65,
//                             radius: 100,
//                             imagePath: Assets.imagesAiGril1,
//                           ),
//                           MyText(
//                             paddingLeft: 10,
//                             text: "Richman",
//                             size: 21,
//                             weight: FontWeight.w700,
//                           ),
//                         ],
//                       ),

//                       /// Bottom button
//                       Stack(
//                         children: [
//                           MyButton(
//                             mTop: 20,
//                             mBottom: 30,
//                             onTap: () {
//                               Get.dialog(CustomDialog(child: TakePhotoPopup()));
//                             },
//                             buttonText: "Try Style",
//                           ),
//                           Positioned(
//                             left: Get.width / 2.5,
//                             top: 1,
//                             child: ProCard(),
//                           ),
//                         ],
//                       ),
//                     ],
//                   ),
//                 ),
//               ),
//             ],
//           );
//         },
//       ),
//     );
//   }
// }

class FeedPage extends StatefulWidget {
  const FeedPage({super.key});

  @override
  State<FeedPage> createState() => _FeedPageState();
}

class _FeedPageState extends State<FeedPage> {
  final FeedController controller = Get.put(FeedController());
  final PageController pageCtrl = PageController();
  final Map<int, VideoPlayerController> videoControllers = {};

  int currentIndex = 0;
  final int preloadRange = 3; // Preload 1 video before and after

  @override
  void dispose() {
    // Dispose all video controllers
    for (var vc in videoControllers.values) {
      vc.dispose();
    }
    videoControllers.clear();
    pageCtrl.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();

    // Listen for pagination
    pageCtrl.addListener(() {
      if (pageCtrl.page != null &&
          pageCtrl.page!.round() == controller.feedList.length - 2) {
        controller.loadMore();
      }
    });

    // Preload first video when feed loads
    ever(controller.feedList, (_) {
      if (controller.feedList.isNotEmpty && videoControllers.isEmpty) {
        _preloadVideos(0);
      }
    });
  }

  /// Preload videos around current index
  void _preloadVideos(int centerIndex) {
    final start = (centerIndex - preloadRange).clamp(
      0,
      controller.feedList.length - 1,
    );
    final end = (centerIndex + preloadRange).clamp(
      0,
      controller.feedList.length - 1,
    );

    for (int i = start; i <= end; i++) {
      final item = controller.feedList[i];
      final isVideo = item.file?.endsWith(".mp4") ?? false;

      if (isVideo && !videoControllers.containsKey(i)) {
        _initializeVideo(item.file!, i);
      }
    }

    // Dispose videos that are far away to save memory
    videoControllers.removeWhere((index, vc) {
      if ((index - centerIndex).abs() > preloadRange + 1) {
        vc.dispose();
        return true;
      }
      return false;
    });
  }

  /// Initialize video controller
  Future<void> _initializeVideo(String url, int index) async {
    if (videoControllers.containsKey(index)) return;

    try {
      final vc = VideoPlayerController.networkUrl(
        Uri.parse(url),
        videoPlayerOptions: VideoPlayerOptions(
          mixWithOthers: false,
          allowBackgroundPlayback: false,
        ),
      );

      await vc.initialize();
      vc.setLooping(true);

      videoControllers[index] = vc;

      // Auto play only if it's the current video
      if (index == currentIndex && mounted) {
        vc.play();
        setState(() {});
      }
    } catch (e) {
      debugPrint("❌ Video init error at index $index: $e");
    }
  }

  /// Handle page change
  void _onPageChanged(int index) {
    // Pause all other videos
    videoControllers.forEach((key, vc) {
      if (key != index) {
        vc.pause();
      }
    });

    // Reset and play current video from start
    if (videoControllers.containsKey(index)) {
      final vc = videoControllers[index]!;
      vc.seekTo(Duration.zero); // Reset to start
      vc.play();
    }

    currentIndex = index;

    // Preload nearby videos
    _preloadVideos(index);

    if (mounted) setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Obx(() {
        if (controller.isLoading.value) {
          return const FeedShimmer();
        }

        if (controller.feedList.isEmpty) {
          return const Center(
            child: Text("No Feed Found", style: TextStyle(color: Colors.white)),
          );
        }

        return PageView.builder(
          controller: pageCtrl,
          scrollDirection: Axis.vertical,
          itemCount: controller.feedList.length,
          onPageChanged: _onPageChanged,
          itemBuilder: (context, index) {
            final item = controller.feedList[index];
            final isVideo = item.file?.endsWith(".mp4") ?? false;

            return VideoFeedItem(
              item: item,
              isVideo: isVideo,
              videoController: videoControllers[index],
              index: index,
              isCurrentPage: index == currentIndex,
            );
          },
        );
      }),
    );
  }
}

/// Separate widget for each feed item
class VideoFeedItem extends StatefulWidget {
  final dynamic item;
  final bool isVideo;
  final VideoPlayerController? videoController;
  final int index;
  final bool isCurrentPage;

  const VideoFeedItem({
    super.key,
    required this.item,
    required this.isVideo,
    required this.videoController,
    required this.index,
    required this.isCurrentPage,
  });

  @override
  State<VideoFeedItem> createState() => _VideoFeedItemState();
}

class _VideoFeedItemState extends State<VideoFeedItem> {
  bool showPlayButton = false;

  void _togglePlayPause() {
    if (widget.videoController == null) return;

    setState(() => showPlayButton = true);

    if (widget.videoController!.value.isPlaying) {
      widget.videoController!.pause();
    } else {
      widget.videoController!.play();
    }

    // Hide icon after delay
    Future.delayed(const Duration(milliseconds: 800), () {
      if (mounted) {
        setState(() => showPlayButton = false);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        /// ----------------  FULL SCREEN VIDEO ----------------
        Positioned.fill(
          child:
              widget.isVideo
                  ? widget.videoController != null &&
                          widget.videoController!.value.isInitialized
                      ? GestureDetector(
                        onTap: _togglePlayPause,
                        child: Stack(
                          alignment: Alignment.center,
                          children: [
                            // Video player
                            SizedBox.expand(
                              child: FittedBox(
                                fit: BoxFit.cover,
                                child: SizedBox(
                                  width:
                                      widget.videoController!.value.size.width,
                                  height:
                                      widget.videoController!.value.size.height,
                                  child: VideoPlayer(widget.videoController!),
                                ),
                              ),
                            ),

                            /// Play/Pause icon with fade animation (only icon animates)
                            AnimatedOpacity(
                              opacity: showPlayButton ? 1.0 : 0.0,
                              duration: const Duration(milliseconds: 300),
                              child: Container(
                                padding: const EdgeInsets.all(20),
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: Colors.black.withOpacity(0.3),
                                ),
                                child: Icon(
                                  widget.videoController!.value.isPlaying
                                      ? Icons.pause
                                      : Icons.play_arrow,
                                  size: 60,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ],
                        ),
                      )
                      : const Center(
                        child: CircularProgressIndicator(color: Colors.white),
                      )
                  : const Center(
                    child: Text(
                      "No video available",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
        ),

        /// ---------------- FOREGROUND UI ----------------
        SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(18),
            child: Column(
              children: [
                // Back button
                // Align(
                //   alignment: Alignment.topLeft,
                //   child: GestureDetector(
                //     onTap: () => Get.back(),
                //     child: Container(
                //       padding: const EdgeInsets.all(10),
                //       decoration: BoxDecoration(
                //         shape: BoxShape.circle,
                //         color: Colors.black.withOpacity(0.4),
                //       ),
                //       child: const Icon(Icons.arrow_back, color: Colors.white),
                //     ),
                //   ),
                // ),
                const Spacer(),

                // Right side actions
                Align(
                  alignment: Alignment.centerRight,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      LikeButton(
                        mainAxisAlignment: MainAxisAlignment.end,
                        size: 36,
                        likeBuilder:
                            (isLiked) => Icon(
                              Icons.favorite,
                              color:
                                  isLiked
                                      ? Colors.red
                                      : Colors.white.withOpacity(0.8),
                              size: 36,
                            ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(right: 15, top: 5),
                        child: Text(
                          widget.item.likeCount ?? "0",
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 12,
                          ),
                        ),
                      ),
                      const SizedBox(height: 20),
                      const Icon(Icons.share, color: Colors.white, size: 32),
                      Padding(
                        padding: EdgeInsets.only(right: 14, top: 5),
                        child: Text(
                          widget.item.shareCount ?? "0",
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 12,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 20),

                // Creator info
                Row(
                  children: [
                    Text(
                      widget.item.creatorName ?? "Unknown",
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),

                // Try Style button
                Padding(
                  padding: const EdgeInsets.only(top: 20, bottom: 40),
                  child: MyButton(onTap: () {}, buttonText: "Try Style"),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class FeedShimmer extends StatelessWidget {
  const FeedShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey.shade900,
      highlightColor: Colors.grey.shade800,
      child: Container(
        width: double.infinity,
        height: double.infinity,
        color: Colors.black,
      ),
    );
  }
}
