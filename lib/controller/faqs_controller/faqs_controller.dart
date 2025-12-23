import 'dart:developer';
import 'package:get/get.dart';
import 'package:uzyio/constants/end_points.dart';
import 'package:uzyio/constants/loading_animation.dart';
import 'package:uzyio/core/common/global_instance.dart';
import 'package:uzyio/model/faqs/faqs_categories_model.dart';
import 'package:uzyio/model/faqs/faqs_model.dart';

class FaqsController extends GetxController {
  RxList<Category> faqsCategories = <Category>[].obs;
  RxBool isHeadLoading = false.obs;
  RxInt currentHeadIndex = 0.obs;

  RxList<Faq> faqs = <Faq>[].obs;
  RxBool isBottomLoading = false.obs;
  RxInt currentQAIndex = 0.obs;

  Future<void> getFaqsHead() async {
    try {
      isHeadLoading(true);
      faqsCategories.clear();
      final response = await apiService.get(
        getFaqsCategoriesURL,
        true,
        showResult: false,
        successCode: 200,
      );

      if (response != null) {
        var body = response["categories"];
        for (var i in body) {
          var item = Category.fromJson(i);
          faqsCategories.add(item);
        }
      }

      isHeadLoading(false);

      log("✅ FAQs-Categories Items List: ${faqsCategories.length}");
    } catch (e) {
      isHeadLoading(false);
      log("❌ Error while fetching FAQs-Categories Items Data: $e");
    }
  }

  Future<void> getFaqsQA(id) async {
    try {
      String cID = id;

      if (cID.isEmpty) {
        return displayToast(msg: 'No Faqs Categories Founded');
      }

      isBottomLoading(true);
      faqs.clear();
      final response = await apiService.get(
        getFAQS(cID),
        true,
        showResult: false,
        successCode: 200,
      );

      if (response != null) {
        var body = response["faqs"];
        for (var i in body) {
          var item = Faq.fromJson(i);
          faqs.add(item);
        }
      }

      isBottomLoading(false);

      log("✅ FAQs Items List: ${faqsCategories.length}");
    } catch (e) {
      isBottomLoading(false);
      log("❌ Error while fetching FAQs Items Data: $e");
    }
  }

  @override
  void onInit() async {
    await getFaqsHead();
    await getFaqsQA(faqsCategories[0].id);
    super.onInit();
  }
}
