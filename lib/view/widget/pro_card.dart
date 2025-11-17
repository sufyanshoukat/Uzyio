import 'package:flutter/material.dart';
import 'package:uzyio/constants/app_colors.dart';
import 'package:uzyio/constants/app_images.dart';
import 'package:uzyio/constants/app_styling.dart';
import 'package:uzyio/view/widget/common_image_view_widget.dart';
import 'package:uzyio/view/widget/my_text_widget.dart';

class ProBtn extends StatelessWidget {
  const ProBtn({super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: Container(
        height: 30,
        width: 70,
        decoration: AppStyling().background(image: Assets.imagesProBk),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CommonImageView(height: 16, imagePath: Assets.imagesProIconS),
            MyText(
              paddingLeft: 5,
              text: "PRO",
              size: 12,
              weight: FontWeight.w600,
            ),
          ],
        ),
      ),
    );
  }
}

class ProCard extends StatelessWidget {
  const ProCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 46,
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 4.5),
      decoration: AppStyling().myDecoration(
        color: kBlackColor,
        radius: 100,
        borderColor: kTransperentColor,
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [MyText(text: "Pro", size: 11, weight: FontWeight.w600)],
      ),
    );
  }
}
