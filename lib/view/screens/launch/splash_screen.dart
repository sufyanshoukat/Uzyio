// import 'dart:async';
// import 'package:flutter/material.dart';
// import 'package:get/get_core/src/get_main.dart';
// import 'package:get/get_navigation/get_navigation.dart';
// import 'package:uzyio/constants/app_colors.dart';
// import 'package:uzyio/constants/app_images.dart';
// import 'package:uzyio/constants/app_styling.dart';
// import 'package:uzyio/view/screens/auth/login.dart';
// import 'package:uzyio/view/widget/common_image_view_widget.dart';

// class SplashScreen extends StatefulWidget {
//   @override
//   State<SplashScreen> createState() => _SplashScreenState();
// }

// class _SplashScreenState extends State<SplashScreen> {
//   final onboardingBK = [
//     Assets.imagesAiBoy1,
//     Assets.imagesAiBoy2,
//     Assets.imagesAiGril1,
//     Assets.imagesAiGril2,
//     Assets.imagesProfileDefaultImage,
//     Assets.imagesBkImage,
//     Assets.imagesBkImage2,
//     Assets.imagesBackgroundImage3,
//     Assets.imagesBackgroundImage4,
//   ];

//   bool _imagesCached = false;

//   @override
//   void didChangeDependencies() {
//     super.didChangeDependencies();

//     // Run this only once
//     if (!_imagesCached) {
//       _imagesCached = true;
//       _precacheOnboardingImages();
//     }
//   }

//   Future<void> _precacheOnboardingImages() async {
//     for (final image in onboardingBK) {
//       await precacheImage(AssetImage(image), context);
//     }
//   }

//   @override
//   void initState() {
//     super.initState();
//     splashScreenHandler();
//   }

//   void splashScreenHandler() {
//     Timer(
//       Duration(seconds: 2),
//       () => Get.to(
//         () =>
//             //MyNavBar(selectedIndex: 2),
//             LoginPage(),
//         // Homepage(),
//         // Settings(),
//       ),
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       decoration: AppStyling().background(image: Assets.imagesBkImage),
//       child: Scaffold(
//         backgroundColor: kTransperentColor,
//         body: Center(
//           child: CommonImageView(height: 134, imagePath: Assets.imagesLogo),
//         ),
//       ),
//     );
//   }
// }

import 'dart:async';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:uzyio/constants/app_videos.dart';
import 'package:uzyio/controller/auth_controller/auth_controller.dart';
import 'package:uzyio/view/widget/my_text_widget.dart';
import 'package:video_player/video_player.dart';
import 'package:uzyio/constants/app_images.dart';
import 'package:uzyio/view/screens/auth/login.dart';
import 'package:uzyio/view/widget/common_image_view_widget.dart';

class SplashScreen extends StatefulWidget {
  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  late VideoPlayerController _controller;
  AuthController auth = Get.put(AuthController());

  @override
  void initState() {
    super.initState();

    /// Initialize video
    _controller = VideoPlayerController.asset(AppVideos.splash)
      ..initialize().then((_) {
        _controller.play();
        _controller.setLooping(false);
        setState(() {});
      });

    /// Navigate to Next Screen after 6 sec
    Future.delayed(Duration(seconds: 6), () {
      // Get.to(() => LoginPage());

      auth.checkLoginStatus();
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          /// ---------------- BACKGROUND VIDEO ----------------
          Positioned.fill(
            child:
                _controller.value.isInitialized
                    ? FittedBox(
                      fit: BoxFit.cover,
                      child: SizedBox(
                        width: _controller.value.size.width,
                        height: _controller.value.size.height,
                        child: VideoPlayer(_controller),
                      ),
                    )
                    : Container(color: Colors.black),
          ),

          /// ---------------- OVERLAY (BLACK FADE OPTIONAL) ----------------
          Container(color: Colors.black.withOpacity(0.2)),

          /// ---------------- CENTER LOGO ----------------
          // Center(
          //   child: CommonImageView(height: 130, imagePath: Assets.imagesLogo),
          // ),

          /// ---------------- BOTTOM TEXT ----------------
          Positioned(
            bottom: 50,
            left: 0,
            right: 0,
            child: Column(
              children: [
                Center(
                  child: CommonImageView(
                    height: 130,
                    imagePath: Assets.imagesLogo,
                  ),
                ),
                MyText(
                  paddingTop: 20,
                  text: "AI Art Generator",
                  size: 30,
                  weight: FontWeight.w700,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
