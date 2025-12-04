import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:uzyio/constants/app_colors.dart';
import 'package:uzyio/constants/app_images.dart';
import 'package:uzyio/constants/app_sizes.dart';
import 'package:uzyio/constants/app_styling.dart';
import 'package:uzyio/view/widget/common_image_view_widget.dart';
import 'package:uzyio/view/widget/my_text_widget.dart';

class AllRewardPage extends StatefulWidget {
  const AllRewardPage({super.key});

  @override
  State<AllRewardPage> createState() => _AllRewardPageState();
}

class _AllRewardPageState extends State<AllRewardPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBlackColor,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: AppSizes.DEFAULT,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.arrow_back_ios_new_rounded,
                  color: kPrimaryColor,
                ),
              ),
              // TOTAL BALANCE
              _TotalBalanceCard(),

              // DAILY LOGIN BONUS
              _DailyBonusCard(),

              // STREAK PROGRESS
              _StreakProgressCard(),

              // EARN COINS
              MyText(
                paddingTop: 22,
                paddingBottom: 12,
                text: "Earn Coins",
                size: 16,
                weight: FontWeight.w400,
                color: kPrimaryColor.withValues(alpha: 0.8),
              ),

              ...List.generate(rewardItems.length, (index) {
                return _AllReward(
                  title: rewardItems[index].title,
                  subTitle: rewardItems[index].subTitle,
                  coins: rewardItems[index].coins,
                  icon: rewardItems[index].icon,
                  haveGreenCard: rewardItems[index].haveGreenCard,
                );
              }),

              // RECENT ACTIVITY
              MyText(
                paddingTop: 40,
                paddingBottom: 12,
                text: "Recent Activity",
                size: 16,
                weight: FontWeight.w400,
                color: kPrimaryColor.withValues(alpha: 0.8),
              ),

              Container(
                margin: EdgeInsets.only(bottom: 20),
                padding: EdgeInsets.symmetric(horizontal: 16, vertical: 14),
                decoration: AppStyling().myDecoration(
                  color: kDarkGrey1Color,
                  borderColor: kPrimaryColor.withValues(alpha: 0.6),
                ),

                child: Column(
                  children: List.generate(3, (index) {
                    List<RecentActivityModel> items = [
                      RecentActivityModel(
                        title: "Daily Login Bonus",
                        subTitle: "Today",
                        coins: "+20",
                      ),
                      RecentActivityModel(
                        title: "Content Shared",
                        subTitle: "2 hours ago",
                        coins: "+10",
                      ),
                      RecentActivityModel(
                        title: "Generated Image",
                        subTitle: "Yesterday",
                        coins: "+5",
                      ),
                    ];
                    return Padding(
                      padding: EdgeInsets.only(bottom: (index < 2) ? 20 : 0),
                      child: Row(
                        children: [
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                MyText(
                                  text: items[index].title,
                                  size: 16,
                                  weight: FontWeight.w400,
                                  color: kPrimaryColor.withValues(alpha: 0.8),
                                ),
                                MyText(
                                  text: items[index].subTitle,
                                  size: 14,
                                  weight: FontWeight.w400,
                                  color: kPrimaryColor.withValues(alpha: 0.5),
                                ),
                              ],
                            ),
                          ),
                          MyText(
                            text: items[index].coins,
                            size: 14,
                            weight: FontWeight.w400,
                            color: Color(0xff00A63E),
                          ),
                        ],
                      ),
                    );
                  }),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  List<RewardModel> rewardItems = [
    RewardModel(
      icon: Assets.imagesRA,
      title: "Subscribe to Plan",
      subTitle: "Monthly recurring coins",
      coins: "+50",
      haveGreenCard: false,
    ),
    RewardModel(
      icon: Assets.imagesRB,
      title: "Upgrade Plan",
      subTitle: "One-time bonus",
      coins: "+100",
      haveGreenCard: false,
    ),
    RewardModel(
      icon: Assets.imagesRC,
      title: "Refer a Friend",
      subTitle: "They must buy subscription",
      coins: "+200",
      haveGreenCard: false,
    ),
    RewardModel(
      icon: Assets.imagesRD,
      title: "Birthday Reward",
      subTitle: "Enter your birthday",
      coins: "+50",
      haveGreenCard: false,
    ),
    RewardModel(
      icon: Assets.imagesRE,
      title: "Share Content",
      subTitle: "Any social platform, unlimited",
      coins: "+10",
      haveGreenCard: false,
    ),
    RewardModel(
      icon: Assets.imagesRF,
      title: "Generate Content",
      subTitle: "Text-to-image/video",
      coins: "+5",
      haveGreenCard: false,
    ),
    RewardModel(
      icon: Assets.imagesRG,
      title: "Premium Templates",
      subTitle: "Generate premium content",
      coins: "+10",
      haveGreenCard: false,
    ),
    RewardModel(
      icon: Assets.imagesRH,
      title: "Leave a Review",
      subTitle: "Positive reviews only",
      coins: "+30",
      haveGreenCard: false,
    ),
    RewardModel(
      icon: Assets.imagesRI,
      title: "Buy Top-Up Credits",
      subTitle: "Direct purchase",
      coins: "+500",
      haveGreenCard: true,
    ),
  ];
}

class RecentActivityModel {
  String title, subTitle, coins;

  RecentActivityModel({
    required this.title,
    required this.subTitle,
    required this.coins,
  });
}

