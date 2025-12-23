import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:uzyio/constants/app_colors.dart';
import 'package:uzyio/constants/app_images.dart';
import 'package:uzyio/constants/app_sizes.dart';
import 'package:uzyio/constants/app_styling.dart';
import 'package:uzyio/constants/loading_animation.dart';
import 'package:uzyio/controller/reward_controller.dart/reward_contoller.dart';
import 'package:uzyio/model/reward/reward_model.dart';
import 'package:uzyio/services/user/user_services.dart';
import 'package:uzyio/view/widget/animation_widget.dart';
import 'package:uzyio/view/widget/common_image_view_widget.dart';
import 'package:uzyio/view/widget/my_button.dart';
import 'package:uzyio/view/widget/my_text_widget.dart';

class RewardDetailsPage extends StatefulWidget {
  const RewardDetailsPage({super.key});

  @override
  State<RewardDetailsPage> createState() => _RewardDetailsPageState();
}

class _RewardDetailsPageState extends State<RewardDetailsPage> {
  RewardModel model = Get.arguments['data'];
  final ctrl = Get.put(RewardController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Column(
          children: [
            //  APP BAR
            Row(
              children: [
                SizedBox(width: 10),
                IconButton(
                  onPressed: () {
                    Get.close(1);
                  },
                  icon: Icon(Icons.arrow_back, color: kWhiteColor, size: 20),
                ),

                MyText(paddingLeft: 10, text: "Reward Details", size: 16),
              ],
            ),

            Expanded(
              child: SingleChildScrollView(
                physics: BouncingScrollPhysics(),
                padding: AppSizes.VERTICAL,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // IMAGE
                    FadeSlideTransition(
                      delay: 300,
                      child: Container(
                        padding: EdgeInsets.all(20),
                        height: 400,
                        width: Get.width,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: NetworkImage(
                              "${model.images?[0].toString()}",
                            ),
                            fit: BoxFit.cover,
                          ),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Container(
                              padding: EdgeInsets.symmetric(horizontal: 10),
                              height: 35,
                              // width: 144,
                              decoration: AppStyling().gradientBK(radius: 100),
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [MyText(text: "✨ ${model.type}")],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),

                    // TITLE
                    FadeSlideTransition(
                      beginOffset: Offset(-0.5, 0),

                      child: Padding(
                        padding: AppSizes.DEFAULT,
                        child: Column(
                          children: [
                            // TITLE & EXPORT FEATURES
                            Row(
                              children: [
                                Expanded(
                                  child: MyText(
                                    text: model.title.toString(),
                                    size: 16,
                                    color: kWhiteColor,
                                    weight: FontWeight.w500,
                                  ),
                                ),
                                Container(
                                  padding: EdgeInsets.symmetric(
                                    horizontal: 12,
                                    vertical: 6,
                                  ),
                                  decoration: AppStyling().myDecoration(
                                    radius: 100,
                                    color: kSecondaryColor.withValues(
                                      alpha: 0.2,
                                    ),
                                    borderColor: kTransperentColor,
                                  ),

                                  child: MyText(
                                    text: "Export Features",
                                    size: 12,
                                    color: kSecondaryColor,
                                  ),
                                ),
                              ],
                            ),

                            // REQUIRED COINS
                            _TotalBalanceCard(coins: model.coins.toString()),
                          ],
                        ),
                      ),
                    ),

                    FadeSlideTransition(
                      delay: 300,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          MyText(
                            paddingLeft: 20,
                            paddingRight: 20,
                            paddingTop: 10,
                            text: "Description",
                            size: 18,
                            weight: FontWeight.w600,
                            color: kPrimaryColor,
                          ),
                          MyText(
                            paddingLeft: 20,
                            paddingRight: 20,
                            paddingTop: 10,
                            size: 16,
                            weight: FontWeight.w400,
                            text: model.description.toString(),
                            color: kPrimaryColor.withValues(alpha: 0.9),
                          ),
                          MyText(
                            paddingLeft: 20,
                            paddingRight: 20,
                            paddingTop: 22,
                            paddingBottom: 14,
                            text: "Features & Benefits",
                            size: 16,
                            weight: FontWeight.w600,
                            color: kPrimaryColor,
                          ),
                        ],
                      ),
                    ),

                    Padding(
                      padding: AppSizes.HORIZONTAL,
                      child: FadeSlideTransition(
                        child: Column(
                          children: List.generate(3, (index) {
                            List<Map<String, String>> item = [
                              {
                                "title": "Instant Access",
                                "subTitle":
                                    "Unlocked immediately after redemption",
                                "icon": Assets.imagesRdA,
                              },

                              {
                                "title": "Lifetime Access",
                                "subTitle": "Once unlocked, it's yours forever",
                                "icon": Assets.imagesRdB,
                              },
                              {
                                "title": "No Additional Cost",
                                "subTitle":
                                    "Only coins required - no hidden fees or charges",
                                "icon": Assets.imagesRdC,
                              },
                            ];
                            return Padding(
                              padding: EdgeInsets.only(bottom: 15),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,

                                children: [
                                  CommonImageView(
                                    width: 36,
                                    imagePath: "${item[index]['icon']}",
                                  ),
                                  SizedBox(width: 15),
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        MyText(
                                          text: "${item[index]['title']}",
                                          size: 16,
                                          weight: FontWeight.w800,
                                          color: kPrimaryColor.withValues(
                                            alpha: 0.9,
                                          ),
                                        ),
                                        MyText(
                                          text: "${item[index]['subTitle']}",
                                          size: 14,
                                          weight: FontWeight.w400,
                                          color: kPrimaryColor.withValues(
                                            alpha: 0.9,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            );
                          }),
                        ),
                      ),
                    ),

                    // REDEEM NOW
                    Container(
                      width: Get.width,
                      margin: AppSizes.HORIZONTAL,
                      padding: EdgeInsets.symmetric(
                        horizontal: 17,
                        vertical: 15,
                      ),
                      decoration: AppStyling().myDecoration(
                        borderColor: kPinkColor,
                        color: kDarkGrey1Color.withValues(alpha: 0.7),
                        radius: 14,
                      ),
                      // : AppStyling().myDecoration(
                      //   borderColor: const Color.fromARGB(255, 65, 51, 84),
                      //   color: kDarkGrey1Color,
                      // ),
                      child: MyText(
                        text: "✓ Available - Ready to unlock",
                        color: kPinkColor,
                        size: 14,
                        weight: FontWeight.w400,
                      ),
                    ),

                    SizedBox(height: 32),

                    // REDEEM NOW BTN
                    Align(
                      alignment: Alignment.center,
                      child: SizedBox(
                        width: 250,
                        child:
                            (UserService.instance.userModel.value.coins!
                                        .toInt() <
                                    model.coins!.toInt())
                                ? MyButton(
                                  height: 57,
                                  onTap: () {
                                    displayToast(msg: "Insufficient coins");
                                  },
                                  buttonText: "Redeem Now",
                                  fontColor: kPrimaryColor.withValues(
                                    alpha: 0.6,
                                  ),
                                  isGradientBackground: false,
                                  backgroundColor: kDarkGrey1Color,
                                  outlineColor: kPrimaryColor.withValues(
                                    alpha: 0.4,
                                  ),
                                )
                                : MyButton(
                                  height: 57,
                                  onTap: () {
                                    ctrl.redeemNow(
                                      rewardID: model.id.toString(),
                                    );
                                  },
                                  buttonText: "Redeem Now",
                                ),
                      ),
                    ),
                    SizedBox(height: 32),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _TotalBalanceCard extends StatelessWidget {
  String? coins;
  _TotalBalanceCard({super.key, this.coins});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(16),
      child: Container(
        margin: EdgeInsets.only(top: 15),
        padding: EdgeInsets.symmetric(horizontal: 24, vertical: 14),
        height: 124,
        width: Get.width,
        decoration: AppStyling().gradientBK(),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            // TOTAL BALANCE
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                MyText(
                  text: "Required Coins",
                  size: 14,
                  weight: FontWeight.w600,
                  color: kPrimaryColor.withValues(alpha: 0.8),
                ),

                Row(
                  children: [
                    CommonImageView(
                      height: 32,
                      imagePath: Assets.imagesBalanceIcon,
                    ),

                    MyText(
                      paddingLeft: 10,
                      text: "$coins",
                      size: 36,
                      weight: FontWeight.w400,
                    ),
                  ],
                ),
              ],
            ),

            // YOUR BALANCE
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                MyText(
                  text: "Your Balance",
                  size: 14,
                  weight: FontWeight.w600,
                  color: kPrimaryColor.withValues(alpha: 0.8),
                ),

                Row(
                  children: [
                    CommonImageView(
                      height: 32,
                      imagePath: Assets.imagesBalanceIcon,
                    ),

                    MyText(
                      paddingLeft: 10,
                      text:
                          UserService.instance.userModel.value.coins.toString(),
                      size: 36,
                      weight: FontWeight.w400,
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class _DailyBonusCard extends StatelessWidget {
  const _DailyBonusCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 15),
      padding: EdgeInsets.symmetric(horizontal: 24, vertical: 14),

      width: Get.width,
      decoration: AppStyling().myDecoration(color: kDarkGrey2Color),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,

        children: [
          CommonImageView(
            height: 32,
            imagePath: Assets.imagesCalenderDailyLogin,
          ),
          SizedBox(width: 15),
          // Clam Coins
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                MyText(
                  text: "Daily Login Bonus",
                  size: 14,
                  weight: FontWeight.w600,
                  color: kTertiaryColor,
                ),

                MyText(
                  paddingTop: 5,
                  paddingBottom: 12,
                  text:
                      "Claim 20 coins every day. Log in 7 days in a row for 100 bonus coins!",
                  size: 14,
                  weight: FontWeight.w400,
                  color: kPrimaryColor.withValues(alpha: 0.8),
                ),

                Container(
                  width: 152,
                  height: 40,
                  decoration: AppStyling().gradientBK(),
                  child: Center(
                    child: MyText(
                      text: "Claim 20 Coins",
                      size: 14,
                      weight: FontWeight.w400,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
