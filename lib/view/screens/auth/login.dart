import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/get_instance.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:uzyio/constants/app_colors.dart';
import 'package:uzyio/constants/app_images.dart';
import 'package:uzyio/constants/app_sizes.dart';
import 'package:uzyio/constants/app_styling.dart';
import 'package:uzyio/controller/auth_controller/auth_controller.dart';
import 'package:uzyio/view/screens/my_nav_bar/my_nav_bar.dart';
import 'package:uzyio/view/widget/common_image_view_widget.dart';
import 'package:uzyio/view/widget/my_ripple_effect.dart';
import 'package:uzyio/view/widget/my_text_widget.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  AuthController ctrl = Get.find<AuthController>();
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: AppStyling().background(image: Assets.imagesBkImage),
      child: Scaffold(
        backgroundColor: kTransperentColor,
        body: Padding(
          padding: AppSizes.DEFAULT,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              MyText(
                paddingTop: 100,
                text: "Welcome to UZY.IO",
                size: 32,
                weight: FontWeight.w800,
              ),
              MyText(
                paddingTop: 16,
                text: "Create and share amazing content\nin seconds",
                size: 15,
                weight: FontWeight.w400,
                textAlign: TextAlign.center,
              ),
              Spacer(),

              _AuthButton(
                title: "Continue with Google",
                icon: Assets.imagesGoogleIconSvg,
                onTap: () {
                  ctrl.googleAuth();
                },
              ),
              SizedBox(height: 24),
              _AuthButton(
                title: "Continue with Apple",
                icon: Assets.imagesAppleSvgIcon,
                onTap: () {
                  Get.to(() => MyNavBar(selectedIndex: 2));
                },
              ),
              Spacer(),
            ],
          ),
        ),
      ),
    );
  }
}

class _AuthButton extends StatelessWidget {
  final String title, icon;
  final VoidCallback onTap;
  _AuthButton({
    super.key,
    required this.title,
    required this.icon,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Animate(
      effects: [
        MoveEffect(
          duration: Duration(milliseconds: 400),
          begin: const Offset(10, 0),
        ),
      ],
      child: Container(
        height: 68,
        decoration: AppStyling().myDecoration(
          color: kBlackColor.withValues(alpha: 0.5),
          radius: 100,
          borderColor: kTransperentColor,
        ),
        child: MyRippleEffect(
          onTap: onTap,
          splashColor: kWhiteColor.withValues(alpha: 0.3),
          radius: 100,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                MyText(text: title, size: 14, weight: FontWeight.w400),
                CommonImageView(svgPath: icon),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
