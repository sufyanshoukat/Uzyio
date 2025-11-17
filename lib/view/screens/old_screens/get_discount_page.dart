// import 'package:flutter/material.dart';
// import 'package:get/get_core/src/get_main.dart';
// import 'package:get/get_navigation/get_navigation.dart';
// import 'package:uzyio/constants/app_colors.dart';
// import 'package:uzyio/constants/app_images.dart';
// import 'package:uzyio/constants/app_sizes.dart';
// import 'package:uzyio/constants/app_styling.dart';
// import 'package:uzyio/view/screens/text_to_image/pick_photos.dart';
// import 'package:uzyio/view/widget/my_ripple_effect.dart';
// import 'package:uzyio/view/widget/my_text_widget.dart';
// import 'package:uzyio/view/widget/pro_card.dart';

// class GetDiscountPage extends StatefulWidget {
//   const GetDiscountPage({super.key});

//   @override
//   State<GetDiscountPage> createState() => _GetDiscountPageState();
// }

// class _GetDiscountPageState extends State<GetDiscountPage> {
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       decoration: AppStyling().background(image: Assets.imagesOffBk),
//       child: SafeArea(
//         child: Scaffold(
//           backgroundColor: kTransperentColor,
//           body: Padding(
//             padding: AppSizes.DEFAULT,
//             child: Column(
//               children: [
//                 // ----  Back & Pro Card -------
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   children: [
//                     IconButton(
//                       onPressed: () {
//                         Get.back();
//                       },
//                       icon: Icon(
//                         Icons.arrow_back_ios_new_rounded,
//                         color: kWhiteColor,
//                       ),
//                     ),
//                     ProBtn(),
//                   ],
//                 ),
//                 Spacer(flex: 2),

//                 // 50% OFF
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   children: [
//                     MyText(
//                       text: "50%",
//                       size: 50,
//                       weight: FontWeight.w700,
//                       color: kTertiaryColor,
//                     ),
//                     MyText(
//                       paddingLeft: 10,
//                       text: "OFF",
//                       size: 50,
//                       weight: FontWeight.w700,
//                       color: kWhiteColor,
//                     ),
//                   ],
//                 ),
//                 Spacer(),

//                 // List of detail user will get
//                 ...List.generate(4, (index) {
//                   List<String> items = [
//                     "Up to 100 PRO photos per day",
//                     "1000 gift coins for video now",
//                     "Up to 100 PRO photos per day",
//                     "No watermarks",
//                   ];
//                   return Padding(
//                     padding: EdgeInsets.only(bottom: (index < 3) ? 10 : 0),
//                     child: Row(
//                       children: [
//                         Icon(Icons.done, color: kWhiteColor, size: 16),
//                         MyText(
//                           paddingLeft: 10,
//                           text: items[index],
//                           size: 14,
//                           weight: FontWeight.w600,
//                         ),
//                       ],
//                     ),
//                   );
//                 }),

//                 Spacer(),

//                 // Continue Button
//                 ContinueButton(
//                   onTap: () {
//                     Get.to(() => PickPhotoPage());
//                   },
//                 ),
//                 MyText(
//                   paddingTop: 20,
//                   paddingBottom: 20,
//                   text: "Terms of Use  Privacy Restore",
//                   size: 13,
//                   weight: FontWeight.w600,
//                   color: kGreyTextColor,
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }

// class ContinueButton extends StatelessWidget {
//   final VoidCallback onTap;
//   const ContinueButton({super.key, required this.onTap});

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       height: 55,
//       width: Get.width,
//       decoration: BoxDecoration(
//         gradient: LinearGradient(colors: [kTertiaryColor, kSecondaryColor]),
//         borderRadius: BorderRadius.circular(100),
//       ),

//       child: MyRippleEffect(
//         onTap: onTap,
//         splashColor: kWhiteColor.withValues(alpha: 0.3),
//         radius: 100,
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,

//           children: [
//             MyText(text: "Continue", size: 16, weight: FontWeight.w700),
//             MyText(
//               text: "s1286.0 - s5000 / year",
//               size: 12,
//               weight: FontWeight.w500,
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
