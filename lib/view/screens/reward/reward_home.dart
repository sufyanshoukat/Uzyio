// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:uzyio/constants/app_colors.dart';
// import 'package:uzyio/constants/app_images.dart';
// import 'package:uzyio/constants/app_sizes.dart';
// import 'package:uzyio/constants/app_styling.dart';
// import 'package:uzyio/controller/reward_controller.dart/reward_contoller.dart';
// import 'package:uzyio/view/screens/reward/reward_detail.dart';
// import 'package:uzyio/view/widget/common_image_view_widget.dart';
// import 'package:uzyio/view/widget/custom_textfield.dart';
// import 'package:uzyio/view/widget/my_text_widget.dart';

// class RewardHomePage extends StatefulWidget {
//   const RewardHomePage({super.key});

//   @override
//   State<RewardHomePage> createState() => _RewardHomePageState();
// }

// class _RewardHomePageState extends State<RewardHomePage> {
//   var ctrl = Get.put(RewardController());

//   @override
//   Widget build(BuildContext context) {
//     return Obx(
//       () => Scaffold(
//         backgroundColor: Colors.black,
//         body: SafeArea(
//           child: SingleChildScrollView(
//             padding: AppSizes.DEFAULT,
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 // DIGITAL REWARD
//                 _DigitalRewardCard(),

//                 // SEARCH
//                 CustomTextField(
//                   top: 24,
//                   bottom: 24,
//                   borderColor: kSecondaryColor,
//                   outlineBorderColor: kSecondaryColor,
//                   backgroundColor: kTransperentColor,
//                   hintTextFontColor: kSecondaryColor,
//                   hintText: "Search digital rewards...",
//                   havePrefixIcon: true,
//                   preffixWidget: SizedBox(
//                     width: 60,
//                     height: 60,
//                     child: Center(
//                       child: CommonImageView(
//                         height: 20,
//                         imagePath: Assets.imagesRHSearch,
//                         imageColor: kSecondaryColor,
//                       ),
//                     ),
//                   ),
//                 ),

//                 // Cards
//                 GridView.builder(
//                   shrinkWrap: true,
//                   itemCount: ctrl.rewards.length,
//                   physics: NeverScrollableScrollPhysics(),
//                   gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//                     crossAxisCount: 2,
//                     mainAxisSpacing: 13,
//                     crossAxisSpacing: 10,
//                     mainAxisExtent: 310,
//                   ),
//                   itemBuilder: (context, index) {
//                     var model = ctrl.rewards[index];
//                     return PremiumCard(
//                       title: model.title.toString(),
//                       subTitle: model.description.toString(),
//                       coins: model.coins.toString(),
//                       type: model.type.toString(),
//                       imageUrl: "${model.images?[0]}",
//                       onTap: () {
//                         Get.to(
//                           () => RewardDetailsPage(),
//                           arguments: {'data': model},
//                         );
//                       },
//                     );
//                   },
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }

// class _DigitalRewardCard extends StatelessWidget {
//   const _DigitalRewardCard({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Row(
//       children: [
//         CommonImageView(width: 48, imagePath: Assets.imagesRHMagicIcon),

//         SizedBox(width: 10),

