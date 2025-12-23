import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:like_button/like_button.dart';
import 'package:shimmer/shimmer.dart';
import 'package:uzyio/view/widget/my_text_widget.dart';
import 'package:video_player/video_player.dart';

import 'package:uzyio/controller/feed_controller/feed_controller.dart';
import 'package:uzyio/view/widget/my_button.dart';

/// ------------------------------------------------------------
/// FEED PAGE
/// ------------------------------------------------------------
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
  final int preloadRange = 2;

  @override
  void initState() {
    super.initState();

    pageCtrl.addListener(() {
      if (pageCtrl.page != null &&
          pageCtrl.page!.round() == controller.feedList.length - 2) {
        controller.loadMore();
      }
    });

    ever(controller.feedList, (_) {
      if (controller.feedList.isNotEmpty && videoControllers.isEmpty) {
        _preloadVideos(0);
      }
    });
  }

  @override
  void dispose() {
    for (final vc in videoControllers.values) {
      vc.dispose();
    }
    videoControllers.clear();
    pageCtrl.dispose();
    super.dispose();
  }

  /// ✅ CORRECT VIDEO CHECK (SIGNED URL SAFE)
  bool _isVideo(String? url) {
    if (url == null) return false;
    return Uri.parse(url).path.toLowerCase().endsWith(".mp4");
  }

  /// ------------------------------------------------------------
  /// PRELOAD VIDEOS
  /// ------------------------------------------------------------
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

      if (_isVideo(item.file) && !videoControllers.containsKey(i)) {
        _initVideo(item.file!, i);
      }
    }

    videoControllers.removeWhere((index, vc) {
      if ((index - centerIndex).abs() > preloadRange + 1) {
        vc.dispose();
        return true;
      }
      return false;
    });
  }

  /// ------------------------------------------------------------
  /// INIT VIDEO
  /// ------------------------------------------------------------
  Future<void> _initVideo(String url, int index) async {
    try {
      final vc = VideoPlayerController.networkUrl(Uri.parse(url));
      await vc.initialize();
      vc.setLooping(true);

      videoControllers[index] = vc;

      if (index == currentIndex) {
        vc.play();
      }

      if (mounted) setState(() {});
    } catch (e) {
      log("❌ Video init failed [$index]: $e");
    }
  }

  /// ------------------------------------------------------------
  /// PAGE CHANGE
  /// ------------------------------------------------------------
  void _onPageChanged(int index) {
    videoControllers.forEach((key, vc) {
      if (key != index) vc.pause();
    });

    if (videoControllers.containsKey(index)) {
      final vc = videoControllers[index]!;
      vc.seekTo(Duration.zero);
      vc.play();
    }

    currentIndex = index;
    _preloadVideos(index);

    if (mounted) setState(() {});
  }

  /// ------------------------------------------------------------
  /// UI
  /// ------------------------------------------------------------
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
            final isVideo = _isVideo(item.file);

            log("VIDEO: ${item.file}");
            log("IS VIDEO: $isVideo");

            return VideoFeedItem(
              item: item,
              isVideo: isVideo,
              videoController: videoControllers[index],
              isCurrent: index == currentIndex,
            );
          },
        );
      }),
    );
  }
}

/// ------------------------------------------------------------
/// VIDEO ITEM
/// ------------------------------------------------------------
class VideoFeedItem extends StatefulWidget {
  final dynamic item;
  final bool isVideo;
  final VideoPlayerController? videoController;
  final bool isCurrent;

  const VideoFeedItem({
    super.key,
    required this.item,
    required this.isVideo,
    required this.videoController,
    required this.isCurrent,
  });

  @override
  State<VideoFeedItem> createState() => _VideoFeedItemState();
}

class _VideoFeedItemState extends State<VideoFeedItem> {
  bool showIcon = false;

  void _togglePlay() {
    final vc = widget.videoController;
    if (vc == null) return;

    setState(() => showIcon = true);

    vc.value.isPlaying ? vc.pause() : vc.play();

    Future.delayed(const Duration(milliseconds: 700), () {
      if (mounted) setState(() => showIcon = false);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned.fill(
          child:
              widget.isVideo
                  ? widget.videoController != null &&
                          widget.videoController!.value.isInitialized
                      ? GestureDetector(
                        onTap: _togglePlay,
                        child: Stack(
                          alignment: Alignment.center,
                          children: [
                            FittedBox(
                              fit: BoxFit.cover,
                              child: SizedBox(
                                width: widget.videoController!.value.size.width,
                                height:
                                    widget.videoController!.value.size.height,
                                child: VideoPlayer(widget.videoController!),
                              ),
                            ),
                            AnimatedOpacity(
                              opacity: showIcon ? 1 : 0,
                              duration: const Duration(milliseconds: 300),
                              child: CircleAvatar(
                                radius: 35,
                                backgroundColor: Colors.black45,
                                child: Icon(
                                  widget.videoController!.value.isPlaying
                                      ? Icons.pause
                                      : Icons.play_arrow,
                                  size: 50,
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
                      "No video",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
        ),

        /// UI
        SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(18),
            child: Column(
              children: [
                const Spacer(),

                Align(
                  alignment: Alignment.centerRight,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      SizedBox(
                        width: 50,
                        child: Column(
                          children: [
                            LikeButton(
                              mainAxisAlignment: MainAxisAlignment.end,

                              size: 34,
                            ),
                            const SizedBox(height: 6),
                            MyText(
                              paddingLeft: 8,
                              text: widget.item.likeCount ?? "0",
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 18),
                      SizedBox(
                        width: 50,
                        child: Column(
                          children: [
                            const Icon(
                              Icons.share,
                              color: Colors.white,
                              size: 30,
                            ),
                            MyText(
                              paddingTop: 5,
                              paddingLeft: 8,
                              text: widget.item.likeCount ?? "0",
                            ),
                            // Text(
                            //   widget.item.likeCount ?? "0",
                            //   style: const TextStyle(color: Colors.white),
                            // ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 20),

                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    widget.item.creatorName ?? "Unknown",
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),

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

/// ------------------------------------------------------------
/// SHIMMER
/// ------------------------------------------------------------
class FeedShimmer extends StatelessWidget {
  const FeedShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey.shade900,
      highlightColor: Colors.grey.shade800,
      child: Container(
        color: Colors.black,
        width: double.infinity,
        height: double.infinity,
      ),
    );
  }
}
