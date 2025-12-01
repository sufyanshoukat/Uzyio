import 'dart:developer';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:uzyio/constants/end_points.dart';
import 'package:uzyio/constants/loading_animation.dart';
import 'package:uzyio/core/common/global_instance.dart';
import 'package:uzyio/model/user_model/user_model.dart';

class UserService {
  UserService._privateConstructor();

  static UserService? _instance;

  static UserService get instance {
    _instance ??= UserService._privateConstructor();
    return _instance!;
  }

  // For Client
  Rx<UserModel> userModel = UserModel().obs;

  Future<void> getUserInformation() async {
    try {
      final response = await apiService.get(
        successCode: 200,
        getUserAPI,
        false, // false means use bearer token, not basic
        showResult: false, // optional: prints log of response
      );

      if (response != null) {
        final user = response['user'];
        userModel.value = UserModel.fromJson(user);
        log("Global user data fetched: ${userModel.value}");
      }

      hideLoadingDialog();
    } catch (e) {
      hideLoadingDialog();
      log("This exception occurred while getting user data: $e");
    }
  }
}
