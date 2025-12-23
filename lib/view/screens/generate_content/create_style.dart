import 'dart:developer';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get_instance/get_instance.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:get/state_manager.dart';
import 'package:uzyio/constants/app_colors.dart';
import 'package:uzyio/constants/app_images.dart';
import 'package:uzyio/constants/app_sizes.dart';
import 'package:uzyio/constants/app_styling.dart';
import 'package:uzyio/constants/loading_animation.dart';
import 'package:uzyio/controller/categories_controller/categories_controller.dart';
import 'package:uzyio/core/common/global_instance.dart';
import 'package:uzyio/services/user/user_services.dart';
import 'package:uzyio/view/widget/common_image_view_widget.dart';
import 'package:uzyio/view/widget/custom_dialog_widget.dart';
import 'package:uzyio/view/widget/custom_textfield.dart';
import 'package:uzyio/view/widget/general_appbar.dart';
import 'package:uzyio/view/widget/my_button.dart';
import 'package:uzyio/view/widget/my_text_widget.dart';

class CreateStylePage extends StatefulWidget {
  String endPoint;
  String credits;
  String templateID;
  CreateStylePage({
    super.key,
    required this.endPoint,
    required this.credits,
    required this.templateID,
  });

  @override
  State<CreateStylePage> createState() => _CreateStylePageState();
}

class _CreateStylePageState extends State<CreateStylePage> {
  CategoriesController _ctrl = Get.find<CategoriesController>();
  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (didPop, result) {
        if (didPop) return;
        _ctrl.pickedImageFile.value = null;
        Get.close(2);
      },
      child: Container(
        decoration: AppStyling().background(image: Assets.imagesBkImageSimple),
        child: Obx(
          () => Scaffold(
            backgroundColor: kTransperentColor,
            appBar: GeneralAppBar2(
              title: "Create Style",
              onBackTap: () {
                _ctrl.pickedImageFile.value = null;
                Get.close(2);
              },
            ),
            body: Padding(
              padding: AppSizes.DEFAULT,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  (_ctrl.pickedImageFile.value != null)
                      ? SizedBox.shrink()
                      : SizedBox(height: 100),

                  (_ctrl.pickedImageFile.value != null)
                      ? Align(
                        alignment: Alignment.center,
                        child: Column(
                          children: [
                            CommonImageView(
                              radius: 10,
                              height: 150,
                              width: Get.width / 2,
                              fit: BoxFit.cover,
                              file: File(_ctrl.pickedImageFile.value!),
                            ),
                            SizedBox(height: 20),

                            SizedBox(
                              width: 160,
                              child: MyButton(
                                onTap: () {
                                  Get.dialog(
                                    CustomDialog(child: TakePhotoPopup()),
                                  );
                                },
                                height: 40,
                                fontSize: 14,
                                isGradientBackground: false,
                                buttonText: "Update Image",
                                backgroundColor: kWhiteColor,
                                fontColor: kBlackColor,
                              ),
                            ),
                          ],
                        ),
                      )
                      : MyButton(
                        onTap: () {
                          Get.dialog(CustomDialog(child: TakePhotoPopup()));
                        },
                        isGradientBackground: false,
                        buttonText: "Upload Image",
                        backgroundColor: kWhiteColor,
                        fontColor: kBlackColor,
                      ),
                  Spacer(flex: 2),

                  MyText(
                    paddingBottom: 15,
                    text: "Type Your Prompt",
                    size: 20,
                    weight: FontWeight.w800,
                  ),

                  CustomTextField(
                    controller: _ctrl.promtController,
                    focusedBorderColor: kSecondaryColor,
                    outlineBorderColor: kTransperentColor,
                    backgroundColor: Color(0xff2C2C2C),
                    height: 150,
                    maxLines: 10,
                    contentPaddingTop: 20,
                    contentPaddingRight: 10,
                    contentPaddingLeft: 15,
                    hintText: "",
                    txtColor: kWhiteColor,
                  ),
                  MyButton(
                    mTop: 32,
                    mBottom: 18,
                    onTap: () async {
                      if (_ctrl.pickedImageFile.value == null) {
                        displayToast(msg: "Please pick an image");
                        return;
                      }
                      _ctrl.endPoint.value = widget.endPoint;

                      log("✅ EndPoint: ${_ctrl.endPoint.value}");
                      log("✅ Image: ${_ctrl.pickedImageFile.value}");
                      log("✅ Prompt: ${_ctrl.promtController.text}");

                      await _ctrl.createVideo(
                        endPoint: _ctrl.endPoint.value!,
                        image: _ctrl.pickedImageFile.value!,
                        prompt: _ctrl.promtController.text,
                        templateID: widget.templateID,
                      );

                      await UserService.instance.getUserInformation();
                    },
                    isGradientBackground: true,
                    buttonText: "Generate",
                  ),

                  Align(
                    alignment: Alignment.center,
                    child: MyText(
                      paddingBottom: 20,
                      text: "Credits ${widget.credits} required.",
                      size: 16,
                      weight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class TakePhotoPopup extends StatefulWidget {
  const TakePhotoPopup({super.key});

  @override
  State<TakePhotoPopup> createState() => _TakePhotoPopupState();
}

class _TakePhotoPopupState extends State<TakePhotoPopup> {
  CategoriesController _ctrl = Get.find<CategoriesController>();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 14, vertical: 20),
      decoration: AppStyling().myDecoration(
        color: kDarkGrey1Color,
        borderColor: kTransperentColor,
        radius: 20,
      ),
      child: Column(
        children: [
          MyText(text: "Take Photo From", size: 20, weight: FontWeight.w800),
          MyButton(
            mTop: 29,
            onTap: () async {
              await imagePicker.pickMedia(isImage: true, fromGallery: true);
              _ctrl.pickedImageFile.value = imagePicker.selectedImage.value;
              log("Image Picked: ${_ctrl.pickedImageFile.value}");
              Get.back();

              // Get.back();
              // showLoadingDialog();

              // await Future.delayed(Duration(seconds: 5), () {
              //   log("is This works");
              //   Get.to(
              //     () => ConvertImagePage(),
              //     duration: Duration(milliseconds: 600),
              //     transition: Transition.rightToLeft,
              //   );
              // });

              // Get.back();
              // Get.back();
            },
            buttonText: "Gallery",
            isGradientBackground: false,
            backgroundColor: kDarkGrey2Color,
          ),
          MyButton(
            mTop: 13,
            onTap: () async {
              await imagePicker.pickMedia(isImage: true, fromGallery: false);
              _ctrl.pickedImageFile.value = imagePicker.selectedImage.value;
              log("Image Picked: ${_ctrl.pickedImageFile.value}");
              Get.back();
              // Get.back();
              // showLoadingDialog();

              // await Future.delayed(Duration(seconds: 5), () {
              //   log("is This works");
              //   Get.to(
              //     () => ConvertImagePage(),
              //     duration: Duration(milliseconds: 600),
              //     transition: Transition.rightToLeft,
              //   );
              // });
            },
            buttonText: "Camera",
            isGradientBackground: false,
            backgroundColor: kDarkGrey2Color,
          ),
        ],
      ),
    );
  }
}
