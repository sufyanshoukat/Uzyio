import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:uzyio/constants/app_colors.dart';
import 'package:uzyio/constants/app_sizes.dart';
import 'package:uzyio/constants/app_styling.dart';
import 'package:uzyio/controller/theme/theme_controller.dart';
import 'package:uzyio/view/widget/iso_switch.dart';
import 'package:uzyio/view/widget/my_ripple_effect.dart';
import 'package:uzyio/view/widget/my_text_widget.dart';

class LangugaesBS extends StatefulWidget {
  const LangugaesBS({super.key});

  @override
  State<LangugaesBS> createState() => _LangugaesBSState();
}

class _LangugaesBSState extends State<LangugaesBS> {
  int selectedLanguageIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: AppStyling().bottomSheetStyle(color: kBlackColor),
      padding: AppSizes.DEFAULT,
      width: Get.width,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          // ----- Bar -------
          ToBar(),

          SizedBox(height: 31),

          // ------ Languages List -------
          ...List.generate(5, (index) {
            List<String> languagesTitle = [
              "English",
              "Bangla",
              "Hindi",
              "Francais",
              "Italiaon",
            ];
            return MyRippleEffect(
              onTap: () {
                selectedLanguageIndex = index;
                setState(() {});
              },
              splashColor: kWhiteColor.withValues(alpha: 0.2),
              child: Container(
                decoration: AppStyling().myDecoration(
                  color:
                      (selectedLanguageIndex == index)
                          ? kWhiteColor.withValues(alpha: 0.1)
                          : kTransperentColor,
                  borderColor: kTransperentColor,
                ),
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                child: Row(
                  children: [
                    Expanded(
                      child: MyText(
                        text: languagesTitle[index],
                        size: 16,
                        weight: FontWeight.w400,
                      ),
                    ),

                    (selectedLanguageIndex == index)
                        ? Icon(
                          Icons.radio_button_checked,
                          color: kTertiaryColor,
                        )
                        : Icon(
                          Icons.circle_outlined,
                          color: kWhiteColor.withValues(alpha: 0.4),
                        ),
                  ],
                ),
              ),
            );
          }),

          SizedBox(height: 30),
        ],
      ),
    );
  }
}

class NotificationBSheet extends StatefulWidget {
  const NotificationBSheet({super.key});

  @override
  State<NotificationBSheet> createState() => _NotificationBSheetState();
}

class _NotificationBSheetState extends State<NotificationBSheet> {
  // bool isValue = true;
  ThemeController controller = Get.put(ThemeController());
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: AppStyling().bottomSheetStyle(color: kBlackColor),
      padding: AppSizes.DEFAULT,
      width: Get.width,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          // ----- Bar -------
          ToBar(),

          SizedBox(height: 31),

          // ------ Languages List -------
          MyRippleEffect(
            onTap: () {},
            splashColor: kWhiteColor.withValues(alpha: 0.2),
            child: Row(
              children: [
                Expanded(
                  child: MyText(
                    text: "Notification",
                    size: 16,
                    weight: FontWeight.w400,
                  ),
                ),

                Obx(
                  () => IosSwitch(
                    value: controller.isDarkTheme.value,
                    activeColor: kTertiaryColor,
                    onChange: (v) {
                      controller.isDarkTheme.value = v!;
                      // isValue = v!;
                      // setState(() {});
                    },
                  ),
                ),
              ],
            ),
          ),

          SizedBox(height: 30),
        ],
      ),
    );
  }
}

// Email Alerts

class EmailAlertsBSHeet extends StatefulWidget {
  const EmailAlertsBSHeet({super.key});

  @override
  State<EmailAlertsBSHeet> createState() => _EmailAlertsBSHeetState();
}

class _EmailAlertsBSHeetState extends State<EmailAlertsBSHeet> {
  bool isValue = true;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: AppStyling().bottomSheetStyle(color: kBlackColor),
      padding: AppSizes.DEFAULT,
      width: Get.width,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          // ----- Bar -------
          ToBar(),

          SizedBox(height: 31),

          // ------ Languages List -------
          MyRippleEffect(
            onTap: () {},
            splashColor: kWhiteColor.withValues(alpha: 0.2),
            child: Row(
              children: [
                Expanded(
                  child: MyText(
                    text: "Email Alerts",
                    size: 16,
                    weight: FontWeight.w400,
                  ),
                ),

                IosSwitch(
                  value: isValue,
                  activeColor: kTertiaryColor,
                  onChange: (v) {
                    isValue = v!;
                    setState(() {});
                  },
                ),
              ],
            ),
          ),

          SizedBox(height: 30),
        ],
      ),
    );
  }
}

class ToBar extends StatelessWidget {
  const ToBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 7,
      width: 70,
      decoration: AppStyling().myDecoration(
        color: kWhiteColor.withValues(alpha: 0.5),
        radius: 100,
      ),
    );
  }
}

// class LangugaesBS extends StatefulWidget {
//   const LangugaesBS({super.key});

//   @override
//   State<LangugaesBS> createState() => _LangugaesBSState();
// }

// class _LangugaesBSState extends State<LangugaesBS> {
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       decoration: AppStyling().bottomSheetStyle(color: kBlackColor),
//       padding: AppSizes.DEFAULT,
//       width: Get.width,
//       child: Column(
//         mainAxisSize: MainAxisSize.min,
//         children: [
//           // ----- Bar -------
//           Container(
//             height: 7,
//             width: 50,
//             decoration: AppStyling().myDecoration(
//               color: kWhiteColor,
//               radius: 100,
//             ),
//           ),

//           SizedBox(height: 31),
//         ],
//       ),
//     );
//   }
// }
