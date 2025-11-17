import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:uzyio/constants/app_colors.dart';
import 'package:uzyio/constants/app_images.dart';
import 'package:uzyio/constants/app_sizes.dart';
import 'package:uzyio/constants/app_styling.dart';
import 'package:uzyio/view/screens/settings/b_sheet.dart';
import 'package:uzyio/view/screens/settings/setting.dart';
import 'package:uzyio/view/widget/general_appbar.dart';

class AppPreferencesPage extends StatefulWidget {
  const AppPreferencesPage({super.key});

  @override
  State<AppPreferencesPage> createState() => _AppPreferencesPageState();
}

class _AppPreferencesPageState extends State<AppPreferencesPage> {
  List<SettingModel> items = [
    SettingModel(icon: Assets.imagesSA, title: "Notifications"),
    // SettingModel(icon: Assets.imagesSB, title: "Theme"),
    SettingModel(icon: Assets.imagesSC, title: "Language"),
    SettingModel(icon: Assets.imagesSD, title: "Email Alerts"),
  ];
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: AppStyling().background(image: Assets.imagesBkImage),
      child: Scaffold(
        backgroundColor: kTransperentColor,

        // ----- App Bar ------
        appBar: GeneralAppBar2(title: "App Preferences"),
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
                      Get.bottomSheet(NotificationBSheet());

                      break;
                    case 1:
                      Get.bottomSheet(LangugaesBS());
                      break;
                    default:
                      Get.bottomSheet(EmailAlertsBSHeet());
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
