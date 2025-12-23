import 'package:get/get.dart';
import 'package:uzyio/controller/auth_controller/auth_controller.dart';
import 'package:uzyio/controller/categories_controller/categories_controller.dart';
import 'package:uzyio/controller/chat/chat_controller.dart';
import 'package:uzyio/controller/faqs_controller/faqs_controller.dart';
import 'package:uzyio/controller/feed_controller/feed_controller.dart';
import 'package:uzyio/controller/my_creation/my_creation_controller.dart';
import 'package:uzyio/controller/payment_controller/payment_controller.dart';
import 'package:uzyio/controller/reward_controller.dart/reward_contoller.dart';
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

class MyCreationBindings implements Bindings {
  @override
  void dependencies() {
    Get.put(MyCreationController());
  }
}

class FeedBindings implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => FeedController());
  }
}

class RewardBindings implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => RewardController());
  }
}

class FaqsBindings implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => FaqsController());
  }
}

class chatBindings implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ChatController());
  }
}

class paymentBindings implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => PaymentController());
  }
}
