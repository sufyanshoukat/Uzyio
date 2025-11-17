import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:uzyio/constants/app_colors.dart';
import 'package:uzyio/constants/app_images.dart';
import 'package:uzyio/constants/app_sizes.dart';
import 'package:uzyio/constants/app_styling.dart';
import 'package:uzyio/view/widget/common_image_view_widget.dart';
import 'package:uzyio/view/widget/general_appbar.dart';
import 'package:uzyio/view/widget/my_text_widget.dart';

class FAQsPage extends StatefulWidget {
  const FAQsPage({super.key});

  @override
  State<FAQsPage> createState() => _FAQsPageState();
}

class _FAQsPageState extends State<FAQsPage> {
  List<FaqsModel> listOFFaqs = [
    FaqsModel(
      question: "How to add wallet",
      answer:
          "Lorem ipsum dolor sit amet consectetur. Aliquam in nascetur non arcu nam pellentesque. Id lectus nibh viverra purus dignissim amet. Urna volutpat eget est lectus gravida mus eu eget.",
    ),
    FaqsModel(
      question: "How to delete my wallet",
      answer:
          "Lorem ipsum dolor sit amet consectetur. Aliquam in nascetur non arcu nam pellentesque. Id lectus nibh viverra purus dignissim amet. Urna volutpat eget est lectus gravida mus eu eget.",
    ),
    FaqsModel(
      question: "How to change password",
      answer:
          "Lorem ipsum dolor sit amet consectetur. Aliquam in nascetur non arcu nam pellentesque. Id lectus nibh viverra purus dignissim amet. Urna volutpat eget est lectus gravida mus eu eget.",
    ),
    FaqsModel(
      question: "How to edit personal info",
      answer:
          "Lorem ipsum dolor sit amet consectetur. Aliquam in nascetur non arcu nam pellentesque. Id lectus nibh viverra purus dignissim amet. Urna volutpat eget est lectus gravida mus eu eget.",
    ),
    FaqsModel(
      question: "How to set spend limit",
      answer:
          "Lorem ipsum dolor sit amet consectetur. Aliquam in nascetur non arcu nam pellentesque. Id lectus nibh viverra purus dignissim amet. Urna volutpat eget est lectus gravida mus eu eget.",
    ),
    FaqsModel(
      question: "How to add wallet",
      answer:
          "Lorem ipsum dolor sit amet consectetur. Aliquam in nascetur non arcu nam pellentesque. Id lectus nibh viverra purus dignissim amet. Urna volutpat eget est lectus gravida mus eu eget.",
    ),
  ];

  List<FaqsQuickModel> quickFaqsItems = [
    FaqsQuickModel(
      question: "Questions about",
      answer: "Getting Started",
      icon: Assets.imagesFaqsNotificationIcon,
      color: Color(0xff103E63),
    ),
    FaqsQuickModel(
      question: "Questions about",
      answer: "How to Invest",

      icon: Assets.imagesFaqsSettingIcon,
      color: Color(0xff2A4037),
    ),
    FaqsQuickModel(
      question: "Questions about",
      answer: "Payment Meth…",
      icon: Assets.imagesFaqsDollarsIcon,
      color: Color(0xff490517),
    ),
  ];

  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: AppStyling().background(image: Assets.imagesBkImage),
      child: Scaffold(
        backgroundColor: kTransperentColor,
        appBar: GeneralAppBar2(title: "FAQs"),
        body: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          padding: AppSizes.VERTICAL,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // ----- Quick Cards ----------
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                physics: BouncingScrollPhysics(),
                child: Row(
                  children: List.generate(
                    3,
                    (index) => Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: 10,
                        vertical: 13,
                      ),
                      margin: EdgeInsets.only(left: (index == 0) ? 20 : 10),
                      height: 116,
                      width: 144,
                      decoration: AppStyling().myDecoration(
                        color: quickFaqsItems[index].color,
                        borderColor: kTransperentColor,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CommonImageView(svgPath: quickFaqsItems[index].icon),
                          Spacer(),

                          MyText(
                            text: quickFaqsItems[index].question,
                            size: 14,
                            weight: FontWeight.w400,
                          ),
                          MyText(
                            text: quickFaqsItems[index].answer,
                            size: 14,
                            weight: FontWeight.w600,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 20),

              // ----- Faqs Cards ----------
              Padding(
                padding: AppSizes.HORIZONTAL,
                child: Column(
                  children: List.generate(listOFFaqs.length, (index) {
                    return Column(
                      children: [
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
                              selectedIndex = index;
                              setState(() {});
                            },
                            child: Row(
                              children: [
                                Expanded(
                                  child: MyText(
                                    text: listOFFaqs[index].question,
                                    size: 14,
                                    weight: FontWeight.w600,
                                  ),
                                ),
                                (selectedIndex == index)
                                    ? Icon(
                                      Icons.keyboard_arrow_down_rounded,
                                      color: kWhiteColor,
                                    )
                                    : Icon(
                                      Icons.keyboard_arrow_up_rounded,
                                      color: kWhiteColor,
                                    ),
                              ],
                            ),
                          ),
                        ),

                        Visibility(
                          visible: (selectedIndex == index) ? true : false,
                          child: Container(
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
                            child: MyText(
                              text: listOFFaqs[index].answer,
                              size: 12,
                              weight: FontWeight.w400,
                            ),
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
    );
  }
}

class FaqsModel {
  String question, answer;

  FaqsModel({required this.question, required this.answer});
}

class FaqsQuickModel {
  String question, answer, icon;
  Color color;

  FaqsQuickModel({
    required this.question,
    required this.answer,
    required this.icon,
    required this.color,
  });
}
