import 'dart:developer';
import 'package:get/get.dart';
import 'package:uzyio/constants/end_points.dart';
import 'package:uzyio/constants/loading_animation.dart';
import 'package:uzyio/core/common/global_instance.dart';
import 'package:uzyio/model/reward/reward_coin_model.dart';
import 'package:uzyio/model/reward/reward_model.dart';
import 'package:uzyio/services/user/user_services.dart';

class RewardController extends GetxController {
  RxList<RewardModel> rewards = <RewardModel>[].obs;
  RxBool isLoading = false.obs;
  RxInt rewardTypeIndex = 0.obs;
  RxList<RewardData> coinsList = <RewardData>[].obs;

  Future<void> getReward({String type = ''}) async {
    try {
      isLoading(true);
      rewards.clear();
      final response = await apiService.get(
        getRewardURL(type: type),
        true,
        showResult: false,
        successCode: 200,
      );

      if (response != null) {
        var rewardData = response["rewards"];
        for (var i in rewardData) {
          var item = RewardModel.fromJson(i);
          rewards.add(item);
        }
      }

      isLoading(false);

      log("✅ Rewards Items List: ${rewards.length}");
    } catch (e) {
      isLoading(false);
      log("❌ Error while fetching Rewards Items Data: $e");
    }
  }

  Future<void> redeemNow({required String rewardID}) async {
    try {
      showLoadingDialog();
      Map<String, dynamic> body = {
        "user_id": UserService.instance.userModel.value.id,
        "reward_id": rewardID,
      };

      final response = await apiService.post(
        redeemNowAPI,
        body,
        false,
        showResult: false,
        successCode: 200,
      );

      if (response != null) {
        final success = response['success'];
        final message = response['message'];

        if (success == true) {
          log("Success: $success");
          displayToast(msg: "$message");
          Get.close(1);
        }
      }
      hideLoadingDialog();
    } catch (e) {
      hideLoadingDialog();
      log('Error while hitting Redeem Now API: $e');
    }
  }

  Future<void> getRewardFun() async {
    try {
      coinsList.clear();
      final response = await apiService.get(
        rewardSettingAPI,
        true,
        showResult: false,
        successCode: 200,
      );
      if (response != null) {
        var body = response['data'];
        for (var i in body) {
          RewardData item = RewardData.fromJson(i);
          coinsList.add(item);
        }
        // var body = RewardCoinModel.fromJson(response);
        // coinsList.addAll(body);

        /// ✅ Map reward coins

        log("✅ Reward Coins Loaded ${coinsList.length}");
      }
    } catch (e) {
      log("❌ Error while fetching Rewards Data: $e");
    }
  }

  // Future<void> getRewardCoins() async {
  //   try {
  //     isLoading(true);

  //     final response = await apiService.get(
  //       rewardSettingAPI,
  //       true,
  //       showResult: false,
  //       successCode: 200,
  //     );

  //     if (response != null) {
  //       /// ✅ Map reward coins

  //     log("✅ Reward Coins Loaded");
  //     log("🎁 Daily Login Coins: $}");
  //   } catch (e) {
  //     log("❌ Error while fetching Rewards Data: $e");
  //   } finally {
  //     isLoading(false);
  //   }
  // }}

  @override
  void onInit() {
    getRewardFun();
    getReward();
    super.onInit();
  }
}
