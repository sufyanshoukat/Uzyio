import 'package:flutter/material.dart';
import 'package:uzyio/constants/app_colors.dart';
import 'package:uzyio/constants/app_images.dart';
import 'package:uzyio/constants/app_sizes.dart';
import 'package:uzyio/constants/app_styling.dart';
import 'package:uzyio/view/widget/common_image_view_widget.dart';
import 'package:uzyio/view/widget/custom_textfield.dart';
import 'package:uzyio/view/widget/my_text_widget.dart';

class RewardHomePage extends StatefulWidget {
  const RewardHomePage({super.key});

  @override
  State<RewardHomePage> createState() => _RewardHomePageState();
}

class _RewardHomePageState extends State<RewardHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
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
                  color: kPrimaryColor.withValues(alpha: 0.7),
                ),
              ),
              SizedBox(height: 20),
              // DIGITAL REWARD
              _DigitalRewardCard(),

              // SEARCH
              CustomTextField(
                top: 24,
                bottom: 24,
                borderColor: kSecondaryColor,
                outlineBorderColor: kSecondaryColor,
                backgroundColor: kTransperentColor,
                hintTextFontColor: kSecondaryColor,
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

              // Cards
              GridView.builder(
                shrinkWrap: true,
                itemCount: 10,
                physics: NeverScrollableScrollPhysics(),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 13,
                  crossAxisSpacing: 10,
                  mainAxisExtent: 310,
                ),
                itemBuilder: (context, index) {
                  return PremiumCard(
                    imageUrl:
                        "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQLiBS4HEZL9jhcSTLyyvTsomU-esCaAdTabA&s",
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _DigitalRewardCard extends StatelessWidget {
  const _DigitalRewardCard({super.key});

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
                size: 15,
                weight: FontWeight.w500,
              ),
              MyText(
                text: "Unlock features & premium content",
                size: 12,
                weight: FontWeight.w500,
              ),
            ],
          ),
        ),
        SizedBox(width: 20),

        Container(
          height: 30,
          width: 78,
          decoration: AppStyling().gradientBK(),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CommonImageView(height: 15, imagePath: Assets.imagesRHCoinsIcon),
              MyText(
                paddingLeft: 5,
                text: "470",
                size: 12,
                weight: FontWeight.w600,
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class PremiumCard extends StatelessWidget {
  final String imageUrl;

  const PremiumCard({super.key, required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 210,
      decoration: BoxDecoration(
        color: const Color(0xff1A1A1A),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: kPrimaryColor.withValues(alpha: 0.2)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // ---------------- IMAGE WITH TAG ----------------
          Stack(
            children: [
              ClipRRect(
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(20),
                  topRight: Radius.circular(20),
                ),
                child: Image.network(
                  imageUrl,
                  height: 160,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),

              // "Physical" Tag
              Positioned(
                right: 10,
                top: 10,
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 8,
                    vertical: 4,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.black.withOpacity(0.7),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: const Text(
                    "Physical",
                    style: TextStyle(
                      fontSize: 11,
                      color: Colors.white,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ),
            ],
          ),

          // ---------------- TEXT SECTION ----------------
          Padding(
            padding: const EdgeInsets.fromLTRB(14, 14, 14, 4),
            child: const Text(
              "Premium Style Pack",
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color: Colors.white,
              ),
            ),
          ),

          Padding(
            padding: const EdgeInsets.fromLTRB(14, 0, 14, 12),
            child: Text(
              "Premium Styles",
              style: TextStyle(
                fontSize: 13,
                color: Colors.white.withOpacity(0.7),
              ),
            ),
          ),

          // ---------------- COINS BADGE ----------------
          Padding(
            padding: const EdgeInsets.only(left: 14, bottom: 14),
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
              decoration: BoxDecoration(
                gradient: const LinearGradient(
                  colors: [Color(0xff00C6FF), Color(0xff7F00FF)],
                ),
                borderRadius: BorderRadius.circular(14),
              ),
              child: const Text(
                "100 coins",
                style: TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.w600,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
