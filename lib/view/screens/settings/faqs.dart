import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shimmer/shimmer.dart';
import 'package:uzyio/constants/app_colors.dart';
import 'package:uzyio/constants/app_images.dart';
import 'package:uzyio/constants/app_sizes.dart';
import 'package:uzyio/constants/app_styling.dart';
import 'package:uzyio/controller/faqs_controller/faqs_controller.dart';
import 'package:uzyio/view/widget/common_image_view_widget.dart';
import 'package:uzyio/view/widget/general_appbar.dart';
import 'package:uzyio/view/widget/my_ripple_effect.dart';
import 'package:uzyio/view/widget/my_text_widget.dart';

class FAQsPage extends StatefulWidget {
  const FAQsPage({super.key});

  @override
  State<FAQsPage> createState() => _FAQsPageState();
}

class _FAQsPageState extends State<FAQsPage> {
  final _ctrl = Get.find<FaqsController>();

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: AppStyling().background(image: Assets.imagesBkImage),
      child: Obx(
        () => Scaffold(
          backgroundColor: kTransperentColor,
          appBar: GeneralAppBar2(title: "FAQs"),
          body: SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            padding: AppSizes.VERTICAL,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // ----- Quick Cards ----------
                (_ctrl.isHeadLoading.value == true &&
                        _ctrl.faqsCategories.isEmpty)
                    ? categoriesShimmer()
                    : (_ctrl.isHeadLoading.value == false &&
                        _ctrl.faqsCategories.isEmpty)
                    ? SizedBox()
                    : SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      physics: BouncingScrollPhysics(),
                      child: Row(
                        children: List.generate(_ctrl.faqsCategories.length, (
                          index,
                        ) {
                          var model = _ctrl.faqsCategories[index];

                          return Container(
                            margin: EdgeInsets.only(
                              left: (index == 0) ? 20 : 10,
                            ),
                            height: 116,
                            width: 144,
                            decoration: AppStyling().myDecoration(
                              color:
                                  (index.isEven)
                                      ? Color(0xff490517)
                                      : Color(0xff2A4037),
                              borderColor: kTransperentColor,
                            ),
                            child: MyRippleEffect(
                              onTap: () {
                                _ctrl.currentHeadIndex.value = index;
                              },
                              splashColor: kWhiteColor.withValues(alpha: 0.4),
                              child: Padding(
                                padding: EdgeInsets.symmetric(
                                  horizontal: 10,
                                  vertical: 13,
                                ),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    CommonImageView(
                                      svgNetwork: model.icon,
                                      svgNetworkColor: kPrimaryColor,
                                    ),
                                    Spacer(),

                                    MyText(
                                      text: "${model.name}",
                                      size: 14,
                                      weight: FontWeight.w400,
                                    ),
                                    // MyText(
                                    //   text: quickFaqsItems[index].answer,
                                    //   size: 14,
                                    //   weight: FontWeight.w600,
                                    // ),
                                  ],
                                ),
                              ),
                            ),
                          );
                        }),
                      ),
                    ),
                SizedBox(height: 20),

                // ----- Faqs Cards ----------
                (_ctrl.isBottomLoading.value == true && _ctrl.faqs.isEmpty)
                    ? faqsShimmer()
                    : (_ctrl.isHeadLoading.value == true)
                    ? faqsShimmer()
                    : (_ctrl.faqs.isEmpty)
                    ? MyText(text: "FAQs not found!")
                    : Padding(
                      padding: AppSizes.HORIZONTAL,
                      child: Column(
                        children: List.generate(_ctrl.faqs.length, (index) {
                          final isOpen = _ctrl.currentQAIndex.value == index;

                          return Column(
                            children: [
                              // Question Container
                              Container(
                                margin: EdgeInsets.only(bottom: 10),
                                padding: EdgeInsets.symmetric(
                                  horizontal: 23,
                                  vertical: 18,
                                ),
                                width: Get.width,
                                decoration: AppStyling().myDecoration(
                                  color: Color(0xff2C2C2C),
                                  borderColor: kTransperentColor,
                                ),
                                child: InkWell(
                                  onTap: () {
                                    if (isOpen) {
                                      _ctrl.currentQAIndex.value =
                                          -1; // close if already open
                                    } else {
                                      _ctrl.currentQAIndex.value = index;
                                    }
                                  },
                                  child: Row(
                                    children: [
                                      Expanded(
                                        child: MyText(
                                          text:
                                              _ctrl.faqs[index].question
                                                  .toString(),
                                          size: 14,
                                          weight: FontWeight.w600,
                                        ),
                                      ),
                                      AnimatedRotation(
                                        turns:
                                            isOpen ? 0.5 : 0.0, // rotate arrow
                                        duration: Duration(milliseconds: 300),
                                        child: Icon(
                                          Icons.keyboard_arrow_down_rounded,
                                          color: kWhiteColor,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),

                              // Answer Container with smooth animation
                              AnimatedSize(
                                duration: Duration(milliseconds: 400),
                                curve: Curves.easeInOut,
                                child: Container(
                                  width: Get.width,
                                  padding:
                                      isOpen
                                          ? EdgeInsets.symmetric(
                                            horizontal: 23,
                                            vertical: 18,
                                          )
                                          : EdgeInsets.zero,
                                  margin: EdgeInsets.only(
                                    bottom: isOpen ? 10 : 0,
                                  ),
                                  decoration: AppStyling().myDecoration(
                                    color: Color(0xff2C2C2C),
                                    borderColor: kTransperentColor,
                                  ),
                                  child:
                                      isOpen
                                          ? MyText(
                                            text:
                                                _ctrl.faqs[index].answer
                                                    .toString(),
                                            size: 12,
                                            weight: FontWeight.w400,
                                          )
                                          : SizedBox.shrink(),
                                ),
                              ),
                            ],
                          );
                        }),
                      ),
                    ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

Widget categoriesShimmer() {
  return SingleChildScrollView(
    scrollDirection: Axis.horizontal,
    child: Row(
      children: List.generate(5, (index) {
        return Shimmer.fromColors(
          baseColor: Colors.grey.shade800,
          highlightColor: Colors.grey.shade700,
          child: Container(
            margin: EdgeInsets.only(left: (index == 0) ? 20 : 10),
            height: 116,
            width: 144,
            decoration: BoxDecoration(
              color: Colors.grey.shade900,
              borderRadius: BorderRadius.circular(14),
            ),
          ),
        );
      }),
    ),
  );
}

Widget faqsShimmer() {
  return Column(
    children: List.generate(6, (index) {
      return Column(
        children: [
          Shimmer.fromColors(
            baseColor: Colors.grey.shade800,
            highlightColor: Colors.grey.shade700,
            child: Container(
              height: 50,
              margin: EdgeInsets.only(bottom: 10, left: 20, right: 20),
              padding: EdgeInsets.symmetric(horizontal: 23, vertical: 20),
              width: Get.width,
              decoration: BoxDecoration(
                color: Colors.grey.shade900,
                borderRadius: BorderRadius.circular(10),
              ),
            ),
          ),
        ],
      );
    }),
  );
}
