import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:uzyio/constants/app_colors.dart';
import 'package:uzyio/constants/app_images.dart';
import 'package:uzyio/constants/app_sizes.dart';
import 'package:uzyio/constants/app_styling.dart';
import 'package:uzyio/view/widget/common_image_view_widget.dart';
import 'package:uzyio/view/widget/my_button.dart';
import 'package:uzyio/view/widget/my_text_widget.dart';

class RewardDetailsPage extends StatefulWidget {
  const RewardDetailsPage({super.key});

  @override
  State<RewardDetailsPage> createState() => _RewardDetailsPageState();
}

class _RewardDetailsPageState extends State<RewardDetailsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: AppSizes.VERTICAL,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              //  APP BAR
              Row(
                children: [
                  IconButton(
                    onPressed: () {},
                    icon: Icon(Icons.arrow_back, color: kWhiteColor, size: 20),
                  ),

                  MyText(paddingLeft: 10, text: "Reward Details"),
                ],
              ),

              // IMAGE
              Container(
                padding: EdgeInsets.all(20),
                height: 400,
                width: Get.width,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: NetworkImage(
                      "https://cdn.dribbble.com/userupload/40088180/file/original-2dfe0edb8533ec007ad42fb0cf5b2077.jpg?resize=752x&vertical=center",
                    ),
                    fit: BoxFit.cover,
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Container(
                      height: 35,
                      width: 144,
                      decoration: AppStyling().gradientBK(radius: 100),
                      child: Center(child: MyText(text: "✨ Digital Reward")),
                    ),
                  ],
                ),
              ),

              // TITLE
              Padding(
                padding: AppSizes.DEFAULT,
                child: Column(
                  children: [
                    // TITLE & EXPORT FEATURES
                    Row(
                      children: [
                        Expanded(
                          child: MyText(
                            text: "Remove Watermark (5 exports)",
                            size: 16,
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.symmetric(
                            horizontal: 12,
                            vertical: 6,
                          ),
                          decoration: AppStyling().myDecoration(
                            radius: 100,
                            color: kSecondaryColor.withValues(alpha: 0.2),
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
                    _TotalBalanceCard(),
                  ],
                ),
              ),

              MyText(
                paddingLeft: 20,
                paddingRight: 20,
                paddingTop: 10,
                text: "Description",
                size: 18,
                weight: FontWeight.w800,
                color: kPrimaryColor.withValues(alpha: 0.9),
              ),
              MyText(
                paddingLeft: 20,
                paddingRight: 20,
                paddingTop: 10,
                text:
                    "Export 5 creations without watermarks. Perfect for professional use.",
                size: 14,
                color: kPrimaryColor.withValues(alpha: 0.9),
              ),
              MyText(
                paddingLeft: 20,
                paddingRight: 20,
                paddingTop: 22,
                paddingBottom: 14,
                text: "Features & Benefits",
                size: 14,
                weight: FontWeight.w800,
                color: kPrimaryColor.withValues(alpha: 0.9),
              ),

              Padding(
                padding: AppSizes.HORIZONTAL,
                child: Column(
                  children: List.generate(3, (index) {
                    List<Map<String, String>> item = [
                      {
                        "title": "Instant Access",
                        "subTitle": "Unlocked immediately after redemption",
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
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                MyText(
                                  text: "${item[index]['title']}",
                                  size: 14,
                                  weight: FontWeight.w800,
                                  color: kPrimaryColor.withValues(alpha: 0.9),
                                ),
                                MyText(
                                  text: "${item[index]['subTitle']}",
                                  size: 14,
                                  weight: FontWeight.w400,
                                  color: kPrimaryColor.withValues(alpha: 0.9),
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

              // REDEEM NOW
              Container(
                width: Get.width,
                margin: AppSizes.HORIZONTAL,
                padding: EdgeInsets.symmetric(horizontal: 17, vertical: 15),
                decoration: AppStyling().myDecoration(
                  borderColor: kSecondaryColor,
                  color: kDarkGrey1Color,
                ),
                child: MyText(
                  text: "✓ Available - Ready to unlock",
                  color: kSecondaryColor,
                ),
              ),

              SizedBox(height: 32),

              // REDEEM NOW BTN
              Align(
                alignment: Alignment.center,
                child: SizedBox(
                  width: 250,
                  child: MyButton(
                    height: 57,
                    onTap: () {},
                    buttonText: "Redeem Now",
                  ),
                ),
              ),
              SizedBox(height: 32),
            ],
          ),
        ),
      ),
    );
  }
}

class _TotalBalanceCard extends StatelessWidget {
  const _TotalBalanceCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 15),
      padding: EdgeInsets.symmetric(horizontal: 24, vertical: 14),
      height: 136,
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
                    text: "50",
                    size: 36,
                    weight: FontWeight.w600,
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
                    text: "280",
                    size: 36,
                    weight: FontWeight.w600,
                  ),
                ],
              ),

              MyText(
                paddingLeft: 10,
                text: "After: 220 Coins",
                size: 12,
                weight: FontWeight.w600,
                color: kPrimaryColor.withValues(alpha: 0.8),
              ),
            ],
          ),
        ],
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
