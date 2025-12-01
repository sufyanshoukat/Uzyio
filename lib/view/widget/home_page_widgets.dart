import 'dart:async';
import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:get/get.dart';
import 'package:shimmer/shimmer.dart';
import 'package:uzyio/constants/app_colors.dart';
import 'package:uzyio/constants/app_images.dart';
import 'package:uzyio/constants/app_styling.dart';
import 'package:uzyio/controller/theme/theme_controller.dart';
import 'package:uzyio/main.dart';
import 'package:uzyio/view/widget/common_image_view_widget.dart';
import 'package:uzyio/view/widget/my_ripple_effect.dart';
import 'package:uzyio/view/widget/my_text_widget.dart';
import 'package:uzyio/view/widget/pro_card.dart';
import 'package:video_player/video_player.dart';
import 'package:video_thumbnail/video_thumbnail.dart';
import 'package:visibility_detector/visibility_detector.dart';

class CategorieButton extends StatelessWidget {
  final bool isSeleted;
  final String title, icon;
  final VoidCallback onTap;

  CategorieButton({
    super.key,
    this.isSeleted = true,
    required this.title,
    required this.icon,
    required this.onTap,
  });

  ThemeController controller = Get.put(ThemeController());

  @override
  Widget build(BuildContext context) {
    return (controller.isDarkTheme.value)
        ? GestureDetector(
          onTap: onTap,
          child: AnimatedContainer(
            padding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
            duration: Duration(milliseconds: 800),
            curve: Curves.easeOut,

            // transformAlignment: Alignment.topCenter,
            margin: EdgeInsets.only(right: 10),
            decoration: AppStyling().myDecoration(
              borderColor: kTransperentColor,
              color: (isSeleted) ? kWhiteColor : kBlackColor,
              radius: 100,
            ),

            child: Row(
              children: [
                CommonImageView(
                  svgNetwork: icon,
                  height: 20,
                  width: 20,
                  svgNetworkColor: (isSeleted) ? kBlackColor : kWhiteColor,
                ),
                SizedBox(width: 10),
                MyText(
                  text: title,
                  size: 14,
                  weight: FontWeight.w600,

                  color: (isSeleted) ? kBlackColor : kWhiteColor,
                ),
              ],
            ),
          ),
        )
        : GestureDetector(
          onTap: onTap,
          child: AnimatedContainer(
            padding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
            duration: Duration(milliseconds: 800),
            curve: Curves.easeOut,

            // transformAlignment: Alignment.topCenter,
            margin: EdgeInsets.only(right: 10),
            decoration: AppStyling().myDecoration(
              borderColor: kTransperentColor,
              color: (isSeleted) ? kBlackColor : kWhiteColor,
              radius: 100,
            ),

            child: Row(
              children: [
                CommonImageView(
                  svgNetwork: icon,
                  height: 20,
                  width: 20,
                  svgNetworkColor: (isSeleted) ? kWhiteColor : kBlackColor,
                ),
                SizedBox(width: 10),
                MyText(
                  text: title,
                  size: 14,
                  weight: FontWeight.w600,

                  color: (isSeleted) ? kWhiteColor : kBlackColor,
                ),
              ],
            ),
          ),
        );
  }
}

// ============================================
// 1. TEMPLATE CARD WITH VISIBILITY DETECTION
// ============================================

// class TemplateCard extends StatefulWidget {
//   final String URL;
//   final String profileName;
//   final double width;
//   final double height;
//   final bool isProCard;
//   final bool isVideo;
//   final VoidCallback? onTap;

//   const TemplateCard({
//     super.key,
//     required this.URL,
//     required this.profileName,
//     this.width = 140,
//     this.height = 247,
//     this.isProCard = false,
//     this.isVideo = false,
//     this.onTap,
//   });

//   @override
//   State<TemplateCard> createState() => _TemplateCardState();
// }

// class _TemplateCardState extends State<TemplateCard> {
//   VideoPlayerController? _videoController;
//   bool _isVideoReady = false;
//   bool _hasError = false;

//   @override
//   void initState() {
//     super.initState();
//     if (widget.isVideo) {
//       _initializeVideo(widget.URL);
//     }
//   }

