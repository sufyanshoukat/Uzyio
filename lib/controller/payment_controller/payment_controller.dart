import 'dart:developer';
import 'package:get/get.dart';
import 'package:uzyio/constants/end_points.dart';
import 'package:uzyio/constants/loading_animation.dart';
import 'package:uzyio/core/common/global_instance.dart';
import 'package:uzyio/model/reward/reward_coin_model.dart';
import 'package:uzyio/model/subscription/subscription_model.dart';
import 'package:uzyio/model/subscription/subscription_plan_model.dart';
import 'package:uzyio/services/user/user_services.dart';

class PaymentController extends GetxController {
  RxList<SubscriptionCategory> subscriptionCategory =
      <SubscriptionCategory>[].obs;
  RxBool isLoading = false.obs;

  RxList<SubscriptionPlan> subscriptionPlans = <SubscriptionPlan>[].obs;
  RxBool isPlanLoading = false.obs;

  RxInt subscriptionTypeIndex = 0.obs;
  RxList<RewardData> coinsList = <RewardData>[].obs;

  //  ✅✅✅✅✅✅✅✅✅✅✅✅✅✅✅✅✅✅✅✅✅✅✅✅✅✅✅✅✅✅✅✅✅✅✅✅✅✅✅✅✅✅✅✅✅✅✅✅✅✅✅✅✅✅✅✅✅✅✅✅✅✅✅✅

  Future<void> getSubscriptionCategories() async {
    try {
      isLoading(true);
      subscriptionCategory.clear();
      final response = await apiService.get(
        subScriptionCategoryApi,
        true,
        showResult: false,
        successCode: 200,
      );

      if (response != null) {
        var body = response["categories"];
        for (var i in body) {
          var item = SubscriptionCategory.fromJson(i);
          subscriptionCategory.add(item);
        }
      }

      isLoading(false);

      log("✅ Subscription Category Items List: ${subscriptionCategory.length}");
    } catch (e) {
      isLoading(false);
      log("❌ Error while fetching Rewards Items Data: $e");
    }
  }

  Future<void> getSubscriptionPlans({required String id}) async {
    try {
      isPlanLoading(true);
      subscriptionPlans.clear();
      final response = await apiService.get(
        subScriptionPlansApi(scID: id),
        true,
        showResult: false,
        successCode: 200,
      );

      if (response != null) {
        var body = response["plans"];
        for (var i in body) {
          var item = SubscriptionPlan.fromJson(i);
          subscriptionPlans.add(item);
        }
      }

      isPlanLoading(false);

      log("✅ Subscription Plans List: ${subscriptionCategory.length}");
    } catch (e) {
      isPlanLoading(false);
      log("❌ Error while fetching Subscription Plans: $e");
    }
  }

  Future<void> subscribeNowMethod({
    required String subscription_plan_id,
    required String payment_method,
    required String transaction_id,
    required bool auto_renew,
  }) async {
    log("Calling Social SignUp API...");
    showLoadingDialog();

    try {
      Map<String, dynamic> body = {
        "subscription_plan_id": subscription_plan_id,
        "payment_method": payment_method,
        "transaction_id": transaction_id,
        "auto_renew": auto_renew,
      };

      final response = await apiService.post(
        subscribePlanAPI,
        body,
        false,
        showResult: false,
        successCode: 200,
      );

      if (response != null) {
        final body = response['subscription'];
        final message = response['message'];

        if (body != null && body.isNotEmpty) {
          hideLoadingDialog();
          UserService.instance.getUserInformation();

          displayToast(msg: "Message: $message.");
          Get.back();
        }
      }

      hideLoadingDialog();
    } catch (e) {
      hideLoadingDialog();
      log('Error while hitting auth Subscriptions: $e');
    }
  }

  Future<void> onPageLoad() async {
    await getSubscriptionCategories();
    if (subscriptionCategory.isNotEmpty) {
      await getSubscriptionPlans(id: subscriptionCategory[0].id);
    }
  }

  @override
  void onInit() {
    onPageLoad();
    // getSubscriptionCategories();
    // // getRewardFun();
    super.onInit();
  }
}
