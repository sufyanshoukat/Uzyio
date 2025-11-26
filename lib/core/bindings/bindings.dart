import 'package:get/get.dart';
import 'package:uzyio/controller/auth_controller/auth_controller.dart';
import 'package:uzyio/controller/categories_controller/categories_controller.dart';
import 'package:uzyio/controller/video_controller/video_controller.dart';

class AuthBindings implements Bindings {
  @override
  void dependencies() {
    Get.put(AuthController());
  }
}

class HomeBindings implements Bindings {
  @override
  void dependencies() {
    Get.put(CategoriesController());
  }
}

class VideoBindings implements Bindings {
  @override
  void dependencies() {
    Get.put(VideoController());
  }
}
