import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:uzyio/constants/app_colors.dart';
import 'package:uzyio/constants/app_images.dart';
import 'package:uzyio/constants/app_sizes.dart';
import 'package:uzyio/constants/app_styling.dart';
import 'package:uzyio/controller/theme/theme_controller.dart';
import 'package:uzyio/view/screens/home/see_all_ai_photo.dart';
import 'package:uzyio/view/screens/my_creations/my_creations.dart';

import 'package:uzyio/view/screens/settings/my_profile.dart';
import 'package:uzyio/view/screens/settings/refer.dart';
import 'package:uzyio/view/screens/settings/setting.dart';
import 'package:uzyio/view/widget/common_image_view_widget.dart';
import 'package:uzyio/view/widget/custom_textfield.dart';
import 'package:uzyio/view/widget/general_appbar.dart';
import 'package:uzyio/view/widget/home_page_widgets.dart';
import 'package:uzyio/view/widget/my_round_button.dart';
import 'package:uzyio/view/widget/my_text_widget.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  int selectedDrawerIndex = 100;

  List<DrawerModel> drawerItems = [
    DrawerModel(icon: Assets.imagesDA, text: 'My Profile'),
    DrawerModel(icon: Assets.imagesDB, text: ' My Creations '),
    DrawerModel(icon: Assets.imagesDC, text: 'Add-ons & Upgrades '),
    DrawerModel(icon: Assets.imagesDD, text: 'Rewards'),
    DrawerModel(icon: Assets.imagesDE, text: 'Payments & Plans '),
    DrawerModel(icon: Assets.imagesDF, text: 'Settings & Support '),
  ];

  List<CategoriesModels> tabItems = [
    CategoriesModels(icon: Assets.imagesDiscoverIcon, title: 'Discover'),
    CategoriesModels(icon: Assets.imagesMagicIcon, title: 'Create'),
    CategoriesModels(icon: Assets.imagesMagicIcon, title: 'New'),
    CategoriesModels(icon: Assets.imagesMagicIcon, title: 'New'),
  ];

  int selectedIndex = 0;

  ThemeController controller = Get.put(ThemeController());

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Container(
        decoration: AppStyling().background(
          image:
              (controller.isDarkTheme.value)
                  ? Assets.imagesBkImage
                  : Assets.imagesHomeWhiteTheme,
        ),
        child: Scaffold(
          backgroundColor: kTransperentColor,
          key: _scaffoldKey,
          drawer: buildDrawer(),

          // ---- App Bar -----
          appBar: HomeAppBar(
            onDrawerTap: () {
              _scaffoldKey.currentState?.openDrawer();
            },
          ),

          // ---- Body -----
          body: SingleChildScrollView(
            physics: BouncingScrollPhysics(),
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
                        child: CategorieButton(
                          title: tabItems[index].title,
                          icon: tabItems[index].icon,
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
                SizedBox(height: 14),

                TryNowCard(),

                //  ------ See All -----
                Padding(
                  padding: AppSizes.HORIZONTAL,
                  child: SeeAll(
                    onTap: () {
                      Get.to(
                        () => SeeAllAiPhotoPage(title: "AI Photoshoots Male"),
                      );
                    },
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

                // Community -> See All
                Padding(
                  padding: AppSizes.HORIZONTAL,
                  child: SeeAll(
                    title: "Community",
                    onTap: () {
                      Get.to(() => SeeAllAiPhotoPage(title: "Community"));
                    },
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

                // St. Valentine -> See All
                Padding(
                  padding: AppSizes.HORIZONTAL,
                  child: SeeAll(
                    title: "St. Valentine",
                    onTap: () {
                      Get.to(() => SeeAllAiPhotoPage(title: "St. Valentine"));
                    },
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
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget buildDrawer() {
    return Container(
      decoration: AppStyling().background(image: Assets.imagesDrawerBkImage),
      child: Drawer(
        backgroundColor: kTransperentColor,
        surfaceTintColor: Colors.transparent,
        width: Get.width * 0.85,

        child: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Padding(
                padding: EdgeInsets.only(left: 20, right: 20, top: 30),
                child: MySearchBar(),
              ),

              SingleChildScrollView(
                physics: BouncingScrollPhysics(),
                padding: EdgeInsets.only(top: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: List.generate(
                    drawerItems.length,
                    (index) => Container(
                      height: 55,
                      decoration: AppStyling().myDecoration(
                        color:
                            (selectedDrawerIndex == index)
                                ? kSecondaryColor.withValues(alpha: 0.3)
                                : kTransperentColor,
                        borderColor: kTransperentColor,
                      ),
                      margin: EdgeInsets.only(bottom: 5, left: 10, right: 10),

                      child: DrawerTile(
                        icon: drawerItems[index].icon,
                        title: drawerItems[index].text,
                        isCardSelected:
                            (selectedDrawerIndex == index) ? true : false,

                        paddingBottom: 8,

                        onTap: () {
                          selectedDrawerIndex = index;
                          setState(() {});

                          switch (index) {
                            case 0:
                              Get.to(() => MyProfile());
                              break;
                            case 1:
                              Get.to(() => MyCreationPage());
                              break;
                            case 2:
                              break;
                            case 3:
                              Get.to(() => ReferPage());
                              break;
                            case 4:
                              break;
                            case 5:
                              Get.to(() => Settings());
                              break;

                            default:
                              Get.close(1);
                              // Get.to(
                              //   () => SettingPage(),
                              //   transition: Transition.leftToRightWithFade,
                              // );
                              break;
                          }
                        },
                      ),
                    ),
                  ),
                ),
              ),

              Spacer(),

              Align(
                alignment: Alignment.centerRight,
                child: Padding(
                  padding: EdgeInsets.only(top: 10, right: 20, bottom: 30),
                  child: MyRoundButton(
                    height: 50,
                    width: 50,
                    onTap: () {
                      Get.close(1);
                    },
                    child: Center(
                      child: CommonImageView(
                        svgPath: Assets.imagesDClose,
                        height: 50,
                        width: 50,
                      ),
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

class TryNowCard extends StatelessWidget {
  const TryNowCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: AppSizes.HORIZONTAL,
      child: Stack(
        children: [
          Container(
            height: 199,
            width: Get.width,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(7),
              image: DecorationImage(
                image: AssetImage(Assets.imagesTopImageBk),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Positioned.fill(
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 10, vertical: 20),
              height: 199,
              width: Get.width,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(7),
                gradient: LinearGradient(
                  colors: [
                    kBlackColor.withValues(alpha: 0.2),
                    kBlackColor.withValues(alpha: 0.4),
                  ],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                ),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            MyText(
                              text: "Micro Magic",
                              size: 18,
                              weight: FontWeight.w700,
                            ),
                            MyText(
                              text: "Tiny crew stars your product",
                              size: 14,
                              weight: FontWeight.w400,
                            ),
                          ],
                        ),
                      ),

                      Container(
                        width: 80,
                        height: 30,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(100),
                          gradient: LinearGradient(
                            colors: [Color(0xffBA41AB), Color(0xff7117B9)],
                            begin: Alignment.topLeft,
                            end: Alignment.topRight,
                          ),
                        ),
                        child: Center(
                          child: MyText(
                            text: "Try Now",
                            size: 12,
                            weight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
