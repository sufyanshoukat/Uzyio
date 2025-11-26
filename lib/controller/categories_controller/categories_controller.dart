import 'dart:async';
import 'dart:convert';
import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter_file_downloader/flutter_file_downloader.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:uzyio/constants/app_colors.dart';
import 'package:uzyio/constants/end_points.dart';
import 'package:uzyio/constants/loading_animation.dart';
import 'package:uzyio/core/bindings/bindings.dart';
import 'package:uzyio/core/common/global_instance.dart';
import 'package:uzyio/model/categories/categoies_list_model.dart';
import 'package:uzyio/model/categories/category_template_model.dart';
import 'package:uzyio/model/categories/see_all_template_model.dart';
import 'package:uzyio/model/categories/single_template_mode.dart';
import 'package:uzyio/view/screens/generate_content/generated_style.dart';

class CategoriesController extends GetxController {
  // Slider
  final PageController pageController = PageController();
  final RxInt currentPage = 0.obs;
  Timer? autoScrollTimer;

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

  Rxn<String> pickedImageFile = Rxn<String>();
  TextEditingController promtController = TextEditingController();
  Rxn<String> endPoint = Rxn<String>();

  var downloadProgress = 0.0.obs;

  List<TemplateData> sliderList = <TemplateData>[];
  RxBool isSliderLoading = false.obs;

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

  // CREATE VIDEO
  // Future<void> createVideo({
  //   required String endPoint,
  //   required String image,
  //   required String prompt,
  // }) async {
  //   try {
  //     Map<String, dynamic> body = {'endpoint': "", 'image': "", 'prompt': ""};

  //     final response = await apiService.post(
  //       createVideoURL,
  //       body,
  //       true,
  //       showResult: true,
  //       successCode: 200,
  //     );

  //     clearFields();

  //     log("✅ Create Post API Sucssfully hit: ");
  //   } catch (e) {
  //     log("❌ Error occurs while hiting Create-Video Post API: $e");
  //   }
  // }

  // Future<void> createVideo({
  //   String? endPoint,
  //   String? imagePath,
  //   required String prompt,
  // }) async {
  //   try {
  //     log("Create-Video Hit");
  //     var uri = Uri.parse(createVideoURL);

  //     var request = http.MultipartRequest("POST", uri);

  //     // 📝 Add form fields
  //     request.fields['endpoint'] = endPoint!;
  //     request.fields['prompt'] = prompt;

  //     // 📷 Add image file
  //     request.files.add(await http.MultipartFile.fromPath('image', imagePath!));

  //     // (Optional) Header if needed
  //     request.headers.addAll({
  //       "Accept": "application/json",
  //       // "Authorization": "Bearer token"
  //     });

  //     var streamedResponse = await request.send();
  //     var response = await http.Response.fromStream(streamedResponse);

  //     if (response.statusCode == 200) {
  //       log("✅ Create Video API Success: ${response.body}");
  //     } else {
  //       log("❌ API Error: ${response.statusCode} — ${response.body}");
  //     }
  //   } catch (e) {
  //     log("❌ Error while hitting Create-Video API: $e");
  //   }
  // }

  Future<void> createVideo({
    required String endPoint,
    required String image,
    required String prompt,
  }) async {
    try {
      showVideoGenerationLoadingDialog();
      // Create FormData request
      var request = http.MultipartRequest('POST', Uri.parse(createVideoURL));

      // Add form fields
      request.fields['endpoint'] = endPoint;
      request.fields['prompt'] = prompt;

      // Add image file with proper content type
      if (image.isNotEmpty) {
        // Get file extension to determine MIME type
        String extension = image.split('.').last.toLowerCase();
        String mimeType;

        switch (extension) {
          case 'jpg':
          case 'jpeg':
            mimeType = 'image/jpeg';
            break;
          case 'png':
            mimeType = 'image/png';
            break;
          case 'gif':
            mimeType = 'image/gif';
            break;
          case 'webp':
            mimeType = 'image/webp';
            break;
          default:
            mimeType = 'image/jpeg'; // Default fallback
        }

        request.files.add(
          await http.MultipartFile.fromPath(
            'image',
            image,
            contentType: http.MediaType.parse(
              mimeType,
            ), // Explicitly set MIME type
          ),
        );
      }

      // Add authorization header if needed
      // request.headers['Authorization'] = 'Bearer YOUR_TOKEN';

      log("📤 Sending request to: ${request.url}");
      log("📤 Fields: ${request.fields}");
      log("📤 Image path: $image");

      // Send request
      var streamedResponse = await request.send();
      var response = await http.Response.fromStream(streamedResponse);

      log("📥 Status Code: ${response.statusCode}");
      log("📥 Response: ${response.body}");

      if (response.statusCode == 200) {
        final jsonResponse = json.decode(response.body);
        String signedUrl = jsonResponse['data']['video']['signedUrl'] ?? '';
        log("✅ Video URL: $signedUrl");

        log("✅ Create Video API Successfully hit");
        hideLoadingDialog();
        clearFields();
        Get.to(
          () => GeneratedStylePage(videoUrl: signedUrl),
          binding: VideoBindings(),
        );
      } else {
        log("❌ API Error: ${response.statusCode} - ${response.body}");
      }

      hideLoadingDialog();
    } catch (e) {
      hideLoadingDialog();
      log("❌ Error while hitting Create-Video API: $e");
    }
  }

