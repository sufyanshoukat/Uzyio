import 'package:flutter/material.dart';
import 'package:uzyio/constants/app_colors.dart';
import 'package:uzyio/constants/app_images.dart';
import 'package:uzyio/view/screens/feed/feed_page.dart';
import 'package:uzyio/view/screens/home/home.dart';
import 'package:uzyio/view/screens/home/view_images.dart';
import 'package:uzyio/view/screens/generate_content/text_to_image.dart';
import 'package:uzyio/view/screens/generate_content/text_to_video.dart';
import 'package:uzyio/view/widget/common_image_view_widget.dart';

// ignore: must_be_immutable
class MyNavBar extends StatefulWidget {
  int selectedIndex;
  MyNavBar({super.key, this.selectedIndex = 0});

  @override
  State<MyNavBar> createState() => _MyNavBarState();
}

class _MyNavBarState extends State<MyNavBar> {
  //int _selectedIndex = 0;
  void _onItemTapped(int index) {
    setState(() {
      widget.selectedIndex = index;
    });
  }

  List<Widget> screens = [
    TextToImagePage(),
    TextToVideoPage(),
    Homepage(),
    // VideoImagePage(),
    FeedPage(),
    ViewPublicContent(),
    // MarketPage(),
    // ClubeHousePage(),
    // SavedPage(),
    // UserProfileScreen(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(child: screens[widget.selectedIndex]),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: kBlackColor,
        showSelectedLabels: true,
        showUnselectedLabels: true,
        selectedItemColor: kWhiteColor,
        unselectedItemColor: Colors.grey,
        selectedFontSize: 11,
        unselectedFontSize: 11,
        // selectedLabelStyle: TextStyle(
        //   fontWeight: FontWeight.w500,
        //   fontFamily: AppFonts.SF_PRO_DISPLAY,
        // ),
        // unselectedLabelStyle: TextStyle(
        //   fontWeight: FontWeight.w400,
        //   fontFamily: AppFonts.SF_PRO_DISPLAY,
        // ),
        items: [
          BottomNavigationBarItem(
            backgroundColor: kWhiteColor,
            icon: MyNavItems(
              icon: Assets.imagesNavBarFillA,
              outlineIcon: Assets.imagesNavBarA,
              selectedColor: (widget.selectedIndex == 0) ? true : false,
            ),
            label: 'Image',
          ),
          BottomNavigationBarItem(
            backgroundColor: kPrimaryColor,
            icon: MyNavItems(
              icon: Assets.imagesNavBarFillB,
              outlineIcon: Assets.imagesNavBarB,
              selectedColor: (widget.selectedIndex == 1) ? true : false,
            ),
            label: 'Video',
          ),
          BottomNavigationBarItem(
            backgroundColor: kPrimaryColor,
            icon: MyNavItems(
              icon: Assets.imagesNavBarFillC,
              outlineIcon: Assets.imagesNavBarC,
              selectedColor: (widget.selectedIndex == 2) ? true : false,
            ),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            backgroundColor: kPrimaryColor,
            icon: MyNavItems(
              icon: Assets.imagesNavBarFillD,
              outlineIcon: Assets.imagesNavBarD,
              selectedColor: (widget.selectedIndex == 3) ? true : false,
            ),
            label: 'Explore',
          ),
          BottomNavigationBarItem(
            backgroundColor: kPrimaryColor,
            icon: MyNavItems(
              icon: Assets.imagesNavBarFillE,
              outlineIcon: Assets.imagesNavBarE,
              selectedColor: (widget.selectedIndex == 4) ? true : false,
            ),
            label: 'Rewards',
          ),
        ],
        currentIndex: widget.selectedIndex,
        onTap: _onItemTapped,
      ),
    );
  }
}

class MyNavItems extends StatelessWidget {
  final String? outlineIcon, icon;
  final bool selectedColor;
  final double iconHeight;
  const MyNavItems({
    super.key,
    this.outlineIcon,
    this.selectedColor = false,
    this.icon,
    this.iconHeight = 24,
  });

  @override
  Widget build(BuildContext context) {
    return CommonImageView(
      height: iconHeight,
      // width: 24,
      imagePath: (selectedColor) ? icon : outlineIcon,
      // imageColor: (selectedColor) ? kWhiteColor : Colors.grey.shade400,
    );
  }
}

// import 'package:flutter/material.dart';
// import 'package:uzyio/constants/app_colors.dart';
// import 'package:uzyio/constants/app_images.dart';
// import 'package:uzyio/constants/app_sizes.dart';
// import 'package:uzyio/constants/app_styling.dart';
// import 'package:uzyio/view/screens/home/home.dart';
// import 'package:uzyio/view/widget/common_image_view_widget.dart';

// class BottomNavExample extends StatefulWidget {
//   const BottomNavExample({super.key});

//   @override
//   State<BottomNavExample> createState() => _BottomNavExampleState();
// }

// class _BottomNavExampleState extends State<BottomNavExample> {
//   int _selectedIndex = 0;

//   final List<Widget> _screens = const [Homepage(), Homepage(), Homepage()];

//   void _onItemTapped(int index) {
//     setState(() {
//       _selectedIndex = index;
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       // backgroundColor: kTransperentColor,
//       primary: true,
//       extendBody: true,
//       body: _screens[_selectedIndex],

//       bottomNavigationBar: Container(
//         // margin: EdgeInsets.symmetric(horizontal: 30, vertical: 10),
//         decoration: BoxDecoration(
//           // borderRadius: BorderRadius.circular(100),
//           gradient: LinearGradient(
//             colors: [
//               const Color.fromARGB(255, 57, 14, 113).withValues(alpha: 1),
//               const Color.fromARGB(255, 5, 81, 86).withValues(alpha: 1),
//             ],
//             begin: Alignment.bottomCenter,
//             end: Alignment.topCenter,
//           ),
//         ),

//         // AppStyling().myDecoration(
//         //   radius: 100,
//         //   color: kSecondaryColor,
//         // ),
//         child: Padding(
//           padding: AppSizes.HORIZONTAL,
//           child: Row(
//             crossAxisAlignment: CrossAxisAlignment.end,
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               _buildNavItem(
//                 Assets.imagesMyHomeA,
//                 label: "Home",
//                 0,
//                 selectedColor:
//                     (_selectedIndex == 0) ? kWhiteColor : Colors.grey,
//               ),
//               SizedBox(width: 30),
//               _buildNavItem(Assets.imagesMyAddA, 1, isCenter: true),
//               SizedBox(width: 30),
//               _buildNavItem(
//                 Assets.imagesMyFeedA,
//                 label: "Play",
//                 2,
//                 selectedColor:
//                     (_selectedIndex == 2) ? kWhiteColor : Colors.grey,
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }

//   Widget _buildNavItem(
//     String icon,

//     int index, {
//     String? label,
//     Color? selectedColor,

//     bool isCenter = false,
//   }) {
//     final isSelected = _selectedIndex == index;
//     return InkWell(
//       onTap: () => _onItemTapped(index),
//       child: Padding(
//         padding: EdgeInsets.symmetric(vertical: isCenter ? 10 : 10),
//         child: Column(
//           mainAxisSize: MainAxisSize.min,
//           children: [
//             CommonImageView(
//               height: isCenter ? 50 : 22,
//               imagePath: icon,
//               imageColor: selectedColor,
//             ),
//             Visibility(
//               visible: (label != null) ? true : false,
//               child: Text(
//                 "$label",
//                 style: TextStyle(
//                   fontSize: 11,
//                   color: isSelected ? kWhiteColor : Colors.grey,
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
