import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:uzyio/constants/app_colors.dart';
import 'package:uzyio/constants/app_images.dart';
import 'package:uzyio/constants/app_sizes.dart';
import 'package:uzyio/constants/app_styling.dart';
import 'package:uzyio/view/screens/settings/about_us.dart';
import 'package:uzyio/view/screens/settings/app_preferences.dart';
import 'package:uzyio/view/screens/settings/faqs.dart';
import 'package:uzyio/view/screens/settings/privacy_policy.dart';
import 'package:uzyio/view/screens/settings/reports.dart';
import 'package:uzyio/view/screens/support/support.dart';
import 'package:uzyio/view/widget/common_image_view_widget.dart';
import 'package:uzyio/view/widget/general_appbar.dart';
import 'package:uzyio/view/widget/my_ripple_effect.dart';
import 'package:uzyio/view/widget/my_text_widget.dart';

class Settings extends StatefulWidget {
  const Settings({super.key});

  @override
  State<Settings> createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  List<SettingModel> items = [
    SettingModel(icon: Assets.imagesSA, title: "App preferences"),
    // SettingModel(icon: Assets.imagesSC, title: "Permissions"),
    SettingModel(icon: Assets.imagesSD, title: "FAQ"),

    SettingModel(icon: Assets.imagesSE, title: "Contact support"),
    SettingModel(icon: Assets.imagesSB, title: "Privacy Policy"),
    SettingModel(icon: Assets.imagesSB, title: "About Us"),
    SettingModel(icon: Assets.imagesSF, title: "Report"),

    SettingModel(icon: Assets.imagesSG, title: "Delete account"),
    SettingModel(icon: Assets.imagesSH, title: "Log Out"),
  ];
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: AppStyling().background(image: Assets.imagesBkImage),
      child: Scaffold(
        backgroundColor: kTransperentColor,

        // ----- App Bar ------
        appBar: GeneralAppBar2(title: "Settings & Support"),
        body: Padding(
          padding: AppSizes.DEFAULT,

          // ---- Setting Buttons -----
          child: Column(
            children: List.generate(items.length, (index) {
              return
              // ----- Bar Buttons ------
              BarButton(
                icon: items[index].icon,
                title: items[index].title,
                onTap: () {
                  switch (index) {
                    case 0:
                      Get.to(() => AppPreferencesPage());
                      break;
                    case 1:
                      Get.to(() => FAQsPage());
                      break;
                    case 2:
                      Get.to(() => SupportPage());
                      break;
                    case 3:
                      Get.to(() => PrivacyPolicyPage());
                      break;
                    case 4:
                      Get.to(() => AboutUsPage());
                      break;
                    case 5:
                      Get.to(() => AboutUsPage());
                      break;
                    case 6:
                      Get.to(() => ReportPage());
                      break;
                    case 7:
                      break;
                  }
                },
              );
            }),
          ),
        ),
      ),
    );
  }
}

class BarButton extends StatelessWidget {
  final VoidCallback onTap;
  final String title, icon;
  const BarButton({
    super.key,
    required this.onTap,
    required this.icon,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return MyRippleEffect(
      onTap: onTap,
      splashColor: kWhiteColor.withValues(alpha: 0.1),
      child: Padding(
        padding: EdgeInsets.only(bottom: 10),
        child: SizedBox(
          height: 50,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  CommonImageView(svgPath: icon),
                  Expanded(
                    child: MyText(
                      paddingLeft: 10,
                      text: title,
                      size: 14,
                      weight: FontWeight.w400,
                    ),
                  ),
                  Icon(
                    Icons.arrow_forward_ios_rounded,
                    color: kWhiteColor,
                    size: 15,
                  ),
                ],
              ),

              Divider(thickness: 1, color: kWhiteColor),
            ],
          ),
        ),
      ),
    );
  }
}

class SettingModel {
  String icon;
  String title;

  SettingModel({required this.icon, required this.title});
}
