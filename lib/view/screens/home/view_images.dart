import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:like_button/like_button.dart';
import 'package:uzyio/constants/app_colors.dart';
import 'package:uzyio/constants/app_images.dart';
import 'package:uzyio/constants/app_sizes.dart';
import 'package:uzyio/constants/app_styling.dart';
import 'package:uzyio/services/user/user_services.dart';
import 'package:uzyio/view/screens/generate_content/create_style.dart';
import 'package:uzyio/view/widget/common_image_view_widget.dart';
import 'package:uzyio/view/widget/custom_dialog_widget.dart';
import 'package:uzyio/view/widget/my_button.dart';
import 'package:uzyio/view/widget/my_round_button.dart';
import 'package:uzyio/view/widget/my_text_widget.dart';
import 'package:uzyio/view/widget/pro_card.dart';

class ViewPublicContent extends StatefulWidget {
  const ViewPublicContent({super.key});

  @override
  State<ViewPublicContent> createState() => _ViewPublicContentState();
}

class _ViewPublicContentState extends State<ViewPublicContent> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: AppStyling().background(image: Assets.imagesModelImage),
      child: Scaffold(
        backgroundColor: kTransperentColor,
        body: SafeArea(
          child: Padding(
            padding: AppSizes.DEFAULT,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                /// Back button top-left
                Align(
                  alignment: Alignment.topLeft,
                  child: MyRoundButton(
                    onTap: () => Get.back(),
                    splashColor: kWhiteColor.withValues(alpha: 0.9),
                    height: 60,

                    child: CommonImageView(
                      height: 28,
                      svgPath: Assets.imagesBackBtnNewStyleSvgIcon,
                    ),
                  ),
                ),
                // Align(
                //   alignment: Alignment.topLeft,
                //   child: MyRoundButton(
                //     onTap: () {
                //       Get.back();
                //     },
                //     splashColor: kWhiteColor.withValues(alpha: 0.9),
                //     height: 60,
                //     width: 60,
                //     child: CommonImageView(
                //       svgPath: Assets.imagesBackBtnNewStyleSvgIcon,
                //     ),
                //   ),
                // ),
                // --------- Download Button ---------
                // Row(
                //   mainAxisAlignment: MainAxisAlignment.end,
                //   children: [
                //     MyRoundButton(
                //       onTap: () {},
                //       height: 60,
                //       width: 60,
                //       child: CommonImageView(svgPath: Assets.imagesEditIconS),
                //     ),
                //     MyRoundButton(
                //       onTap: () {},
                //       height: 60,
                //       width: 60,
                //       child: CommonImageView(
                //         svgPath: Assets.imagesDownloadIconS,
                //       ),
                //     ),
                //     MyRoundButton(
                //       onTap: () {},
                //       height: 60,
                //       width: 60,
                //       child: CommonImageView(svgPath: Assets.imagesDeleteIcon),
                //     ),
                //   ],
                // ),
                Spacer(),
                // ------- Like & Share --------
                Align(
                  alignment: Alignment.centerRight,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      // Like Buttons
                      SizedBox(
                        height: 30,
                        width: 40,
                        child: LikeButton(
                          mainAxisAlignment: MainAxisAlignment.end,
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
                                      : Center(
                                        child: CommonImageView(
                                          svgPath: Assets.imagesFavOutlineIcon,
                                        ),
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

                      // Share Button
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

                // ------- Profile Image & Name --------
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

                // ------- Try Style & Regenerate Button --------
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

                    Positioned(left: Get.width / 2.5, top: 1, child: ProCard()),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