  // CLEAR FIELDS
  void clearFields() {
    promtController.clear();
    endPoint.value = null;
    pickedImageFile.value = null;
  }

  // // DOWNLOAD VIDEO
  // Future<void> downloadVideo(String videoUrl) async {
  //   try {
  //     // Request permission
  //     var status = await Permission.storage.request();
  //     if (!status.isGranted) {
  //       print("Storage permission denied");
  //       return;
  //     }

  //     // Get Downloads directory
  //     Directory? directory;

  //     if (Platform.isAndroid) {
  //       directory = Directory("/storage/emulated/0/Download");
  //     } else {
  //       print("iOS doesn't support direct Downloads folder saving");
  //       return;
  //     }

  //     if (!directory.existsSync()) {
  //       directory.createSync(recursive: true);
  //     }
  //     showLoadingDialog();

  //     // Create file path
  //     String fileName = "video_${DateTime.now().millisecondsSinceEpoch}.mp4";
  //     File file = File("${directory.path}/$fileName");

  //     // Download bytes
  //     final response = await http.get(Uri.parse(videoUrl));

  //     if (response.statusCode == 200) {
  //       await file.writeAsBytes(response.bodyBytes);
  //       print("✅ Video downloaded successfully: ${file.path}");

  //       Get.snackbar(
  //         "Success",
  //         "Video saved to Downloads",
  //         backgroundColor: Colors.green,
  //         colorText: Colors.white,
  //       );
  //     } else {
  //       print("❌ Failed to download video: ${response.statusCode}");
  //     }

  //     hideLoadingDialog();
  //   } catch (e) {
  //     hideLoadingDialog();
  //     print("❌ Error: $e");
  //   }
  // }

  Future<void> downloadVideo(String videoUrl) async {
    log("Function Hit");
    // showDownloadProgressDialog();

    FileDownloader.downloadFile(
      url: videoUrl,
      name: "video_${DateTime.now().millisecondsSinceEpoch}.mp4",
      onProgress: (name, progress) {
        log("Downloading: $progress%");
      },
      onDownloadCompleted: (path) {
        // hideLoadingDialog();
        log("✅ File downloaded to: $path");

        Get.snackbar(
          "Success",
          "Video downloaded successfully",
          backgroundColor: Colors.green,
          colorText: Colors.white,
        );
      },
      onDownloadError: (error) {
        // hideLoadingDialog();
        log("❌ Download error: $error");
      },
    );
  }

  void showDownloadProgressDialog() {
    Get.dialog(
      Dialog(
        backgroundColor: kDarkGrey1Color,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        child: Container(
          padding: EdgeInsets.all(24),
          child: Obx(() {
            return Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                // Progress Indicator
                CircularProgressIndicator(
                  value: downloadProgress.value / 100,
                  color: kSecondaryColor,
                  strokeWidth: 5,
                ),

                SizedBox(height: 20),

                // Progress Text %
                Text(
                  "${downloadProgress.value.toStringAsFixed(0)}%",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: kWhiteColor,
                  ),
                ),

                SizedBox(height: 12),

                // Label
                Text(
                  "Downloading video...\nPlease wait",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.w500,
                    color: kWhiteColor,
                  ),
                ),
              ],
            );
          }),
        ),
      ),
      barrierDismissible: false,
    );
  }

  // GET SLIDER

  Future<void> getSlider() async {
    try {
      isSliderLoading(true);

      final response = await apiService.get(
        getSliderURL,
        false,
        showResult: false,
        successCode: 200,
      );

      if (response != null) {
        SliderResponse sliderData = SliderResponse.fromJson(response);

        sliderList.clear();
        sliderList.addAll(sliderData.sliders);

        log("Sliders loaded: ${sliderList.length}");
      }
      isSliderLoading(false);
    } catch (e) {
      isSliderLoading(false);
      log("❌ Error: $e");
    } finally {
      isSliderLoading(false);
    }
  }

  void _startAutoScroll() {
    autoScrollTimer = Timer.periodic(const Duration(seconds: 3), (timer) {
      if (sliderList.isNotEmpty) {
        final nextPage = (currentPage.value + 1) % sliderList.length;
        pageController.animateToPage(
          nextPage,
          duration: const Duration(milliseconds: 400),
          curve: Curves.easeInOut,
        );
      }
    });
  }

  // ON INIT LOADS
  @override
  void onInit() async {
    super.onInit();
    await getListCategories();
    await getTemplateCategories(categoryID: "$initialCategoryID");
    await getSlider();
    _startAutoScroll();
  }

  @override
  void onClose() {
    autoScrollTimer?.cancel();
    pageController.dispose();
    super.onClose();
  }
}