//   Future<void> _initializeVideo(String url) async {
//     try {
//       // Network video controller without caching
//       _videoController = VideoPlayerController.network(
//         url,
//         videoPlayerOptions: VideoPlayerOptions(mixWithOthers: true),
//       );

//       await _videoController!.initialize();

//       // Reduce video quality (if server supports HLS/low-quality URL)
//       // Not directly possible in VideoPlayer, but network URL can point to low quality

//       await _videoController!.setLooping(true);
//       await _videoController!.setVolume(0.0);
//       await _videoController!.play();

//       if (mounted) {
//         setState(() {
//           _isVideoReady = true;
//           _hasError = false;
//         });
//       }
//     } catch (e) {
//       debugPrint("Video Load Error: $e");
//       if (mounted) {
//         setState(() {
//           _hasError = true;
//         });
//       }
//     }
//   }

//   @override
//   void dispose() {
//     _videoController?.pause();
//     _videoController?.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return InkWell(
//       onTap: widget.onTap,
//       child: Stack(
//         children: [
//           ClipRRect(
//             borderRadius: BorderRadius.circular(10),
//             child: SizedBox(
//               width: widget.width,
//               height: widget.height,
//               child: widget.isVideo ? _buildVideoWidget() : _buildImageWidget(),
//             ),
//           ),
//           Positioned.fill(
//             child: Container(
//               decoration: BoxDecoration(
//                 borderRadius: BorderRadius.circular(10),
//                 gradient: LinearGradient(
//                   begin: Alignment.topCenter,
//                   end: Alignment.bottomCenter,
//                   colors: [Colors.transparent, Colors.black.withOpacity(0.4)],
//                 ),
//               ),
//             ),
//           ),
//           SizedBox(
//             width: widget.width,
//             height: widget.height,
//             child: Padding(
//               padding: const EdgeInsets.all(10),
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: [
//                   if (widget.isProCard)
//                     Align(alignment: Alignment.topRight, child: ProCard())
//                   else
//                     const SizedBox.shrink(),
//                   Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     mainAxisSize: MainAxisSize.min,
//                     children: [
//                       if (widget.isVideo && _isVideoReady)
//                         const Icon(
//                           Icons.play_circle_filled,
//                           color: Colors.white70,
//                           size: 18,
//                         ),
//                       if (widget.isVideo && _isVideoReady)
//                         const SizedBox(height: 4),
//                       MyText(
//                         text: widget.profileName,
//                         size: 14,
//                         weight: FontWeight.bold,
//                         color: Colors.white,
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

//   Widget _buildImageWidget() {
//     return Image.network(
//       widget.URL,
//       fit: BoxFit.cover,
//       loadingBuilder: (context, child, progress) {
//         if (progress == null) return child;
//         return Center(
//           child: CircularProgressIndicator(
//             color: Colors.white70,
//             strokeWidth: 2,
//           ),
//         );
//       },
//       errorBuilder:
//           (_, __, ___) =>
//               Center(child: Icon(Icons.broken_image, color: Colors.white38)),
//     );
//   }

//   Widget _buildVideoWidget() {
//     if (_hasError) {
//       return Container(
//         color: Colors.grey[850],
//         child: const Center(
//           child: Icon(Icons.videocam_off, color: Colors.white38, size: 40),
//         ),
//       );
//     }
//     if (!_isVideoReady || _videoController == null) {
//       return Container(
//         color: Colors.grey[850],
//         child: const Center(
//           child: CircularProgressIndicator(color: Colors.white70),
//         ),
//       );
//     }
//     return FittedBox(
//       fit: BoxFit.cover,
//       clipBehavior: Clip.hardEdge,
//       child: SizedBox(
//         width: _videoController!.value.size.width,
//         height: _videoController!.value.size.height,
//         child: VideoPlayer(_videoController!),
//       ),
//     );
//   }
// }

// -------- Optimized Template Card with Life Cycle Management -------

class TemplateCard extends StatefulWidget {
  final String URL;
  final String? profileName;
  final double width;
  final double height;
  final bool? isProCard;
  final bool isVideo;
  final VoidCallback? onTap;

  const TemplateCard({
    super.key,
    required this.URL,
    this.profileName,
    this.width = 140,
    this.height = 247,
    this.isProCard = false,
    this.isVideo = false,
    this.onTap,
  });

  @override
  State<TemplateCard> createState() => _TemplateCardState();
}

class _TemplateCardState extends State<TemplateCard>
    with AutomaticKeepAliveClientMixin, WidgetsBindingObserver, RouteAware {
  VideoPlayerController? _videoController;
  bool _isVideoReady = false;
  bool _hasError = false;
  bool _isVisible = true;

  @override
  bool get wantKeepAlive => widget.isVideo; // Keep state alive for videos

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
    if (widget.isVideo) {
      _initializeVideo(widget.URL);
    }
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    // Subscribe to route changes
    final route = ModalRoute.of(context);
    if (route is PageRoute) {
      routeObserver.subscribe(this, route);
    }
  }

  @override
  void dispose() {
    routeObserver.unsubscribe(this);
    WidgetsBinding.instance.removeObserver(this);
    _videoController?.pause();
    _videoController?.dispose();
    super.dispose();
  }

  // RouteAware methods
  @override
  void didPush() {
    // Route was pushed onto navigator
    _isVisible = true;
    _playVideo();
  }

  @override
  void didPopNext() {
    // Returned to this route from another route
    _isVisible = true;
    _playVideo();
    debugPrint("Video Resumed (Back to Screen): ${widget.profileName}");
  }

  @override
  void didPushNext() {
    // New route was pushed, this route is no longer visible
    _isVisible = false;
    _pauseVideo();
    debugPrint("Video Paused (Left Screen): ${widget.profileName}");
  }

  @override
  void didPop() {
    // This route was popped
    _isVisible = false;
    _pauseVideo();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (!widget.isVideo || _videoController == null) return;

    switch (state) {
      case AppLifecycleState.paused:
      case AppLifecycleState.inactive:
      case AppLifecycleState.detached:
        _pauseVideo();
        break;
      case AppLifecycleState.resumed:
        if (_isVisible) _playVideo();
        break;
      case AppLifecycleState.hidden:
        _pauseVideo();
        break;
    }
  }

  void _pauseVideo() {
    if (_videoController?.value.isPlaying ?? false) {
      _videoController?.pause();
      debugPrint("Video Stopped: ${widget.profileName}");
    }
  }

  void _playVideo() {
    if (_isVideoReady && !(_videoController?.value.isPlaying ?? false)) {
      _videoController?.play();
      debugPrint("Video Started: ${widget.profileName}");
    }
  }

  Future<void> _initializeVideo(String url) async {
    try {
      _videoController = VideoPlayerController.networkUrl(
        Uri.parse(url),
        videoPlayerOptions: VideoPlayerOptions(
          mixWithOthers: true,
          allowBackgroundPlayback: false,
        ),
      );

      await _videoController!.initialize();
      await _videoController!.setLooping(true);
      await _videoController!.setVolume(0.0);

      if (mounted && _isVisible) {
        await _videoController!.play();
        debugPrint("Video Initialized & Started: ${widget.profileName}");
      }

      if (mounted) {
        setState(() {
          _isVideoReady = true;
          _hasError = false;
        });
      }
    } catch (e) {
      debugPrint("Video Load Error: $e");
      if (mounted) {
        setState(() {
          _hasError = true;
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    super.build(context); // Required for AutomaticKeepAliveClientMixin

    return InkWell(
      onTap: widget.onTap,
      child: Stack(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: SizedBox(
              width: widget.width,
              height: widget.height,
              child: widget.isVideo ? _buildVideoWidget() : _buildImageWidget(),
            ),
          ),
          Positioned.fill(
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [Colors.transparent, Colors.black.withOpacity(0.4)],
                ),
              ),
            ),
          ),
          SizedBox(
            width: widget.width,
            height: widget.height,
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  if (widget.isProCard == true)
                    Align(alignment: Alignment.topRight, child: ProCard())
                  else
                    const SizedBox.shrink(),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      if (widget.isVideo && _isVideoReady)
                        const Icon(
                          Icons.play_circle_filled,
                          color: Colors.white70,
                          size: 18,
                        ),
                      if (widget.isVideo && _isVideoReady)
                        const SizedBox(height: 4),
                      MyText(
                        text: widget.profileName ?? '',
                        size: 14,
                        weight: FontWeight.bold,
                        color: Colors.white,
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

  Widget _buildImageWidget() {
    return Image.network(
      widget.URL,
      fit: BoxFit.cover,
      loadingBuilder: (context, child, progress) {
        if (progress == null) return child;
        return Center(
          child: CircularProgressIndicator(
            color: Colors.white70,
            strokeWidth: 2,
          ),
        );
      },
      errorBuilder:
          (_, __, ___) =>
              Center(child: Icon(Icons.broken_image, color: Colors.white38)),
    );
  }

  Widget _buildVideoWidget() {
    if (_hasError) {
      return Container(
        color: Colors.grey[850],
        child: const Center(
          child: Icon(Icons.videocam_off, color: Colors.white38, size: 40),
        ),
      );
    }
    if (!_isVideoReady || _videoController == null) {
      return Container(
        color: Colors.grey[850],
        child: const Center(
          child: CircularProgressIndicator(color: Colors.white70),
        ),
      );
    }
    return FittedBox(
      fit: BoxFit.cover,
      clipBehavior: Clip.hardEdge,
      child: SizedBox(
        width: _videoController!.value.size.width,
        height: _videoController!.value.size.height,
        child: VideoPlayer(_videoController!),
      ),
    );
  }
}

// // ============================================
// // HELPER WIDGETS
// // ============================================

// class ProCard extends StatelessWidget {
//   const ProCard({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
//       decoration: BoxDecoration(
//         color: Colors.amber,
//         borderRadius: BorderRadius.circular(4),
//         boxShadow: [
//           BoxShadow(
//             color: Colors.black.withOpacity(0.3),
//             blurRadius: 4,
//             offset: const Offset(0, 2),
//           ),
//         ],
//       ),
//       child: const Text(
//         'PRO',
//         style: TextStyle(
//           color: Colors.black,
//           fontSize: 10,
//           fontWeight: FontWeight.bold,
//           letterSpacing: 0.5,
//         ),
//       ),
//     );
//   }
// }

// ============================================
// 2. ALTERNATIVE: MANUAL SCROLL CONTROLLER
// ============================================
// Use this if you don't want to add visibility_detector dependency

class TemplateCardWithScrollController extends StatefulWidget {
  final String URL;
  final String profileName;
  final double width;
  final double height;
  final bool isProCard;
  final bool isVideo;
  final VoidCallback? onTap;
  final ScrollController scrollController;
  final int index;

  const TemplateCardWithScrollController({
    super.key,
    required this.URL,
    required this.profileName,
    required this.scrollController,
    required this.index,
    this.width = 140,
    this.height = 247,
    this.isProCard = false,
    this.isVideo = false,
    this.onTap,
  });

  @override
  State<TemplateCardWithScrollController> createState() =>
      _TemplateCardWithScrollControllerState();
}

class _TemplateCardWithScrollControllerState
    extends State<TemplateCardWithScrollController> {
  VideoPlayerController? _videoController;
  bool _isVideoReady = false;
  bool _hasError = false;
  Timer? _previewTimer;
  final GlobalKey _cardKey = GlobalKey();

  @override
  void initState() {
    super.initState();
    if (widget.isVideo) {
      widget.scrollController.addListener(_checkVisibility);
      WidgetsBinding.instance.addPostFrameCallback((_) => _checkVisibility());
    }
  }

  @override
  void dispose() {
    widget.scrollController.removeListener(_checkVisibility);
    _disposeVideo();
    super.dispose();
  }

  void _checkVisibility() {
    if (!mounted || !widget.isVideo) return;

    final RenderBox? renderBox =
        _cardKey.currentContext?.findRenderObject() as RenderBox?;

    if (renderBox == null) return;

    final position = renderBox.localToGlobal(Offset.zero);
    final size = renderBox.size;
    final screenWidth = MediaQuery.of(context).size.width;

    // Check if card is in visible area (with some buffer)
    final isVisible = position.dx < screenWidth && position.dx + size.width > 0;

    if (isVisible && _videoController == null) {
      _loadAndPlayVideo();
    } else if (!isVisible && _videoController != null) {
      _videoController?.pause();
    } else if (isVisible &&
        _videoController != null &&
        !_videoController!.value.isPlaying) {
      _videoController?.play();
    }
  }

  Future<void> _loadAndPlayVideo() async {
    if (_videoController != null) return;

    try {
      final file = await DefaultCacheManager().getSingleFile(widget.URL);
      if (!mounted) return;

      _videoController = VideoPlayerController.file(file);
      await _videoController!.initialize();
      if (!mounted) return;

      final videoDuration = _videoController!.value.duration;

      _videoController!
        ..setLooping(videoDuration.inSeconds <= 5)
        ..setVolume(0)
        ..play();

      if (videoDuration.inSeconds > 5) {
        _previewTimer = Timer.periodic(const Duration(seconds: 5), (_) async {
          if (_videoController?.value.isInitialized == true && mounted) {
            await _videoController!.seekTo(Duration.zero);
            await _videoController!.play();
          }
        });
      }

      if (mounted) {
        setState(() {
          _isVideoReady = true;
          _hasError = false;
        });
      }
    } catch (e) {
      debugPrint("Video Load Error: $e");
      if (mounted) {
        setState(() => _hasError = true);
      }
    }
  }

  void _disposeVideo() {
    _previewTimer?.cancel();
    _videoController?.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      key: _cardKey,
      child: InkWell(
        onTap: widget.onTap,
        child: Stack(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: SizedBox(
                height: widget.height,
                width: widget.width,
                child:
                    widget.isVideo ? _buildVideoWidget() : _buildImageWidget(),
              ),
            ),
            Positioned.fill(
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [Colors.transparent, Colors.black.withOpacity(0.5)],
                  ),
                ),
              ),
            ),
            SizedBox(
              height: widget.height,
              width: widget.width,
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    if (widget.isProCard)
                      Align(alignment: Alignment.topRight, child: ProCard()),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        if (widget.isVideo && !_isVideoReady)
                          const Icon(
                            Icons.play_circle_outline,
                            color: Colors.white,
                            size: 20,
                          ),
                        const SizedBox(height: 4),
                        MyText(
                          text: widget.profileName,
                          size: 14,
                          weight: FontWeight.bold,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildImageWidget() {
    return Image.network(
      widget.URL,
      fit: BoxFit.cover,
      errorBuilder:
          (c, e, s) => Container(
            color: Colors.grey[900],
            child: const Icon(Icons.broken_image, color: Colors.white54),
          ),
    );
  }

  Widget _buildVideoWidget() {
    if (_hasError) {
      return Container(
        color: Colors.grey[900],
        child: const Center(
          child: Icon(Icons.error_outline, color: Colors.white54, size: 40),
        ),
      );
    }

    if (!_isVideoReady) {
      return Container(
        color: Colors.grey[900],
        child: const Center(
          child: CircularProgressIndicator(color: Colors.white, strokeWidth: 2),
        ),
      );
    }

    return FittedBox(
      fit: BoxFit.cover,
      clipBehavior: Clip.hardEdge,
      child: SizedBox(
        width: _videoController!.value.size.width,
        height: _videoController!.value.size.height,
        child: VideoPlayer(_videoController!),
      ),
    );
  }
}

// // ============================================
// // HELPER WIDGETS
// // ============================================

// class ProCard extends StatelessWidget {
//   const ProCard({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
//       decoration: BoxDecoration(
//         color: Colors.amber,
//         borderRadius: BorderRadius.circular(4),
//       ),
//       child: const Text(
//         'PRO',
//         style: TextStyle(
//           color: Colors.black,
//           fontSize: 10,
//           fontWeight: FontWeight.bold,
//         ),
//       ),
//     );
//   }
// }

// Placeholder for ProCard widget
class ProCard extends StatelessWidget {
  const ProCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        color: Colors.amber,
        borderRadius: BorderRadius.circular(4),
      ),
      child: const Text(
        'PRO',
        style: TextStyle(
          color: Colors.black,
          fontSize: 10,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}

class AiVideoCard extends StatelessWidget {
  final String aiImage, title;
  const AiVideoCard({super.key, required this.aiImage, required this.title});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        CommonImageView(
          height: 247,
          width: 140,
          imagePath: aiImage,
          radius: 10,
          fit: BoxFit.cover,
        ),

        Positioned.fill(
          child: Container(
            decoration: AppStyling().myDecoration(
              borderColor: kTransperentColor,
              color: kBlackColor.withValues(alpha: 0.3),
              radius: 10,
            ),
          ),
        ),
        SizedBox(
          height: 247,
          width: 140,
          child: Padding(
            padding: EdgeInsets.all(10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.end,
              // mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CommonImageView(height: 34, svgPath: Assets.imagesPlayIconS),

                Spacer(),
                MyText(
                  paddingBottom: 10,
                  paddingTop: 8,
                  text: title,
                  size: 14,
                  weight: FontWeight.bold,
                ),

                Row(
                  children: [
                    CommonImageView(
                      svgPath: Assets.imagesFavVideoCardIconSvg,
                      height: 15,
                    ),
                    MyText(
                      paddingLeft: 4,
                      paddingRight: 10,

                      text: "12",
                      size: 12,
                      weight: FontWeight.bold,
                    ),
                    CommonImageView(
                      svgPath: Assets.imagesShareVideoCardIconSvg,
                      height: 15,
                    ),
                    MyText(
                      paddingLeft: 4,
                      text: "17",
                      size: 12,
                      weight: FontWeight.bold,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class SeeAll extends StatelessWidget {
  final String? title;
  final VoidCallback? onTap;
  SeeAll({super.key, this.title, this.onTap});

  ThemeController controller = Get.put(ThemeController());

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 20, bottom: 12),
      child: Row(
        children: [
          Expanded(
            child: MyText(
              text: title ?? "AI Photoshoots Male",
              size: 18,
              weight: FontWeight.w700,
              color:
                  (controller.isDarkTheme.value) ? kPrimaryColor : kBlackColor,
            ),
          ),
          InkWell(
            onTap: onTap,
            child: Row(
              children: [
                MyText(
                  paddingRight: 3,
                  text: "See All",
                  size: 14,
                  weight: FontWeight.w600,
                  color:
                      (controller.isDarkTheme.value)
                          ? kPrimaryColor
                          : kBlackColor,
                ),
                Icon(
                  Icons.arrow_forward_ios_rounded,
                  color:
                      (controller.isDarkTheme.value)
                          ? kPrimaryColor
                          : kBlackColor,
                  size: 15,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

// -------- _Drawer Title --------

class DrawerTile extends StatelessWidget {
  final String title, icon;
  final VoidCallback onTap;
  final bool isCardSelected;
  final double paddingBottom;

  const DrawerTile({
    super.key,
    required this.title,
    required this.onTap,
    this.icon = '',
    this.isCardSelected = false,
    this.paddingBottom = 0.0,
  });

  @override
  Widget build(BuildContext context) {
    return MyRippleEffect(
      onTap: onTap,
      radius: 8,
      splashColor: kSecondaryColor.withOpacity(0.1),
      child: Padding(
        padding: EdgeInsets.only(left: 16, right: 16, top: 7, bottom: 7),
        child: Row(
          children: [
            Container(
              height: 33,
              width: 33,
              // decoration: AppStyling().myShadowDecoration(
              //   color: kPrimaryColor,
              //   borderRadius: 100,
              //   shadowColor: kBlackColor.withValues(alpha: 0.1),
              //   blurRadius: 5,
              //   spreadRadius: 1,
              // ),
              child: Center(child: CommonImageView(svgPath: icon)),
            ),
            Expanded(
              child: MyText(
                text: title,
                size: 14,
                weight: FontWeight.w400,
                maxLines: 1,
                textOverflow: TextOverflow.ellipsis,
                paddingLeft: 12,
              ),
            ),

            // CommonImageView(svgPath: Assets.imagesArrowForward),
          ],
        ),
      ),
    );
  }
}

class DrawerModel {
  String icon;
  String text;
  DrawerModel({required this.icon, required this.text});
}

class CategoriesModels {
  String icon;
  String title;
  CategoriesModels({required this.icon, required this.title});
}

class CategoryShimmer extends StatelessWidget {
  final int itemCount;

  const CategoryShimmer({super.key, this.itemCount = 5});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      padding: const EdgeInsets.only(left: 20),
      child: Row(
        children: List.generate(itemCount, (index) {
          return Padding(
            padding: const EdgeInsets.only(right: 10),
            child: Shimmer.fromColors(
              baseColor: Colors.grey.shade200,
              highlightColor: Colors.grey.shade400,
              child: Container(
                width: 90,
                height: 35,
                decoration: BoxDecoration(
                  color: Colors.grey.shade900,
                  borderRadius: BorderRadius.circular(100),
                ),
              ),
            ),
          );
        }),
      ),
    );
  }
}

class ShimmerBox extends StatelessWidget {
  final double width;
  final double height;
  final double radius;

  const ShimmerBox({
    super.key,
    required this.width,
    required this.height,
    this.radius = 12,
  });

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey.shade800,
      highlightColor: Colors.grey.shade600,
      child: Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
          color: Colors.grey.shade900,
          borderRadius: BorderRadius.circular(radius),
        ),
      ),
    );
  }
}

// TRY NOW CARD

class TryNowCard extends StatefulWidget {
  final VoidCallback onTap;
  final String imageURL, title, subTitle;
  final bool isVideo;
  final int index;

  const TryNowCard({
    super.key,
    required this.onTap,
    required this.index,
    required this.imageURL,
    required this.title,
    required this.subTitle,
    required this.isVideo,
  });

  @override
  State<TryNowCard> createState() => _TryNowCardState();
}

class _TryNowCardState extends State<TryNowCard> {
  VideoPlayerController? _videoController;
  bool _isVideoReady = false;
  @override
  void initState() {
    super.initState();

    if (widget.isVideo) {
      _loadCachedVideo(widget.imageURL);
    }
  }

  Future<void> _loadCachedVideo(String url) async {
    final file = await DefaultCacheManager().getSingleFile(url);

    _videoController = VideoPlayerController.file(file)
      ..initialize().then((_) {
        _videoController!.setLooping(true);
        _videoController!.setVolume(0.0); // mute
        _videoController!.play(); // autoplay

        setState(() {
          _isVideoReady = true;
        });
      });
  }

  @override
  void dispose() {
    _videoController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: (widget.index == 0) ? 20 : 0, right: 10),
      child: Stack(
        children: [
          // IMAGE OR VIDEO
          Container(
            height: 199,
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(7)),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(7),
              child:
                  widget.isVideo
                      ? _buildVideoPlayer()
                      : _buildImage(widget.imageURL),
            ),
          ),

          // GRADIENT & TEXT
          Positioned.fill(
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(7),
                gradient: LinearGradient(
                  colors: [
                    kBlackColor.withValues(alpha: 0.2),
                    kBlackColor.withValues(alpha: 0.4),
                  ],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                ),
              ),
              child: _buildCardContent(),
            ),
          ),
        ],
      ),
    );
  }

  // --------------------------
  // IMAGE WIDGET
  // --------------------------
  Widget _buildImage(String url) {
    return Image.network(
      url,
      fit: BoxFit.cover,
      errorBuilder: (c, e, s) => const Center(child: Icon(Icons.broken_image)),
    );
  }

  // --------------------------
  // VIDEO WIDGET (AUTOPLAY + MUTE)
  // --------------------------
  Widget _buildVideoPlayer() {
    if (!_isVideoReady) {
      return const Center(
        child: CircularProgressIndicator(color: Colors.white),
      );
    }

    return FittedBox(
      fit: BoxFit.cover,
      clipBehavior: Clip.hardEdge,
      child: SizedBox(
        width: _videoController!.value.size.width,
        height: _videoController!.value.size.height,
        child: VideoPlayer(_videoController!),
      ),
    );
  }

  // --------------------------
  // CONTENT BELOW (TITLE & BUTTON)
  // --------------------------
  Widget _buildCardContent() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  MyText(text: widget.title, size: 18, weight: FontWeight.w700),
                ],
              ),
            ),
            InkWell(
              onTap: widget.onTap,
              child: Container(
                width: 80,
                height: 30,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(100),
                  gradient: const LinearGradient(
                    colors: [Color(0xffBA41AB), Color(0xff7117B9)],
                    begin: Alignment.topLeft,
                    end: Alignment.topRight,
                  ),
                ),
                child: Center(
                  child: MyText(
                    text: "Try Now",
                    size: 12,
                    weight: FontWeight.w600,
                  ),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}

class TryNowCardShimmer extends StatelessWidget {
  const TryNowCardShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20, right: 10),
      child: Shimmer.fromColors(
        baseColor: Colors.grey.shade400,
        highlightColor: Colors.grey.shade200,
        child: Container(
          height: 199,
          width: Get.width / 1.3,
          decoration: BoxDecoration(
            color: Colors.grey.shade900,
            borderRadius: BorderRadius.circular(7),
          ),
        ),
      ),
    );
  }
}


// 