//         Expanded(
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               MyText(
//                 text: "Digital Rewards",
//                 size: 15,
//                 weight: FontWeight.w500,
//               ),
//               MyText(
//                 text: "Unlock features & premium content",
//                 size: 12,
//                 weight: FontWeight.w500,
//               ),
//             ],
//           ),
//         ),
//         SizedBox(width: 20),

//         Container(
//           height: 30,
//           width: 78,
//           decoration: AppStyling().gradientBK(),
//           child: Row(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               CommonImageView(height: 15, imagePath: Assets.imagesRHCoinsIcon),
//               MyText(
//                 paddingLeft: 5,
//                 text: "470",
//                 size: 12,
//                 weight: FontWeight.w600,
//               ),
//             ],
//           ),
//         ),
//       ],
//     );
//   }
// }

// class PremiumCard extends StatelessWidget {
//   final String imageUrl, type, title, subTitle, coins;
//   final VoidCallback onTap;

//   const PremiumCard({
//     super.key,
//     required this.imageUrl,
//     required this.type,
//     required this.title,
//     required this.subTitle,
//     required this.coins,
//     required this.onTap,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       width: 210,
//       decoration: BoxDecoration(
//         color: const Color(0xff1A1A1A),
//         borderRadius: BorderRadius.circular(12),
//         border: Border.all(color: kPrimaryColor.withValues(alpha: 0.2)),
//       ),
//       child: InkWell(
//         onTap: onTap,
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             // ---------------- IMAGE WITH TAG ----------------
//             Stack(
//               children: [
//                 ClipRRect(
//                   borderRadius: const BorderRadius.only(
//                     topLeft: Radius.circular(13),
//                     topRight: Radius.circular(20),
//                   ),
//                   child: CommonImageView(
//                     radius: 0,
//                     url: imageUrl,
//                     height: 160,
//                     width: double.infinity,
//                     fit: BoxFit.cover,
//                   ),
//                   // Image.network(
//                   //   imageUrl,
//                   //   height: 160,
//                   //   width: double.infinity,
//                   //   fit: BoxFit.cover,
//                   // ),
//                 ),

//                 // "Physical" Tag
//                 Positioned(
//                   right: 10,
//                   top: 10,
//                   child: Container(
//                     padding: const EdgeInsets.symmetric(
//                       horizontal: 8,
//                       vertical: 4,
//                     ),
//                     decoration: BoxDecoration(
//                       color: Colors.black.withOpacity(0.7),
//                       borderRadius: BorderRadius.circular(12),
//                     ),
//                     child: Text(
//                       type,
//                       style: TextStyle(
//                         fontSize: 11,
//                         color: Colors.white,
//                         fontWeight: FontWeight.w500,
//                       ),
//                     ),
//                   ),
//                 ),
//               ],
//             ),

//             // ---------------- TEXT SECTION ----------------
//             Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Padding(
//                   padding: const EdgeInsets.fromLTRB(14, 14, 14, 4),
//                   child: Text(
//                     title,
//                     style: TextStyle(
//                       fontSize: 16,
//                       fontWeight: FontWeight.w600,
//                       color: Colors.white,
//                     ),
//                   ),
//                 ),

//                 Padding(
//                   padding: const EdgeInsets.fromLTRB(14, 0, 14, 12),
//                   child: Text(
//                     subTitle.toString(),
//                     style: TextStyle(
//                       fontSize: 13,
//                       color: Colors.white.withOpacity(0.7),
//                     ),
//                   ),
//                 ),

//                 // ---------------- COINS BADGE ----------------
//                 Padding(
//                   padding: const EdgeInsets.only(left: 14, bottom: 14),
//                   child: Container(
//                     padding: const EdgeInsets.symmetric(
//                       horizontal: 12,
//                       vertical: 6,
//                     ),
//                     decoration: BoxDecoration(
//                       gradient: const LinearGradient(
//                         colors: [Color(0xff00C6FF), Color(0xff7F00FF)],
//                       ),
//                       borderRadius: BorderRadius.circular(14),
//                     ),
//                     child: Text(
//                       "$coins coins",
//                       style: TextStyle(
//                         fontSize: 13,
//                         fontWeight: FontWeight.w600,
//                         color: Colors.white,
//                       ),
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

// ------------------- Animation Screen -------------

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shimmer/shimmer.dart';
import 'package:uzyio/constants/app_colors.dart';
import 'package:uzyio/constants/app_images.dart';
import 'package:uzyio/constants/app_sizes.dart';
import 'package:uzyio/constants/app_styling.dart';
import 'package:uzyio/controller/reward_controller.dart/reward_contoller.dart';
import 'package:uzyio/services/user/user_services.dart';
import 'package:uzyio/view/screens/reward/all_reward_page.dart';
import 'package:uzyio/view/screens/reward/reward_detail.dart';
import 'package:uzyio/view/widget/animation_widget.dart';
import 'package:uzyio/view/widget/common_image_view_widget.dart';
import 'package:uzyio/view/widget/custom_textfield.dart';
import 'package:uzyio/view/widget/my_text_widget.dart';

class RewardHomePage extends StatefulWidget {
  const RewardHomePage({super.key});

  @override
  State<RewardHomePage> createState() => _RewardHomePageState();
}

class _RewardHomePageState extends State<RewardHomePage>
    with SingleTickerProviderStateMixin {
  final ctrl = Get.put(RewardController());

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
        backgroundColor: kBKBlackColor,
        body: SafeArea(
          child: SingleChildScrollView(
            padding: AppSizes.DEFAULT,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // DIGITAL REWARD
                FadeSlideTransition(delay: 100, child: _DigitalRewardCard()),
                SizedBox(height: 20),

                // SEARCH BAR
                FadeSlideTransition(
                  delay: 200,
                  child: Container(
                    padding: EdgeInsets.all(0.5),
                    decoration: AppStyling().gradientBK(),
                    child: CustomTextField(
                      borderColor: kTransperentColor,
                      outlineBorderColor: kTransperentColor,
                      backgroundColor: kBKBlackColor,
                      hintTextFontColor: kWhiteColor,
                      hintText: "Search digital rewards...",
                      havePrefixIcon: true,
                      preffixWidget: SizedBox(
                        width: 60,
                        height: 60,
                        child: Center(
                          child: CommonImageView(
                            height: 20,
                            imagePath: Assets.imagesRHSearch,
                            imageColor: kSecondaryColor,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),

                // REWARD TYPE BUTTON
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 18),
                  child: Row(
                    children: List.generate(3, (index) {
                      return Expanded(
                        child: Container(
                          margin: EdgeInsets.only(right: (index == 2) ? 0 : 10),
                          height: 40,
                          decoration:
                              (ctrl.rewardTypeIndex == index)
                                  ? AppStyling().gradientBK()
                                  : AppStyling().myDecoration(
                                    color: kDarkGrey1Color,
                                    borderColor: kTransperentColor,
                                  ),
                          child: InkWell(
                            onTap: () {
                              ctrl.rewardTypeIndex.value = index;
                              ctrl.getReward(
                                type:
                                    (ctrl.rewardTypeIndex.value == 0)
                                        ? ''
                                        : (ctrl.rewardTypeIndex.value == 1)
                                        ? "virtual"
                                        : "physical",
                              );
                            },
                            child: Center(
                              child: MyText(
                                text:
                                    (index == 0)
                                        ? "All"
                                        : (index == 1)
                                        ? "Virtual"
                                        : "physical",
                              ),
                            ),
                          ),
                        ),
                      );
                    }),
                  ),
                ),

                // REWARD CARDS
                (ctrl.isLoading.value == true && ctrl.rewards.isEmpty)
                    ? GridView.builder(
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      itemCount:
                          6, // number of shimmer placeholder cards you want
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        mainAxisSpacing: 13,
                        crossAxisSpacing: 10,
                        mainAxisExtent: 200,

                        // mainAxisExtent: 310,
                      ),
                      itemBuilder: (context, index) {
                        return const ShimmerPremiumCard();
                      },
                    )
                    : (ctrl.isLoading.value == true && ctrl.rewards.isEmpty)
                    ? Center(child: MyText(text: "No reward found!"))
                    : GridView.builder(
                      shrinkWrap: true,
                      itemCount: ctrl.rewards.length,
                      physics: NeverScrollableScrollPhysics(),
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        mainAxisSpacing: 13,
                        crossAxisSpacing: 10,
                        mainAxisExtent: 330,
                      ),
                      itemBuilder: (context, index) {
                        var model = ctrl.rewards[index];
                        return FadeSlideTransition(
                          delay: 300 + index * 100,
                          child: PremiumCard(
                            title: model.title.toString(),
                            subTitle: model.description.toString(),
                            coins: model.coins.toString(),
                            type: model.type.toString(),
                            imageUrl: "${model.images?[0]}",
                            onTap: () {
                              Get.to(
                                () => RewardDetailsPage(),
                                arguments: {'data': model},
                              );
                            },
                          ),
                        );
                      },
                    ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

// ------------------ DIGITAL REWARD CARD ------------------
class _DigitalRewardCard extends StatelessWidget {
  _DigitalRewardCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CommonImageView(width: 48, imagePath: Assets.imagesRHMagicIcon),

        SizedBox(width: 10),

        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              MyText(
                text: "Digital Rewards",
                size: 16,
                weight: FontWeight.w500,
              ),
              MyText(
                text: "Unlock features & premium content",
                size: 14,
                weight: FontWeight.w400,
              ),
            ],
          ),
        ),
        SizedBox(width: 20),

        Container(
          height: 30,
          width: 68,
          decoration: AppStyling().gradientBK(radius: 8),
          child: InkWell(
            onTap: () {
              Get.to(() => AllRewardPage());
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CommonImageView(
                  height: 15,
                  imagePath: Assets.imagesRHCoinsIcon,
                ),
                MyText(
                  paddingLeft: 5,
                  text: "${UserService.instance.userModel.value.coins}",
                  size: 12,
                  weight: FontWeight.w600,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

// ------------------ PREMIUM CARD ------------------
class PremiumCard extends StatelessWidget {
  final String imageUrl, type, title, subTitle, coins;
  final VoidCallback onTap;

  const PremiumCard({
    super.key,
    required this.imageUrl,
    required this.type,
    required this.title,
    required this.subTitle,
    required this.coins,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      // width: 210,
      decoration: BoxDecoration(
        color: kBKBlackColor,
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: kPrimaryColor.withValues(alpha: 0.2)),
      ),
      child: InkWell(
        onTap: onTap,
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // IMAGE WITH TAG
            Stack(
              children: [
                ClipRRect(
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(12),
                    topRight: Radius.circular(12),
                  ),
                  child: CommonImageView(
                    radius: 0,
                    url: imageUrl,
                    height: 200,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),

                Positioned(
                  right: 10,
                  top: 10,
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 8,
                      vertical: 4,
                    ),
                    decoration: BoxDecoration(
                      color: kBlackColor,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Text(
                      type,
                      style: TextStyle(
                        fontSize: 12,
                        color: Colors.white,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                ),
              ],
            ),

            // TEXT SECTION
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(10, 8, 10, 4),
                  child: MyText(
                    text: title,
                    size: 16,
                    weight: FontWeight.w400,
                    color: Colors.white,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(10, 0, 10, 10),
                  child: MyText(
                    text: subTitle,
                    size: 13,
                    weight: FontWeight.w400,
                  ),
                ),

                // COINS BADGE
                Padding(
                  padding: const EdgeInsets.only(left: 10, bottom: 5),
                  child: Container(
                    height: 30,
                    padding: const EdgeInsets.symmetric(
                      horizontal: 12,
                      vertical: 6,
                    ),
                    decoration: BoxDecoration(
                      gradient: const LinearGradient(
                        colors: [Color(0xff00C6FF), Color(0xff7F00FF)],
                      ),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: MyText(
                      text: "$coins coins",
                      size: 14,
                      weight: FontWeight.w400,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class ShimmerPremiumCard extends StatelessWidget {
  const ShimmerPremiumCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey.withOpacity(0.2),
      highlightColor: Colors.grey.withOpacity(0.4),
      child: Container(
        width: 210,
        decoration: BoxDecoration(
          color: Color(0xff1A1A1A),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Image Skeleton
            Container(
              height: 160,
              decoration: BoxDecoration(
                color: Colors.grey.withOpacity(0.3),
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(13),
                  topRight: Radius.circular(20),
                ),
              ),
            ),

            // Text section skeletons
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Title skeleton
                Padding(
                  padding: const EdgeInsets.fromLTRB(14, 14, 14, 4),
                  child: Container(
                    height: 16,
                    width: 100,
                    decoration: BoxDecoration(
                      color: Colors.grey.withOpacity(0.3),
                      borderRadius: BorderRadius.circular(6),
                    ),
                  ),
                ),

                // Sub title skeleton
                Padding(
                  padding: const EdgeInsets.fromLTRB(14, 0, 14, 12),
                  child: Container(
                    height: 13,
                    width: 150,
                    decoration: BoxDecoration(
                      color: Colors.grey.withOpacity(0.3),
                      borderRadius: BorderRadius.circular(6),
                    ),
                  ),
                ),

                // Coins badge skeleton
                Padding(
                  padding: const EdgeInsets.only(left: 14, bottom: 14),
                  child: Container(
                    height: 26,
                    width: 70,
                    decoration: BoxDecoration(
                      color: Colors.grey.withOpacity(0.3),
                      borderRadius: BorderRadius.circular(14),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
