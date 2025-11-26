import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:like_button/like_button.dart';
import 'package:uzyio/constants/app_images.dart';
import 'package:uzyio/constants/app_sizes.dart';
import 'package:uzyio/constants/app_styling.dart';
import 'package:uzyio/view/screens/generate_content/create_style.dart';
import 'package:uzyio/view/screens/home/see_all_ai_photo.dart';
import 'package:uzyio/view/widget/common_image_view_widget.dart';
import 'package:uzyio/view/widget/custom_dialog_widget.dart';
import 'package:uzyio/view/widget/my_button.dart';
import 'package:uzyio/view/widget/my_round_button.dart';
import 'package:uzyio/view/widget/my_text_widget.dart';
import 'package:uzyio/view/widget/pro_card.dart';

// class FeedPage extends StatefulWidget {
//   const FeedPage({super.key});

//   @override
//   State<FeedPage> createState() => _FeedPageState();
// }

// class _FeedPageState extends State<FeedPage> {
//   final List<String> bgImages = [
//     Assets.imagesModelImage,
//     Assets.imagesAiGril1,
//     Assets.imagesAiGril2,
//     Assets.imagesAiBoy1,
//     Assets.imagesAiBoy2,
//   ];

//   int currentBgIndex = 0;

//   void changeBackground() {
//     setState(() {
//       currentBgIndex = (currentBgIndex + 1) % bgImages.length;
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: GestureDetector(
//         // Detect vertical drag to change image
//         onVerticalDragUpdate: (details) {
//           if (details.delta.dy > 8 || details.delta.dy < -8) {
//             changeBackground();
//           }
//         },

//         child: Stack(
//           children: [
//             /// ---------------- BACKGROUND IMAGE ----------------
//             Positioned.fill(
//               child: AnimatedSwitcher(
//                 duration: Duration(milliseconds: 300),
//                 child: Container(
//                   key: ValueKey(currentBgIndex),
//                   decoration: AppStyling().background(
//                     image: bgImages[currentBgIndex],
//                   ),
//                 ),
//               ),
//             ),

//             /// ---------------- FOREGROUND CONTENT (STICKY) ----------------
//             SafeArea(
//               child: Padding(
//                 padding: AppSizes.DEFAULT,
//                 child: Column(
//                   children: [
//                     /// Back button top-left
//                     Align(
//                       alignment: Alignment.topLeft,
//                       child: MyRoundButton(
//                         onTap: () => Get.back(),
//                         splashColor: kWhiteColor.withValues(alpha: 0.9),
//                         height: 60,

//                         child: CommonImageView(
//                           height: 28,
//                           svgPath: Assets.imagesBackBtnNewStyleSvgIcon,
//                         ),
//                       ),
//                     ),

//                     Spacer(),

//                     /// Right-side like/share buttons
//                     Align(
//                       alignment: Alignment.centerRight,
//                       child: Column(
//                         crossAxisAlignment: CrossAxisAlignment.end,
//                         children: [
//                           SizedBox(
//                             height: 30,
//                             width: 40,
//                             child: LikeButton(
//                               circleColor: CircleColor(
//                                 start: Color(0xff00ddff),
//                                 end: Color(0xff0099cc),
//                               ),
//                               bubblesColor: BubblesColor(
//                                 dotPrimaryColor: Colors.pink,
//                                 dotSecondaryColor: Colors.white,
//                               ),
//                               likeBuilder: (bool isLiked) {
//                                 return SizedBox(
//                                   height: 30,
//                                   width: 30,
//                                   child:
//                                       isLiked
//                                           ? Icon(
//                                             Icons.favorite,
//                                             color: Colors.red,
//                                             size: 29,
//                                           )
//                                           : CommonImageView(
//                                             svgPath:
//                                                 Assets.imagesFavOutlineIcon,
//                                           ),
//                                 );
//                               },
//                             ),
//                           ),
//                           MyText(
//                             paddingBottom: 20,
//                             paddingTop: 5,
//                             text: "1.5k",
//                             size: 17,
//                             weight: FontWeight.w700,
//                           ),
//                           CommonImageView(svgPath: Assets.imagesShareIconS),
//                           MyText(
//                             paddingTop: 5,
//                             text: "44",
//                             size: 17,
//                             weight: FontWeight.w700,
//                           ),
//                         ],
//                       ),
//                     ),

//                     SizedBox(height: 20),

//                     /// Profile section
//                     Row(
//                       children: [
//                         CommonImageView(
//                           height: 65,
//                           width: 65,
//                           radius: 100,
//                           imagePath: Assets.imagesAiGril1,
//                         ),
//                         MyText(
//                           paddingLeft: 10,
//                           text: "Richman",
//                           size: 21,
//                           weight: FontWeight.w700,
//                         ),
//                       ],
//                     ),

//                     /// Bottom button fixed
//                     Stack(
//                       children: [
//                         MyButton(
//                           mTop: 20,
//                           mBottom: 30,
//                           onTap: () {
//                             Get.dialog(CustomDialog(child: TakePhotoPopup()));
//                           },
//                           buttonText: "Try Style",
//                         ),
//                         Positioned(
//                           left: Get.width / 2.5,
//                           top: 1,
//                           child: ProCard(),
//                         ),
//                       ],
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

class FeedPage extends StatefulWidget {
  const FeedPage({super.key});

  @override
  State<FeedPage> createState() => _FeedPageState();
}

class _FeedPageState extends State<FeedPage> {
  final List<String> bgImages = [
    Assets.imagesModelImage,
    Assets.imagesAiGril1,
    Assets.imagesAiGril2,
    Assets.imagesAiBoy1,
    Assets.imagesAiBoy2,
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView.builder(
        scrollDirection: Axis.vertical, // IMPORTANT (TikTok style)
        itemCount: bgImages.length,
        itemBuilder: (context, index) {
          return Stack(
            children: [
              /// ---------------- BACKGROUND IMAGE PER PAGE ----------------
              Positioned.fill(
                child: Container(
                  decoration: AppStyling().background(image: bgImages[index]),
                ),
              ),

              /// ---------------- FOREGROUND CONTENT (STICKY) ----------------
              SafeArea(
                child: Padding(
                  padding: AppSizes.DEFAULT,
                  child: Column(
                    children: [
                      /// Back button
                      Align(
                        alignment: Alignment.topLeft,
                        child: MyRoundButton(
                          onTap: () => Get.back(),
                          height: 60,
                          child: CommonImageView(
                            height: 28,
                            svgPath: Assets.imagesBackBtnNewStyleSvgIcon,
                          ),
                        ),
                      ),

                      Spacer(),

                      /// Right side like/share buttons
                      Align(
                        alignment: Alignment.centerRight,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            SizedBox(
                              height: 30,
                              width: 40,
                              child: LikeButton(
                                circleColor: CircleColor(
                                  start: Color(0xff00ddff),
                                  end: Color(0xff0099cc),
                                ),
                                bubblesColor: BubblesColor(
                                  dotPrimaryColor: Colors.pink,
                                  dotSecondaryColor: Colors.white,
                                ),
                                likeBuilder: (bool isLiked) {
                                  return SizedBox(
                                    height: 30,
                                    width: 30,
                                    child:
                                        isLiked
                                            ? Icon(
                                              Icons.favorite,
                                              color: Colors.red,
                                              size: 29,
                                            )
                                            : CommonImageView(
                                              svgPath:
                                                  Assets.imagesFavOutlineIcon,
                                            ),
                                  );
                                },
                              ),
                            ),

                            MyText(
                              paddingBottom: 20,
                              paddingTop: 5,
                              text: "1.5k",
                              size: 17,
                              weight: FontWeight.w700,
                            ),

                            CommonImageView(svgPath: Assets.imagesShareIconS),

                            MyText(
                              paddingTop: 5,
                              text: "44",
                              size: 17,
                              weight: FontWeight.w700,
                            ),
                          ],
                        ),
                      ),

                      SizedBox(height: 20),

                      /// Profile Row
                      Row(
                        children: [
                          CommonImageView(
                            height: 65,
                            width: 65,
                            radius: 100,
                            imagePath: Assets.imagesAiGril1,
                          ),
                          MyText(
                            paddingLeft: 10,
                            text: "Richman",
                            size: 21,
                            weight: FontWeight.w700,
                          ),
                        ],
                      ),

                      /// Bottom button
                      Stack(
                        children: [
                          MyButton(
                            mTop: 20,
                            mBottom: 30,
                            onTap: () {
                              Get.dialog(CustomDialog(child: TakePhotoPopup()));
                            },
                            buttonText: "Try Style",
                          ),
                          Positioned(
                            left: Get.width / 2.5,
                            top: 1,
                            child: ProCard(),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
