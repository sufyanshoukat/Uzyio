import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:uzyio/constants/app_colors.dart';
import 'package:uzyio/constants/app_images.dart';
import 'package:uzyio/constants/app_sizes.dart';
import 'package:uzyio/constants/app_styling.dart';
import 'package:uzyio/constants/loading_animation.dart';
import 'package:uzyio/controller/categories_controller/categories_controller.dart';
import 'package:uzyio/core/bindings/bindings.dart';
import 'package:uzyio/view/screens/home/display_content.dart';
import 'package:uzyio/view/widget/general_appbar.dart';
import 'package:uzyio/view/widget/home_page_widgets.dart';
import 'package:uzyio/view/widget/my_text_widget.dart';

class SeeAllAiPhotoPage extends StatefulWidget {
  String title;
  String id;
  SeeAllAiPhotoPage({super.key, required this.id, required this.title});

  @override
  State<SeeAllAiPhotoPage> createState() => _SeeAllAiPhotoPageState();
}

class _SeeAllAiPhotoPageState extends State<SeeAllAiPhotoPage> {
  int selectedIndex = 0;
  CategoriesController _ctrl = Get.put(CategoriesController());

  @override
  void initState() {
    _ctrl.getSeeAllTemplate(categoryID: widget.id);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: AppStyling().background(image: Assets.imagesBkImage),
      child: Obx(
        () => Scaffold(
          appBar: GeneralAppBar(
            title: widget.title,
            // title: _ctrl.getSeeAllTempleteCategoryModel.value?.categories?.name,
          ),
          backgroundColor: kTransperentColor,
          body:
              (_ctrl.getSeeAllTempleteCategoryModel.value != null &&
                      _ctrl.isSeeAllLoading.value == false)
                  ? Padding(
                    padding: AppSizes.DEFAULT,
                    child: GridView.builder(
                      itemCount:
                          _ctrl
                              .getSeeAllTempleteCategoryModel
                              .value
                              ?.categories
                              ?.templates
                              .length,
                      physics: BouncingScrollPhysics(),
                      padding: EdgeInsets.zero,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        mainAxisSpacing: 10,
                        crossAxisSpacing: 10,
                        mainAxisExtent: 260,
                      ),
                      itemBuilder: (context, index) {
                        return AiImageCard(
                          height: 260,
                          width: Get.width,
                          // profileImage:
                          //     (index.isEven)
                          //         ? Assets.imagesAiGril1
                          //         : Assets.imagesAiGril2,
                          aiImageURL:
                              "${_ctrl.getSeeAllTempleteCategoryModel.value?.categories?.templates[index].coverImage}",
                          profileName:
                              "${_ctrl.getSeeAllTempleteCategoryModel.value?.categories?.templates[index].title}",
                          isProCard:
                              _ctrl
                                      .getSeeAllTempleteCategoryModel
                                      .value!
                                      .categories!
                                      .templates[index]
                                      .isPremium
                                  as bool,

                          onTap: () async {
                            log("SSSSS");

                            await _ctrl.getSingleTemplate(
                              templateID:
                                  "${_ctrl.getSeeAllTempleteCategoryModel.value!.categories!.templates[index].id}",
                            );
                            String? videoURL =
                                _ctrl.singleTemplateData.value?.videos[0];

                            if (videoURL != null) {
                              Get.to(
                                () => DisplayContentPage(videoUrl: videoURL),
                                binding: VideoBindings(),
                              );
                            }
                          },
                        );
                      },
                    ),
                  )
                  : (_ctrl.isSeeAllLoading.value)
                  ? Center(child: WaveLoading(size: 40))
                  : Center(
                    child: MyText(
                      text: "No Categories Avalible!",
                      color: kWhiteColor,
                    ),
                  ),
        ),
      ),
    );
  }
}
