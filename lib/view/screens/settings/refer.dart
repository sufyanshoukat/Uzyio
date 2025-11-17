import 'package:flutter/material.dart';
import 'package:uzyio/constants/app_colors.dart';
import 'package:uzyio/constants/app_images.dart';
import 'package:uzyio/constants/app_sizes.dart';
import 'package:uzyio/constants/app_styling.dart';
import 'package:uzyio/view/widget/common_image_view_widget.dart';
import 'package:uzyio/view/widget/custom_textfield.dart';
import 'package:uzyio/view/widget/general_appbar.dart';
import 'package:uzyio/view/widget/my_round_button.dart';
import 'package:uzyio/view/widget/my_text_widget.dart';

class ReferPage extends StatefulWidget {
  const ReferPage({super.key});

  @override
  State<ReferPage> createState() => _ReferPageState();
}

class _ReferPageState extends State<ReferPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: AppStyling().background(image: Assets.imagesBkImage),
      child: Scaffold(
        backgroundColor: kTransperentColor,
        appBar: GeneralAppBar2(title: "Refer & Earn"),
        body: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          padding: AppSizes.DEFAULT,
          child: Column(
            children: [
              // ----- Profile Image -----
              CommonImageView(svgPath: Assets.imagesReferIconS),

              MyText(
                paddingTop: 20,
                text: "Refer a friend",
                size: 24,
                weight: FontWeight.w800,
              ),
              MyText(
                paddingTop: 5,
                paddingBottom: 30,
                textAlign: TextAlign.center,
                text:
                    "Share your code with 4 friends. When they use it for the first login, you and your friends earn \$10.00",
                size: 14,
                weight: FontWeight.w400,
              ),

              // ------ Text Filed  ------
              Row(
                children: [
                  Expanded(
                    child: CustomTextField(
                      controller: TextEditingController(text: "AHDJAEL2021RV1"),
                    ),
                  ),
                  SizedBox(width: 10),

                  MyRoundButton(
                    onTap: () {},
                    color: kSecondaryColor,
                    isShapeRound: false,
                    height: 46,
                    width: 55,
                    child: CommonImageView(svgPath: Assets.imagesCopyIconS),
                  ),
                ],
              ),
              SizedBox(height: 20),

              // ------ OR  ------
              CommonImageView(svgPath: Assets.imagesOrSvgIcon),
              SizedBox(height: 24),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: List.generate(4, (index) {
                  List<String> items = [
                    Assets.imagesFIconS,
                    Assets.imagesGIconS,
                    Assets.imagesXIconS,
                    Assets.imagesInstIconS,
                  ];
                  return MyRoundButton(
                    onTap: () {},

                    color: kTransperentColor,
                    splashRadius: 10,
                    splashColor: kTertiaryColor,
                    borderColor: kWhiteColor.withValues(alpha: 0.5),
                    isShapeRound: false,
                    height: 46,
                    width: 55,
                    child: CommonImageView(svgPath: items[index]),
                  );
                }),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
