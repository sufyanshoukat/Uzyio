// import 'package:flutter/material.dart';
// import 'package:uzyio/constants/app_colors.dart';
// import 'package:uzyio/constants/app_images.dart';
// import 'package:uzyio/constants/app_sizes.dart';
// import 'package:uzyio/constants/app_styling.dart';
// import 'package:uzyio/view/widget/custom_textfield.dart';
// import 'package:uzyio/view/widget/general_appbar.dart';
// import 'package:uzyio/view/widget/my_button.dart';
// import 'package:uzyio/view/widget/my_text_widget.dart';

// class VideoImagePage extends StatefulWidget {
//   const VideoImagePage({super.key});

//   @override
//   State<VideoImagePage> createState() => _VideoImagePageState();
// }

// class _VideoImagePageState extends State<VideoImagePage> {
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       decoration: AppStyling().background(image: Assets.imagesBackgroundImage3),
//       child: Scaffold(
//         backgroundColor: kTransperentColor,
//         appBar: GeneralAppBar2(title: "Image To Video"),
//         body: Padding(
//           padding: AppSizes.DEFAULT,
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Spacer(),
//               MyButton(
//                 onTap: () {},
//                 isGradientBackground: false,
//                 buttonText: "Upload Your Image",
//                 backgroundColor: kWhiteColor,
//                 fontColor: kBlackColor,
//               ),
//               Spacer(),

//               MyText(
//                 paddingBottom: 15,
//                 text: "Type Your Prompt",
//                 size: 20,
//                 weight: FontWeight.w800,
//               ),

//               CustomTextField(
//                 focusedBorderColor: kSecondaryColor,
//                 outlineBorderColor: kTransperentColor,
//                 backgroundColor: Color(0xff2C2C2C),
//                 height: 150,
//                 maxLines: 10,
//                 contentPaddingTop: 20,
//                 hintText: "",
//                 controller: TextEditingController(
//                   text:
//                       """Create a 9:16 photo of a highly relastix 3D minature of the uploaded object or person. Keep the original features, shape, materials, and any visible text and correct  layout and surface detail. Surround it with""",
//                 ),
//                 txtColor: kWhiteColor,
//               ),
//               MyButton(
//                 mTop: 32,
//                 mBottom: 23,
//                 onTap: () {},
//                 isGradientBackground: true,
//                 buttonText: "Generate Video",
//               ),

//               Align(
//                 alignment: Alignment.center,
//                 child: MyText(
//                   text: "10 Coins",
//                   size: 16,
//                   weight: FontWeight.w500,
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
