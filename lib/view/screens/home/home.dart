import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shimmer/shimmer.dart';
import 'package:uzyio/constants/app_colors.dart';
import 'package:uzyio/constants/app_images.dart';
import 'package:uzyio/constants/app_sizes.dart';
import 'package:uzyio/constants/app_styling.dart';
import 'package:uzyio/constants/loading_animation.dart';
import 'package:uzyio/controller/categories_controller/categories_controller.dart';
import 'package:uzyio/controller/theme/theme_controller.dart';
import 'package:uzyio/core/bindings/bindings.dart';
import 'package:uzyio/view/screens/home/display_content.dart';
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

                // ---- Slider -----------
                // Obx(() {
                //   return SingleChildScrollView(
                //     scrollDirection: Axis.horizontal,
                //     physics: BouncingScrollPhysics(),
                //     child: Row(
                //       children:
                //           _ctrl.isSliderLoading.value
                //               ? List.generate(
                //                 3,
                //                 (_) => const TryNowCardShimmer(),
                //               ) // show shimmer 3 times
                //               : (_ctrl.isSliderLoading.value == false &&
                //                   _ctrl.sliderList.isEmpty)
                //               ? List.generate(
                //                 3,
                //                 (_) => const TryNowCardShimmer(),
                //               )
                //               : List.generate(_ctrl.sliderList.length, (index) {
                //                 final item = _ctrl.sliderList[index];
                //                 return TryNowCard(
                //                   index: index,
                //                   imageURL: item.coverImage,
                //                   title: item.title,
                //                   subTitle: item.prompt,
                //                   onTap: () async {
                //                     await _ctrl.getSingleTemplate(
                //                       templateID: _ctrl.sliderList[index].id,
                //                     );
                //                     String? videoURL =
                //                         _ctrl
                //                             .singleTemplateData
                //                             .value
                //                             ?.videos[0];

                //                     if (videoURL != null) {
                //                       Get.to(
                //                         () => DisplayContentPage(
                //                           videoUrl: videoURL,
                //                         ),
                //                         binding: VideoBindings(),
                //                       );
                //                     }
                //                   },
                //                 );
                //               }),
                //     ),
                //   );
                // }),

                // ------ New Slider --------
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
                                imageURL: item.coverImage,
                                title: item.title,
                                subTitle: item.prompt,
                                onTap: () async {
                                  await _ctrl.getSingleTemplate(
                                    templateID: _ctrl.sliderList[index].id,
                                  );
                                  String? videoURL =
                                      _ctrl.singleTemplateData.value?.videos[0];

                                  if (videoURL != null) {
                                    Get.to(
                                      () => DisplayContentPage(
                                        videoUrl: videoURL,
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

                // ------------------------------------------------
                // ------------------------------------------------
                Obx(
                  () =>
                      // ----- Templates List ------
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
                                          return Padding(
                                            padding: EdgeInsets.only(
                                              left: (index == 0) ? 20 : 15,
                                            ),
                                            child: AiImageCard(
                                              isProCard:
                                                  _ctrl
                                                      .templateList[mainIndex]
                                                      .templates[index]
                                                      .isPremium,
                                              profileImage:
                                                  (index.isEven)
                                                      ? Assets.imagesAiGril1
                                                      : Assets.imagesAiGril2,
                                              aiImageURL:
                                                  // "https://res.cloudinary.com/dxoforyo6/image/upload/v1763619869/templates/covers/u8xgkoe4lnd9m5moe9a0.jpg",
                                                  _ctrl
                                                      .templateList[mainIndex]
                                                      .templates[index]
                                                      .coverImage,
                                              profileName:
                                                  _ctrl
                                                      .templateList[mainIndex]
                                                      .templates[index]
                                                      .title,

                                              onTap: () async {
                                                await _ctrl.getSingleTemplate(
                                                  templateID:
                                                      _ctrl
                                                          .templateList[mainIndex]
                                                          .templates[index]
                                                          .id,
                                                );
                                                String? videoURL =
                                                    _ctrl
                                                        .singleTemplateData
                                                        .value
                                                        ?.videos[0];

                                                if (videoURL != null) {
                                                  Get.to(
                                                    () => DisplayContentPage(
                                                      videoUrl: videoURL,
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
  final VoidCallback onTap;
  final String imageURL, title, subTitle;
  int index;
  TryNowCard({
    super.key,
    required this.onTap,
    required this.index,
    required this.imageURL,
    required this.title,
    required this.subTitle,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: (index == 0) ? 20 : 0, right: 10),
      // padding: AppSizes.HORIZONTAL,
      child: Stack(
        children: [
          Container(
            height: 199,
            // width: Get.width / 1.3,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(7),
              image: DecorationImage(
                image: NetworkImage(imageURL),
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
                              text: title,
                              size: 18,
                              weight: FontWeight.w700,
                            ),
                            // MyText(
                            //   text: subTitle,
                            //   size: 14,
                            //   weight: FontWeight.w400,
                            // ),
                          ],
                        ),
                      ),

                      InkWell(
                        onTap: onTap,
                        child: Container(
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

class TryNowCardShimmer extends StatelessWidget {
  const TryNowCardShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20, right: 10),
      child: Shimmer.fromColors(
        baseColor: Colors.grey.shade400,
        highlightColor: Colors.grey.shade200,
        child: Container(
          height: 199,
          width: Get.width / 1.3,
          decoration: BoxDecoration(
            color: Colors.grey.shade900,
            borderRadius: BorderRadius.circular(7),
          ),
        ),
      ),
    );
  }
}
