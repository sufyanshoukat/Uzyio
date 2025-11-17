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

class SupportPage extends StatefulWidget {
  const SupportPage({super.key});

  @override
  State<SupportPage> createState() => _SupportPageState();
}

class _SupportPageState extends State<SupportPage> {
  int selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: AppStyling().background(image: Assets.imagesBkImage),
      child: Scaffold(
        backgroundColor: kTransperentColor,
        appBar: GeneralAppBar2(title: "Support"),
        body: SingleChildScrollView(
          padding: AppSizes.DEFAULT,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _UserChatBubbel(),
              SizedBox(height: 20),
              _SupportChatBubbel(),
            ],
          ),
        ),
        bottomSheet: Container(
          padding: EdgeInsets.symmetric(horizontal: 20),
          height: 77,
          decoration: AppStyling().myDecoration(
            color: Color(0xff434343),
            radius: 0,
            borderColor: kTransperentColor,
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              MyRoundButton(
                onTap: () {},
                height: 40,
                width: 40,
                child: CommonImageView(
                  height: 30,
                  svgPath: Assets.imagesSupportCameraIconSvg,
                ),
              ),
              SizedBox(width: 10),

              Expanded(
                child: CustomTextField(
                  top: 15,
                  hintText: "Write a comment",
                  hintTextFontColor: kWhiteColor,
                  radius: 100,
                  backgroundColor: kDarkGrey1Color,
                  outlineBorderColor: kTransperentColor,
                  haveSuffixIcon: true,
                  suffixWidget: MyRoundButton(
                    onTap: () {},
                    height: 40,
                    width: 40,
                    child: CommonImageView(
                      height: 30,
                      svgPath: Assets.imagesEmojiSupportIcon,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _UserChatBubbel extends StatelessWidget {
  const _UserChatBubbel({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            CommonImageView(
              height: 48,
              width: 48,
              radius: 100,
              imagePath: Assets.imagesSupportUserOneImage,
            ),
            Expanded(
              child: Container(
                margin: EdgeInsets.only(left: 10, right: 30),
                padding: EdgeInsets.all(16),
                decoration: AppStyling().allFourSideRaius(
                  topLeft: 15,
                  topRight: 15,
                  bottomRight: 15,
                  color: Color(0xff434343),
                ),
                child: MyText(
                  text:
                      "Hi Kitsbase, Let me know you need help and you can ask us any questions.",
                  size: 14,
                  weight: FontWeight.w400,
                  color: kPrimaryColor,
                ),
              ),
            ),
          ],
        ),

        MyText(
          paddingLeft: 80,
          paddingTop: 8,
          text: "08:20 AM",
          size: 14,
          weight: FontWeight.w400,
          color: kPrimaryColor,
        ),
      ],
    );
  }
}

class _SupportChatBubbel extends StatelessWidget {
  const _SupportChatBubbel({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          margin: EdgeInsets.only(left: 90),
          padding: EdgeInsets.all(16),
          decoration: AppStyling().allFourSideRaius(
            topLeft: 15,
            topRight: 15,
            bottomLeft: 15,
            color: Color(0xff490517),
          ),
          child: MyText(
            text: "How to create a FinX Stock account?",
            size: 14,
            weight: FontWeight.w400,
            color: kPrimaryColor,
          ),
        ),
        MyText(
          paddingLeft: 110,
          paddingTop: 8,
          text: "08:20 AM",
          size: 14,
          weight: FontWeight.w400,
          color: kPrimaryColor,
        ),
      ],
    );
  }
}
