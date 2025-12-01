import 'dart:developer';
import 'package:get/get.dart';
import 'package:uzyio/constants/end_points.dart';
import 'package:uzyio/core/common/global_instance.dart';
import 'package:uzyio/model/my_creation/my_creation_model.dart';
import 'package:uzyio/services/user/user_services.dart';

class MyCreationController extends GetxController {
  RxList<MyCreationModel> myCreation = <MyCreationModel>[].obs;
  RxBool isLoading = false.obs;

  Future<void> getSeeAllTemplate({required String id}) async {
    try {
      log("📡 My Creation API Called");
      isLoading(true);

      final response = await apiService.get(
        getMyCreationAPI(
          id: UserService.instance.userModel.value.id.toString(),
        ),
        false,
        showResult: false,
        successCode: 200,
      );

      if (response != null) {
        MyCreationResponse body = MyCreationResponse.fromJson(response);

        /// 💯 Safely assign data
        myCreation.value = body.data ?? [];

        log("✅ My Creation Count: ${myCreation.length}");
      }

      isLoading(false);
    } catch (e) {
      isLoading(false);
      log("❌ Error while fetching MyCreations: $e");
    }
  }

  @override
  void onInit() {
    getSeeAllTemplate(id: UserService.instance.userModel.value.id.toString());
    super.onInit();
  }
}