class _AllReward extends StatelessWidget {
  final String icon, title, subTitle, coins;
  final bool haveGreenCard;

  const _AllReward({
    super.key,
    required this.icon,
    required this.title,
    required this.subTitle,
    required this.coins,
    this.haveGreenCard = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 15),
      padding: EdgeInsets.symmetric(horizontal: 15, vertical: 14),
      width: Get.width,
      decoration:
          (haveGreenCard)
              ? BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                gradient: LinearGradient(
                  colors: [Color(0xff00C950), Color(0xff00BC7D)],
                ),
              )
              : AppStyling().myDecoration(color: kDarkGrey2Color),

      child: Row(
        children: [
          CommonImageView(width: 48, imagePath: icon),
          SizedBox(width: 10),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                MyText(
                  paddingBottom: 4,
                  text: title,
                  size: 14,
                  weight: FontWeight.w400,
                  color: (haveGreenCard) ? kPrimaryColor : kTertiaryColor,
                ),
                MyText(
                  text: subTitle,
                  size: 14,
                  weight: FontWeight.w400,
                  color:
                      (haveGreenCard)
                          ? kPrimaryColor.withValues(alpha: 0.7)
                          : kPrimaryColor.withValues(alpha: 0.8),
                ),
              ],
            ),
          ),

          Container(
            height: 32,
            width: 50,
            decoration: AppStyling().myDecoration(
              color:
                  (haveGreenCard)
                      ? kPrimaryColor.withValues(alpha: 0.3)
                      : Color(0XFF4A4139),
              radius: 100,
              borderColor: kTransperentColor,
            ),
            child: Center(
              child: MyText(
                text: coins,
                size: 14,
                weight: FontWeight.w400,
                color: (haveGreenCard) ? kPrimaryColor : Color(0XFFFF9200),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class RewardModel {
  String icon, title, subTitle, coins;
  final bool haveGreenCard;

  RewardModel({
    required this.icon,
    required this.title,
    required this.subTitle,
    required this.coins,
    this.haveGreenCard = false,
  });
}

class _StreakProgressCard extends StatelessWidget {
  const _StreakProgressCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 24),
      // height: 200,
      padding: EdgeInsets.all(1),
      decoration: AppStyling().gradientBK(),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 21, vertical: 23),
        decoration: AppStyling().myDecoration(
          color: kDarkGrey1Color.withValues(alpha: 0.9),
          borderColor: kTransperentColor,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // STREAK IMAGE & TEXT
            Row(
              children: [
                CommonImageView(
                  height: 15,
                  imagePath: Assets.imagesGradientStreakIcon,
                ),

                ShaderMask(
                  shaderCallback:
                      (bounds) => LinearGradient(
                        colors: [kTertiaryColor, kSecondaryColor],
                      ).createShader(
                        Rect.fromLTWH(0, 0, bounds.width, bounds.height),
                      ),
                  child: MyText(
                    paddingLeft: 10,
                    text: "7-Day Streak Progress",
                    size: 16,
                    weight: FontWeight.w400,
                  ),
                ),
              ],
            ),

            // PROGRESS BAR
            Padding(
              padding: EdgeInsets.only(top: 15, bottom: 8),
              child: Row(
                children: List.generate(7, (index) {
                  return Expanded(
                    child: Container(
                      margin: EdgeInsets.only(right: (index < 6) ? 5 : 0),
                      height: 8,
                      decoration: AppStyling().myDecoration(
                        color:
                            (index < 3)
                                ? kTertiaryColor
                                : kPrimaryColor.withValues(alpha: 0.3),
                        borderColor: kTransperentColor,
                      ),
                    ),
                  );
                }),
              ),
            ),

            MyText(
              paddingTop: 10,
              paddingBottom: 4,
              text: "4 days - 3 more to unlock 100 coins!",
              size: 14,
              weight: FontWeight.w400,
              color: kPrimaryColor.withValues(alpha: 0.8),
            ),

            Row(
              children: [
                MyText(text: "⚠️", size: 14, weight: FontWeight.w400),
                ShaderMask(
                  shaderCallback:
                      (bounds) => LinearGradient(
                        colors: [
                          kTertiaryColor,
                          const Color.fromARGB(255, 1, 100, 107),
                        ],
                      ).createShader(
                        Rect.fromLTWH(0, 0, bounds.width, bounds.height),
                      ),
                  child: MyText(
                    paddingLeft: 10,
                    text: "Resets if you miss a day",
                    size: 16,
                    weight: FontWeight.w400,
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
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              MyText(
                text: "Total Balance",
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
                    text: "470",
                    size: 36,
                    weight: FontWeight.w600,
                  ),
                ],
              ),

              MyText(
                text: "Coins",
                size: 14,
                weight: FontWeight.w600,
                color: kPrimaryColor.withValues(alpha: 0.8),
              ),
            ],
          ),

          // STREAK
          Container(
            padding: EdgeInsets.symmetric(vertical: 4, horizontal: 8),
            height: 88,
            decoration: AppStyling().myDecoration(
              color: kPrimaryColor.withValues(alpha: 0.3),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CommonImageView(height: 20, imagePath: Assets.imagesStreakIcon),
                MyText(text: "Streak", size: 14, weight: FontWeight.w600),
                MyText(text: "4/7", size: 20, weight: FontWeight.w600),
              ],
            ),
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
