// import 'package:flutter/material.dart';
// import 'package:get/get_core/src/get_main.dart';
// import 'package:get/get_navigation/get_navigation.dart';
// import 'package:uzyio/constants/app_colors.dart';
// import 'package:uzyio/constants/app_images.dart';
// import 'package:uzyio/constants/app_sizes.dart';
// import 'package:uzyio/constants/app_styling.dart';
// import 'package:uzyio/view/widget/common_image_view_widget.dart';
// import 'package:uzyio/view/widget/custom_dialog_widget.dart';
// import 'package:uzyio/view/widget/my_button.dart';
// import 'package:uzyio/view/widget/my_text_widget.dart';

// class PickPhotoPage extends StatefulWidget {
//   const PickPhotoPage({super.key});

//   @override
//   State<PickPhotoPage> createState() => _PickPhotoPageState();
// }

// class _PickPhotoPageState extends State<PickPhotoPage> {
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       decoration: AppStyling().background(image: Assets.imagesBkImage2),
//       child: SafeArea(
//         child: Scaffold(
//           backgroundColor: kTransperentColor,
//           body: Padding(
//             padding: AppSizes.DEFAULT,
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 SizedBox(height: 20),
//                 // Close Button
//                 InkWell(
//                   onTap: () {
//                     Get.back();
//                   },
//                   child: CommonImageView(svgPath: Assets.imagesCrossIconS),
//                 ),

//                 MyText(
//                   paddingBottom: 30,
//                   paddingTop: 40,
//                   text: "Pick 10-15 photos of yourself",
//                   size: 29,
//                   weight: FontWeight.w800,
//                 ),
//                 MyText(
//                   paddingBottom: 32,
//                   text: "For the best AI results, choose:",
//                   size: 17,
//                   weight: FontWeight.w800,
//                 ),

//                 // List of information
//                 // List of detail user will get
//                 ...List.generate(4, (index) {
//                   List<Map<String, String>> items = [
//                     {
//                       "icon": Assets.imagesP1,
//                       "text": "Your favorite personal photos",
//                     },
//                     {
//                       "icon": Assets.imagesP2,
//                       "text": "Clear and high resolution phiotos",
//                     },
//                     {
//                       "icon": Assets.imagesP3,
//                       "text": "Photos with different angels",
//                     },
//                     {"icon": Assets.imagesP4, "text": "Close ups photos"},
//                   ];
//                   return Padding(
//                     padding: EdgeInsets.only(
//                       bottom: (index < 3) ? 10 : 0,
//                       left: (index == 2) ? 4 : 0,
//                     ),
//                     child: Row(
//                       children: [
//                         CommonImageView(svgPath: items[index]['icon']),
//                         MyText(
//                           paddingLeft: 10,
//                           text: "${items[index]['text']}",
//                           size: 14,
//                           weight: FontWeight.w600,
//                         ),
//                       ],
//                     ),
//                   );
//                 }),

//                 MyText(
//                   paddingTop: 47,
//                   paddingBottom: 25,
//                   text: "Also recommend you to choose",
//                   size: 17,
//                   weight: FontWeight.w800,
//                 ),

//                 Row(
//                   children: [
//                     CommonImageView(
//                       height: 44,
//                       width: 44,
//                       imagePath: Assets.imagesAiGril1,
//                       radius: 100,
//                     ),
//                     SizedBox(width: 15),
//                     Expanded(
//                       child: MyText(
//                         text: "At  least 2 photos where you smile",
//                         size: 15,
//                         weight: FontWeight.w500,
//                       ),
//                     ),
//                   ],
//                 ),
//               ],
//             ),
//           ),
//           bottomNavigationBar: Padding(
//             padding: AppSizes.HORIZONTAL,
//             child: Column(
//               mainAxisSize: MainAxisSize.min,
//               children: [
//                 MyButton(
//                   mBottom: 20,
//                   onTap: () {
//                     Get.dialog(CustomDialog(child: TakePhotoPopup()));
//                   },
//                   buttonText: "+ Upload 10-15 Selfie",
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }

// class TakePhotoPopup extends StatefulWidget {
//   const TakePhotoPopup({super.key});

//   @override
//   State<TakePhotoPopup> createState() => _TakePhotoPopupState();
// }

// class _TakePhotoPopupState extends State<TakePhotoPopup> {
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       padding: EdgeInsets.symmetric(horizontal: 14, vertical: 20),
//       decoration: AppStyling().myDecoration(
//         color: kDarkGrey1Color,
//         borderColor: kTransperentColor,
//         radius: 20,
//       ),
//       child: Column(
//         children: [
//           MyText(text: "Take Photo From", size: 20, weight: FontWeight.w800),
//           MyButton(
//             mTop: 29,
//             onTap: () {
//               Get.back();
//             },
//             buttonText: "Gallery",
//             isGradientBackground: false,
//             backgroundColor: kDarkGrey2Color,
//           ),
//           MyButton(
//             mTop: 13,
//             onTap: () {
//               Get.back();
//             },
//             buttonText: "Camera",
//             isGradientBackground: false,
//             backgroundColor: kDarkGrey2Color,
//           ),
//         ],
//       ),
//     );
//   }
// }
