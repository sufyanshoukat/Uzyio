import 'package:flutter/material.dart';
import 'package:uzyio/constants/app_colors.dart';
import 'package:uzyio/constants/app_images.dart';
import 'package:uzyio/constants/app_sizes.dart';
import 'package:uzyio/constants/app_styling.dart';
import 'package:uzyio/view/widget/general_appbar.dart';
import 'package:uzyio/view/widget/home_page_widgets.dart';
import 'package:uzyio/view/widget/my_text_widget.dart';

class MyCreationPage extends StatefulWidget {
  const MyCreationPage({super.key});

  @override
  State<MyCreationPage> createState() => _MyCreationPageState();
}

class _MyCreationPageState extends State<MyCreationPage> {
  List<String> tabItems = [
    "Image Generations",
    "Video Generations",
    "Text to Image",
  ];
  int selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: AppStyling().background(image: Assets.imagesBkImage),
      child: Scaffold(
        backgroundColor: kTransperentColor,
        appBar: GeneralAppBar2(title: "My Creations"),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // ---- Categories Buttons -----
              SizedBox(height: 13),
              SingleChildScrollView(
                physics: BouncingScrollPhysics(),
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: List.generate(tabItems.length, (index) {
                    return Padding(
                      padding: EdgeInsets.only(left: (index == 0) ? 20 : 5),
                      child: _CategorieButton(
                        title: tabItems[index],
                        isSeleted: selectedIndex == index,
                        onTap: () {
                          selectedIndex = index;
                          setState(() {});
                        },
                      ),
                    );
                  }),
                ),
              ),

              // ----------- Other Content ---------------
              Padding(
                padding: AppSizes.HORIZONTAL,
                child: MyText(
                  paddingTop: 28,
                  paddingBottom: 16,
                  text: "Image Generations",
                  size: 18,
                  weight: FontWeight.w700,
                  color: kPrimaryColor,
                ),
              ),

              // Cards
              SingleChildScrollView(
                physics: BouncingScrollPhysics(),
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: List.generate(10, (index) {
                    return Padding(
                      padding: EdgeInsets.only(left: (index == 0) ? 20 : 15),
                      child: AiImageCard(
                        profileImage:
                            (index.isEven)
                                ? Assets.imagesAiGril1
                                : Assets.imagesAiGril2,
                        aiImage:
                            (index.isEven)
                                ? Assets.imagesAiBoy1
                                : Assets.imagesAiBoy2,
                        profileName: (index.isEven) ? "Richman" : "Vishal",
                      ),
                    );
                  }),
                ),
              ),

              Padding(
                padding: AppSizes.HORIZONTAL,
                child: MyText(
                  paddingTop: 28,
                  paddingBottom: 16,
                  text: "Video Generations",
                  size: 18,
                  weight: FontWeight.w700,
                  color: kPrimaryColor,
                ),
              ),

              // Cards
              SingleChildScrollView(
                physics: BouncingScrollPhysics(),
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: List.generate(10, (index) {
                    return Padding(
                      padding: EdgeInsets.only(left: (index == 0) ? 20 : 15),
                      child: AiVideoCard(
                        aiImage:
                            (index.isEven)
                                ? Assets.imagesAiGril1
                                : Assets.imagesAiGril2,
                        title:
                            (index.isEven)
                                ? "The camera slowly turns"
                                : "Visit to the mountains",
                      ),
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
