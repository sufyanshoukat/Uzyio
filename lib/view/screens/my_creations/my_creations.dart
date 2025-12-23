import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:uzyio/constants/app_colors.dart';
import 'package:uzyio/constants/app_images.dart';
import 'package:uzyio/constants/app_sizes.dart';
import 'package:uzyio/constants/app_styling.dart';
import 'package:uzyio/constants/loading_animation.dart';
import 'package:uzyio/controller/my_creation/my_creation_controller.dart';
import 'package:uzyio/view/widget/general_appbar.dart';
import 'package:uzyio/view/widget/home_page_widgets.dart';
import 'package:uzyio/view/widget/my_text_widget.dart';

class MyCreationPage extends StatefulWidget {
  const MyCreationPage({super.key});

  @override
  State<MyCreationPage> createState() => _MyCreationPageState();
}

class _MyCreationPageState extends State<MyCreationPage> {
  // List<String> tabItems = [
  //   "Image Generations",
  //   "Video Generations",
  //   "Text to Image",
  // ];
  // int selectedIndex = 0;

  final _ctrl = Get.find<MyCreationController>();

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Container(
        decoration: AppStyling().background(image: Assets.imagesBkImage),
        child: Scaffold(
          backgroundColor: kTransperentColor,
          appBar: GeneralAppBar2(title: "My Creations"),
          body:
              (_ctrl.myCreation.isNotEmpty && _ctrl.isLoading.value == false)
                  ? Padding(
                    padding: AppSizes.DEFAULT,
                    child: GridView.builder(
                      itemCount: _ctrl.myCreation.length,

                      physics: BouncingScrollPhysics(),
                      padding: EdgeInsets.zero,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        mainAxisSpacing: 10,
                        crossAxisSpacing: 10,
                        mainAxisExtent: 260,
                      ),
                      itemBuilder: (context, index) {
                        final model = _ctrl.myCreation[index];

                        return TemplateCard(
                          isVideo: true,
                          height: 260,
                          width: Get.width,
                          URL: "${model.file}",

                          // profileName: "${model.title}",
                          // isProCard:
                          onTap: () async {
                            log("${model.file}");
                            // await _ctrl.getSingleTemplate(
                            //   templateID:
                            //       "${_ctrl.getSeeAllTempleteCategoryModel.value!.categories!.templates[index].id}",
                            // );
                            // String? url = model.coverImage;

                            // if (url != null) {
                            //   Get.to(
                            //     () => DisplayContentPage(
                            //       videoUrl: url,
                            //       isVideo: model.isVideo as bool,
                            //     ),
                            //     binding: VideoBindings(),
                            //   );
                            // }
                          },
                        );
                      },
                    ),
                  )
                  : (_ctrl.isLoading.value)
                  ? Center(child: WaveLoading(size: 40))
                  : Center(
                    child: MyText(
                      text: "My Creation Not Found!",
                      color: kWhiteColor,
                    ),
                  ),
        ),
      ),
    );
  }
}

class _CategorieButton extends StatelessWidget {
  final bool isSeleted;
  final String title;
  final VoidCallback onTap;

  const _CategorieButton({
    super.key,
    this.isSeleted = true,
    required this.title,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        padding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        duration: Duration(milliseconds: 800),
        curve: Curves.easeOut,

        // transformAlignment: Alignment.topCenter,
        margin: EdgeInsets.only(right: 10),
        decoration: AppStyling().myDecoration(
          borderColor: kTransperentColor,
          color: (isSeleted) ? kWhiteColor : kBlackColor,
          radius: 100,
        ),

        child: Row(
          children: [
            MyText(
              text: title,
              size: 14,
              weight: FontWeight.w600,
              color: (isSeleted) ? kBlackColor : kWhiteColor,
            ),
          ],
        ),
      ),
    );
  }
}
