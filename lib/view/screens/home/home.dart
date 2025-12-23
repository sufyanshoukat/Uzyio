import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:uzyio/constants/app_colors.dart';
import 'package:uzyio/constants/app_images.dart';
import 'package:uzyio/constants/app_sizes.dart';
import 'package:uzyio/constants/app_styling.dart';
import 'package:uzyio/constants/loading_animation.dart';
import 'package:uzyio/controller/categories_controller/categories_controller.dart';
import 'package:uzyio/controller/theme/theme_controller.dart';
import 'package:uzyio/core/bindings/bindings.dart';
import 'package:uzyio/services/user/user_services.dart';
import 'package:uzyio/view/screens/home/display_content.dart';
import 'package:uzyio/view/screens/home/see_all_ai_photo.dart';
import 'package:uzyio/view/screens/my_creations/my_creations.dart';
import 'package:uzyio/view/screens/settings/my_profile.dart';
import 'package:uzyio/view/screens/settings/refer.dart';
import 'package:uzyio/view/screens/settings/setting.dart';
import 'package:uzyio/view/widget/animation_widget.dart';
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

  // List<CategoriesModels> tabItems = [
  //   CategoriesModels(icon: Assets.imagesDiscoverIcon, title: 'Discover'),
  //   CategoriesModels(icon: Assets.imagesMagicIcon, title: 'Create'),
  //   CategoriesModels(icon: Assets.imagesMagicIcon, title: 'New'),
  //   CategoriesModels(icon: Assets.imagesMagicIcon, title: 'New'),
  // ];

  int selectedIndex = 0;

  ThemeController themeController = Get.put(ThemeController());
  CategoriesController _ctrl = Get.put(CategoriesController());

  @override
  Widget build(BuildContext context) {
    log("UserID: ${UserService.instance.userModel.value.id}");
    return Obx(
      () => Container(
        decoration: AppStyling().background(
          image:
              (themeController.isDarkTheme.value)
                  ? Assets.imagesBkImage
                  : Assets.imagesHomeWhiteTheme,
        ),
        child: Scaffold(
          backgroundColor: kTransperentColor,
          key: _scaffoldKey,
          drawer: buildDrawer(),

          // ---- App Bar -----
          appBar: HomeAppBar(
            profileImage: UserService.instance.userModel.value.profile,
            title: "${UserService.instance.userModel.value.name}",
            coins: "${UserService.instance.userModel.value.credits}",

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

                Obx(
                  () =>
                      (_ctrl.categoryList.isNotEmpty && !_ctrl.isLoading.value)
                          ? SingleChildScrollView(
                            physics: BouncingScrollPhysics(),
                            scrollDirection: Axis.horizontal,
                            child: Row(
                              children: List.generate(
                                _ctrl.categoryList.length,
                                (index) {
                                  return Padding(
                                    padding: EdgeInsets.only(
                                      left: (index == 0) ? 20 : 5,
                                    ),
                                    child: CategorieButton(
                                      title: _ctrl.categoryList[index].name,
                                      icon: _ctrl.categoryList[index].image,
                                      isSeleted: selectedIndex == index,
                                      onTap: () {
                                        selectedIndex = index;
                                        _ctrl.getTemplateCategories(
                                          categoryID:
                                              _ctrl.categoryList[index].id,
                                        );
                                        setState(() {});
                                      },
                                    ),
                                  );
                                },
                              ),
                            ),
                          )
                          : (_ctrl.isLoading.value)
                          ? CategoryShimmer()
                          : Align(
                            alignment: Alignment.center,
                            child: MyText(
                              text: "No Categories Available!",
                              color: kWhiteColor,
                            ),
                          ),
                ),

                SizedBox(height: 14),

                // --- SLIDERS ---
                Obx(() {
                  final itemCount =
                      _ctrl.isSliderLoading.value
                          ? 3
                          : (_ctrl.isSliderLoading.value == false &&
                              _ctrl.sliderList.isEmpty)
                          ? 3
                          : _ctrl.sliderList.length;

                  return Column(
                    children: [
                      SizedBox(
                        height: 200, // Adjust based on your TryNowCard height
                        child: PageView.builder(
                          controller: _ctrl.pageController,
                          physics: const BouncingScrollPhysics(),
                          onPageChanged: (index) {
                            _ctrl.currentPage.value = index;
                          },
                          itemCount: itemCount,
                          itemBuilder: (context, index) {
                            if (_ctrl.isSliderLoading.value ||
                                (_ctrl.isSliderLoading.value == false &&
                                    _ctrl.sliderList.isEmpty)) {
                              return const Padding(
                                padding: EdgeInsets.symmetric(horizontal: 8.0),
                                child: TryNowCardShimmer(),
                              );
                            }

                            final item = _ctrl.sliderList[index];
                            return Padding(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 8.0,
                              ),
                              child: TryNowCard(
                                index: index,
                                isVideo: item.isVideo,
                                imageURL: item.coverImage,
                                title: item.title,
                                subTitle: item.prompt,
                                onTap: () async {
                                  await _ctrl.getSingleTemplate(
                                    templateID: _ctrl.sliderList[index].id,
                                  );
                                  String contentURL = item.coverImage;

                                  if (contentURL.isNotEmpty) {
                                    Get.to(
                                      () => DisplayContentPage(
                                        videoUrl: contentURL,
                                        isVideo: item.isVideo,
                                      ),
                                      binding: VideoBindings(),
                                    );
                                  }
                                },
                              ),
                            );
                          },
                        ),
                      ),
                      const SizedBox(height: 12),
                      // Dots Indicator
                      Obx(() {
                        return Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: List.generate(
                            itemCount,
                            (index) => AnimatedContainer(
                              duration: const Duration(milliseconds: 300),
                              margin: const EdgeInsets.symmetric(horizontal: 4),
                              width: _ctrl.currentPage.value == index ? 24 : 8,
                              height: 8,
                              decoration: BoxDecoration(
                                color:
                                    _ctrl.currentPage.value == index
                                        ? kSecondaryColor // Selected dot color
                                        : Colors
                                            .grey
                                            .shade400, // Unselected dot color
                                borderRadius: BorderRadius.circular(4),
                              ),
                            ),
                          ),
                        );
                      }),
                    ],
                  );
                }),

                // --- TEMPLATES LIST ---
                Obx(
                  () =>
                      (_ctrl.categoryList.isNotEmpty &&
                              _ctrl.isTemplateLoading.value == false)
                          ? Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: List.generate(_ctrl.templateList.length, (
                              mainIndex,
                            ) {
                              return Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: AppSizes.HORIZONTAL,
                                    child: SeeAll(
                                      title: _ctrl.templateList[mainIndex].name,
                                      onTap: () {
                                        Get.to(
                                          () => SeeAllAiPhotoPage(
                                            title:
                                                _ctrl
                                                    .templateList[mainIndex]
                                                    .name,
                                            id:
                                                _ctrl
                                                    .templateList[mainIndex]
                                                    .id,
                                          ),
                                        );
                                      },
                                    ),
                                  ),
                                  // Cards
                                  SingleChildScrollView(
                                    physics: BouncingScrollPhysics(),
                                    scrollDirection: Axis.horizontal,
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: List.generate(
                                        _ctrl
                                            .templateList[mainIndex]
                                            .templates
                                            .length,
                                        (index) {
                                          final model =
                                              _ctrl
                                                  .templateList[mainIndex]
                                                  .templates[index];

                                          // _ctrl
                                          // .getSeeAllTempleteCategoryModel
                                          // .value
                                          // ?.categories
                                          // ?.templates[index];

                                          return Padding(
                                            padding: EdgeInsets.only(
                                              left: (index == 0) ? 20 : 15,
                                            ),

                                            child: TemplateCard(
                                              isVideo: model.isVideo,
                                              isProCard: model.isPremium,

                                              URL: model.coverImage,
                                              profileName: model.title,

                                              onTap: () async {
                                                await _ctrl.getSingleTemplate(
                                                  templateID:
                                                      _ctrl
                                                          .templateList[mainIndex]
                                                          .templates[index]
                                                          .id,
                                                );

                                                String? contentURL =
                                                    model.coverImage;

                                                if (contentURL.isNotEmpty) {
                                                  Get.to(
                                                    () => DisplayContentPage(
                                                      videoUrl: contentURL,
                                                      isVideo: model.isVideo,
                                                      // contentURL,
                                                    ),
                                                    binding: VideoBindings(),
                                                  );
                                                }
                                              },
                                            ),

                                            // TemplateCard(
                                            //   isVideo:
                                            //       _ctrl
                                            //               .getSeeAllTempleteCategoryModel
                                            //               .value!
                                            //               .categories!
                                            //               .templates[index]
                                            //               .isVideo
                                            //           as bool,
                                            //   isProCard:
                                            //       _ctrl
                                            //               .getSeeAllTempleteCategoryModel
                                            //               .value!
                                            //               .categories!
                                            //               .templates[index]
                                            //               .isPremium
                                            //           as bool,

                                            //   URL:
                                            //       "${model?.coverImage.toString()}",

                                            //   profileName:
                                            //       "${model?.title.toString()}",

                                            //   onTap: () async {
                                            //     await _ctrl.getSingleTemplate(
                                            //       templateID:
                                            //           _ctrl
                                            //               .templateList[mainIndex]
                                            //               .templates[index]
                                            //               .id,
                                            //     );
                                            //     String? videoURL =
                                            //         _ctrl
                                            //             .singleTemplateData
                                            //             .value
                                            //             ?.videos[0];

                                            //     if (videoURL != null) {
                                            //       Get.to(
                                            //         () => DisplayContentPage(
                                            //           videoUrl: videoURL,
                                            //         ),
                                            //         binding: VideoBindings(),
                                            //       );
                                            //     }
                                            //   },
                                            // ),
                                          );
                                        },
                                      ),
                                    ),
                                  ),
                                ],
                              );
                            }),
                          )
                          // ----- Templates Loading ------
                          : (_ctrl.isTemplateLoading.value)
                          ? Column(
                            children: [
                              SizedBox(height: 60),
                              Align(
                                alignment: Alignment.center,
                                child: WaveLoading(size: 30),
                              ),
                            ],
                          )
                          // ----- No Templates Avalible ------
                          : Column(
                            children: [
                              SizedBox(height: 60),
                              Align(
                                alignment: Alignment.center,
                                child: MyText(
                                  text: "No Templates Avalible!",
                                  color: kWhiteColor,
                                ),
                              ),
                            ],
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
                child: FadeSlideTransition(
                  delay: 300,
                  beginOffset: Offset(-0.5, 0),
                  child: MySearchBar(),
                ),
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

                      child: FadeSlideTransition(
                        delay: 70 + index * 100,
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
                                Get.to(
                                  () => MyCreationPage(),
                                  binding: MyCreationBindings(),
                                );
                                break;
                              case 2:
                                break;
                              case 3:
                                Get.to(() => ReferPage());
                                break;
                              case 4:
                                break;
                              // case 5:
                              //   Get.to(() => Settings(), binding: AuthBindings());
                              //   break;

                              default:
                                log("Updated");
                                Get.to(
                                  () => Settings(),
                                  transition: Transition.rightToLeft,
                                  binding: AuthBindings(),
                                );
                                break;
                            }
                          },
                        ),
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
