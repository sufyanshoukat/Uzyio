import 'dart:developer';
import 'package:get/get.dart';
import 'package:uzyio/constants/end_points.dart';
import 'package:uzyio/core/common/global_instance.dart';
import 'package:uzyio/model/categories/categoies_list_model.dart';
import 'package:uzyio/model/categories/category_template_model.dart';
import 'package:uzyio/model/categories/see_all_template_model.dart';
import 'package:uzyio/model/categories/single_template_mode.dart';

class CategoriesController extends GetxController {
  RxList<CategoryItem> categoryList = <CategoryItem>[].obs;
  RxBool isLoading = false.obs;
  RxString initialCategoryID = ''.obs;

  RxList<CategoryTemplateItem> templateList = <CategoryTemplateItem>[].obs;
  RxBool isTemplateLoading = false.obs;

  Rxn<TemplateData> singleTemplateData = Rxn<TemplateData>();
  RxBool isVideoLoading = false.obs;

  Rxn<SeeAllTempleteModel> getSeeAllTempleteCategoryModel =
      Rxn<SeeAllTempleteModel>();
  RxBool isSeeAllLoading = false.obs;

  // LIST CATEGORIES

  Future<void> getListCategories() async {
    try {
      isLoading(true);
      final response = await apiService.get(
        getListCategoriesURL,
        false,
        showResult: false,
        successCode: 200,
      );

      if (response != null) {
        CategoryListModel listModel = CategoryListModel.fromJson(response);
        for (var item in listModel.lists) {
          categoryList.add(item);
        }
        if (categoryList.isNotEmpty) {
          initialCategoryID.value = categoryList[0].id;
          log("✅ ✅ ✅ID-------> $initialCategoryID");
        }
      }

      isLoading(false);

      log("✅ List-Categories: ${categoryList.length}");
    } catch (e) {
      isLoading(false);
      log("❌ Error while fetching List-Categories Data: $e");
    }
  }

  // GET TEMPLATE CATEGORIES

  Future<void> getTemplateCategories({required String categoryID}) async {
    try {
      isTemplateLoading(true);
      final response = await apiService.get(
        getTemplateURL(categoryID: categoryID),
        false,
        showResult: false,
        successCode: 200,
      );

      if (response != null) {
        CategoryTemplateModel dataList = CategoryTemplateModel.fromJson(
          response,
        );

        templateList.value = dataList.categories;
        //  categoryTemplateList.addAll();
        //  categoryTemplateList.value.add(item);
        // for (var item in dataList.categories) {

        // }
      }

      isTemplateLoading(false);

      log("✅ Category Template: ${templateList.length}");
    } catch (e) {
      isTemplateLoading(false);
      log("❌ Error while fetching Category Template Data: $e");
    }
  }

  // GET SINGLE TEMPLATE

  Future<void> getSingleTemplate({required String templateID}) async {
    try {
      isVideoLoading(true);

      final response = await apiService.get(
        getSingleTemplateURL(templateID: templateID),
        false,
        showResult: false,
        successCode: 200,
      );

      if (response != null) {
        SingleTemplateModel model = SingleTemplateModel.fromJson(response);

        singleTemplateData.value = model.template;

        log(
          "✅ Single Template Model Fetched: ${singleTemplateData.value?.videos.toString()}",
        );
      }

      isVideoLoading(false);
    } catch (e) {
      isVideoLoading(false);
      log("❌ Error while fetching Single-Template-Model: $e");
    }
  }

  // GET SEE-ALL TEMPLATE CATEGORIES

  Future<void> getSeeAllTemplate({required String categoryID}) async {
    try {
      isSeeAllLoading(true);

      final response = await apiService.get(
        getSeeAllTemplateURL(categoryID: categoryID),
        false,
        showResult: false,
        successCode: 200,
      );

      if (response != null) {
        // Convert to model
        SeeAllTempleteModel data = SeeAllTempleteModel.fromJson(response);

        // Correct way to store
        getSeeAllTempleteCategoryModel.value = data;

        log(
          "✅ Single Template Model Fetched: ${getSeeAllTempleteCategoryModel.value?.categories?.name}",
        );
        // log(
        //   // "➡ Templates Count: ${getSeeAllTempleteCategoryModel.value?.categories?.templates.length}",
        // );
      }

      isSeeAllLoading(false);
    } catch (e) {
      isSeeAllLoading(false);
      log("❌ Error while fetching Single-Template-Model: $e");
    }
  }

  // ON INIT LOADS
  @override
  void onInit() async {
    super.onInit();
    await getListCategories();
    await getTemplateCategories(categoryID: "$initialCategoryID");
  }
}
