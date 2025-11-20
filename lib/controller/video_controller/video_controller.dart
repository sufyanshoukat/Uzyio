import 'package:get/get.dart';
import 'package:video_player/video_player.dart';

class VideoController extends GetxController {
  late VideoPlayerController controller;
  var isInitialized = false.obs;
  var isPlaying = false.obs;
  var showPlayButton = true.obs;

  void initializeVideo(String videoUrl) {
    controller = VideoPlayerController.networkUrl(Uri.parse(videoUrl))
      ..initialize().then((_) {
        isInitialized.value = true;
        controller.setLooping(true);
        // Auto-play video when initialized
        controller.play();
        isPlaying.value = true;
        update();
      });

    controller.addListener(() {
      isPlaying.value = controller.value.isPlaying;
    });
  }

  // Play/Pause functionality - COMMENTED OUT
  // void togglePlayPause() {
  //   if (controller.value.isPlaying) {
  //     controller.pause();
  //     showPlayButton.value = true;
  //   } else {
  //     controller.play();
  //     showPlayButton.value = false;
  //
  //     // Hide play button after 2 seconds when playing
  //     Future.delayed(Duration(seconds: 2), () {
  //       if (controller.value.isPlaying) {
  //         showPlayButton.value = false;
  //       }
  //     });
  //   }
  // }

  // Properly dispose video
  void disposeVideo() {
    if (isInitialized.value) {
      controller.pause();
      controller.dispose();
      isInitialized.value = false;
      isPlaying.value = false;
    }
  }

  @override
  void onClose() {
    disposeVideo();
    super.onClose();
  }
}
