import 'package:flutter/material.dart';
import 'package:uzyio/constants/app_colors.dart';
import 'package:uzyio/constants/app_images.dart';
import 'package:uzyio/constants/app_sizes.dart';
import 'package:uzyio/constants/app_styling.dart';
import 'package:uzyio/view/widget/common_image_view_widget.dart';
import 'package:uzyio/view/widget/custom_textfield.dart';
import 'package:uzyio/view/widget/general_appbar.dart';
import 'package:uzyio/view/widget/my_button.dart';
import 'package:uzyio/view/widget/my_text_widget.dart';

class MyProfile extends StatefulWidget {
  const MyProfile({super.key});

  @override
  State<MyProfile> createState() => _MyProfileState();
}

class _MyProfileState extends State<MyProfile> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: AppStyling().background(image: Assets.imagesBkImage),
      child: Scaffold(
        backgroundColor: kTransperentColor,
        appBar: GeneralAppBar2(title: "My Profile"),
        body: Padding(
          padding: AppSizes.DEFAULT,
          child: Column(
            children: [
              // ----- Profile Image -----
              Stack(
                children: [
                  Container(
                    height: 80,
                    width: 80,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage(Assets.imagesProfileDefaultImage),
                      ),
                      borderRadius: BorderRadius.circular(100),
                      border: Border.all(color: kWhiteColor),
                    ),
                  ),

                  Positioned(
                    right: 0,
                    bottom: 0,
                    child: Container(
                      height: 30,
                      width: 30,
                      decoration: AppStyling().myDecoration(
                        color: kWhiteColor,
                        radius: 100,
                      ),
                      child: Center(
                        child: CommonImageView(
                          svgPath: Assets.imagesCameraPerpleIcon,
                        ),
                      ),
                    ),
                  ),
                ],
              ),

              MyText(
                paddingTop: 8,
                text: "Jhone Doe",
                size: 18,
                weight: FontWeight.w800,
              ),
              MyText(
                text: "Jhone@gmail.com",
                size: 14,
                weight: FontWeight.w400,
              ),

              // ------ Text Filed  ------
              CustomTextField(
                top: 34,
                haveTitleText: true,
                labelText: "Full Name",
                controller: TextEditingController(text: "Jhon Doe"),
              ),
              CustomTextField(
                top: 16,
                haveTitleText: true,
                labelText: "Email",
                controller: TextEditingController(text: "Jhone@gmail.com"),
              ),
            ],
          ),
        ),
        bottomNavigationBar: Padding(
          padding: AppSizes.DEFAULT,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              MyButton(mBottom: 30, onTap: () {}, buttonText: "Update"),
            ],
          ),
        ),
      ),
    );
  }
}
