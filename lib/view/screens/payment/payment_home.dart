import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shimmer/shimmer.dart';
import 'package:uzyio/constants/app_colors.dart';
import 'package:uzyio/constants/app_sizes.dart';
import 'package:uzyio/constants/app_styling.dart';
import 'package:uzyio/controller/payment_controller/payment_controller.dart';
import 'package:uzyio/view/widget/animation_widget.dart';
import 'package:uzyio/view/widget/general_appbar.dart';
import 'package:uzyio/view/widget/my_button.dart';
import 'package:uzyio/view/widget/my_text_widget.dart';

class PaymentHomePage extends StatefulWidget {
  const PaymentHomePage({super.key});

  @override
  State<PaymentHomePage> createState() => _PaymentHomePageState();
}

class _PaymentHomePageState extends State<PaymentHomePage>
    with SingleTickerProviderStateMixin {
  final ctrl = Get.put(PaymentController());

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
        backgroundColor: kBKBlackColor,
        appBar: GeneralAppBar(title: "Subscriptions"),
        body: SafeArea(
          child: SingleChildScrollView(
            padding: AppSizes.DEFAULT,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // REWARD TYPE BUTTON
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Padding(
                    padding: EdgeInsets.symmetric(vertical: 18),
                    child: Row(
                      children: List.generate(ctrl.subscriptionCategory.length, (
                        index,
                      ) {
                        return Container(
                          padding: EdgeInsets.symmetric(horizontal: 20),
                          margin: EdgeInsets.only(right: (index == 2) ? 0 : 10),
                          height: 40,
                          decoration:
                              (ctrl.subscriptionTypeIndex == index)
                                  ? AppStyling().gradientBK()
                                  : AppStyling().myDecoration(
                                    color: kDarkGrey1Color,
                                    borderColor: kTransperentColor,
                                  ),
                          child: InkWell(
                            onTap: () {
                              ctrl.subscriptionTypeIndex.value = index;
                            },
                            child: Center(
                              child: MyText(
                                text:
                                    "${ctrl.subscriptionCategory[index].name}",
                              ),
                            ),
                          ),
                        );
                      }),
                    ),
                  ),
                ),

                // REWARD CARDS
                (ctrl.isPlanLoading.value == true &&
                        ctrl.subscriptionPlans.isEmpty)
                    ? ListView.builder(
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      itemCount:
                          6, // number of shimmer placeholder cards you want
                      itemBuilder: (context, index) {
                        return const ShimmerPremiumCard();
                      },
                    )
                    : (ctrl.isPlanLoading.value == true &&
                        ctrl.subscriptionPlans.isEmpty)
                    ? Center(child: MyText(text: "No reward found!"))
                    : ListView.builder(
                      shrinkWrap: true,
                      itemCount: ctrl.subscriptionPlans.length,
                      physics: NeverScrollableScrollPhysics(),
                      // gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      //   crossAxisCount: 2,
                      //   mainAxisSpacing: 13,
                      //   crossAxisSpacing: 10,
                      //   mainAxisExtent: 330,
                      // ),
                      itemBuilder: (context, index) {
                        var model = ctrl.subscriptionPlans[index];
                        return FadeSlideTransition(
                          delay: 300 + index * 100,
                          child: SubscriptionPlanCard(
                            name: model.name,
                            description: model.description,
                            price: model.price,
                            currency: model.currency,
                            billingPeriod: model.billingPeriod,
                            credit: model.credit,
                            isPopular: model.isPopular,
                            isActive: model.isActive,
                            onTap: () {
                              ctrl.subscribeNowMethod(
                                subscription_plan_id: model.id,
                                payment_method: "card",
                                transaction_id: "223344",
                                auto_renew: true,
                              );
                            },
                          ),

                          // PremiumCard(
                          //   title: model.title.toString(),
                          //   subTitle: model.description.toString(),
                          //   coins: model.coins.toString(),
                          //   type: model.type.toString(),
                          //   imageUrl: "${model.images?[0]}",
                          //   onTap: () {
                          //     Get.to(
                          //       () => RewardDetailsPage(),
                          //       arguments: {'data': model},
                          //     );
                          //   },
                          // ),
                        );
                      },
                    ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

// // ------------------ PREMIUM CARD ------------------
// class PremiumCard extends StatelessWidget {
//   final String imageUrl, type, title, subTitle, coins;
//   final VoidCallback onTap;

//   const PremiumCard({
//     super.key,
//     required this.imageUrl,
//     required this.type,
//     required this.title,
//     required this.subTitle,
//     required this.coins,
//     required this.onTap,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       // width: 210,
//       decoration: BoxDecoration(
//         color: kBKBlackColor,
//         borderRadius: BorderRadius.circular(14),
//         border: Border.all(color: kPrimaryColor.withValues(alpha: 0.2)),
//       ),
//       child: InkWell(
//         onTap: onTap,
//         child: Column(
//           // mainAxisAlignment: MainAxisAlignment.spaceBetween,
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             // IMAGE WITH TAG
//             Stack(
//               children: [
//                 ClipRRect(
//                   borderRadius: const BorderRadius.only(
//                     topLeft: Radius.circular(12),
//                     topRight: Radius.circular(12),
//                   ),
//                   child: CommonImageView(
//                     radius: 0,
//                     url: imageUrl,
//                     height: 200,
//                     width: double.infinity,
//                     fit: BoxFit.cover,
//                   ),
//                 ),

//                 Positioned(
//                   right: 10,
//                   top: 10,
//                   child: Container(
//                     padding: const EdgeInsets.symmetric(
//                       horizontal: 8,
//                       vertical: 4,
//                     ),
//                     decoration: BoxDecoration(
//                       color: kBlackColor,
//                       borderRadius: BorderRadius.circular(12),
//                     ),
//                     child: Text(
//                       type,
//                       style: TextStyle(
//                         fontSize: 12,
//                         color: Colors.white,
//                         fontWeight: FontWeight.w400,
//                       ),
//                     ),
//                   ),
//                 ),
//               ],
//             ),

//             // TEXT SECTION
//             Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Padding(
//                   padding: const EdgeInsets.fromLTRB(10, 8, 10, 4),
//                   child: MyText(
//                     text: title,
//                     size: 16,
//                     weight: FontWeight.w400,
//                     color: Colors.white,
//                   ),
//                 ),
//                 Padding(
//                   padding: const EdgeInsets.fromLTRB(10, 0, 10, 10),
//                   child: MyText(
//                     text: subTitle,
//                     size: 13,
//                     weight: FontWeight.w400,
//                   ),
//                 ),

//                 // COINS BADGE
//                 Padding(
//                   padding: const EdgeInsets.only(left: 10, bottom: 5),
//                   child: Container(
//                     height: 30,
//                     padding: const EdgeInsets.symmetric(
//                       horizontal: 12,
//                       vertical: 6,
//                     ),
//                     decoration: BoxDecoration(
//                       gradient: const LinearGradient(
//                         colors: [Color(0xff00C6FF), Color(0xff7F00FF)],
//                       ),
//                       borderRadius: BorderRadius.circular(10),
//                     ),
//                     child: MyText(
//                       text: "$coins coins",
//                       size: 14,
//                       weight: FontWeight.w400,
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

class ShimmerPremiumCard extends StatelessWidget {
  const ShimmerPremiumCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey.withOpacity(0.2),
      highlightColor: Colors.grey.withOpacity(0.4),
      child: Container(
        width: 210,
        decoration: BoxDecoration(
          color: Color(0xff1A1A1A),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Image Skeleton
            Container(
              height: 160,
              decoration: BoxDecoration(
                color: Colors.grey.withOpacity(0.3),
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(13),
                  topRight: Radius.circular(20),
                ),
              ),
            ),

            // Text section skeletons
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Title skeleton
                Padding(
                  padding: const EdgeInsets.fromLTRB(14, 14, 14, 4),
                  child: Container(
                    height: 16,
                    width: 100,
                    decoration: BoxDecoration(
                      color: Colors.grey.withOpacity(0.3),
                      borderRadius: BorderRadius.circular(6),
                    ),
                  ),
                ),

                // Sub title skeleton
                Padding(
                  padding: const EdgeInsets.fromLTRB(14, 0, 14, 12),
                  child: Container(
                    height: 13,
                    width: 150,
                    decoration: BoxDecoration(
                      color: Colors.grey.withOpacity(0.3),
                      borderRadius: BorderRadius.circular(6),
                    ),
                  ),
                ),

                // Coins badge skeleton
                Padding(
                  padding: const EdgeInsets.only(left: 14, bottom: 14),
                  child: Container(
                    height: 26,
                    width: 70,
                    decoration: BoxDecoration(
                      color: Colors.grey.withOpacity(0.3),
                      borderRadius: BorderRadius.circular(14),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class SubscriptionPlanCard extends StatelessWidget {
  final String name;
  final String description;
  final String price;
  final String currency;
  final String billingPeriod;
  final int credit;
  final bool isPopular;
  final bool isActive;
  final VoidCallback onTap;

  const SubscriptionPlanCard({
    super.key,
    required this.name,
    required this.description,
    required this.price,
    required this.currency,
    required this.billingPeriod,
    required this.credit,
    required this.isPopular,
    required this.isActive,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 6,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            /// 🔥 Popular badge
            if (isPopular)
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 10,
                  vertical: 4,
                ),
                decoration: BoxDecoration(
                  color: Colors.orange,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: const Text(
                  'POPULAR',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),

            const SizedBox(height: 8),

            /// 📌 Plan name
            Text(
              name,
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),

            const SizedBox(height: 6),

            /// 📝 Description
            if (description.isNotEmpty)
              Text(description, style: TextStyle(color: Colors.grey.shade600)),

            const SizedBox(height: 16),

            /// 💰 Price
            Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  '$currency $price',
                  style: const TextStyle(
                    fontSize: 26,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(width: 6),
                Text(
                  '/ $billingPeriod',
                  style: TextStyle(color: Colors.grey.shade600),
                ),
              ],
            ),

            const SizedBox(height: 16),

            /// ⚡ Credits
            Row(
              children: [
                const Icon(Icons.flash_on, color: Colors.amber),
                const SizedBox(width: 6),
                Text(
                  '$credit Credits',
                  style: const TextStyle(fontWeight: FontWeight.w600),
                ),
              ],
            ),

            const SizedBox(height: 20),

            /// 🚀 Action button
            Align(
              alignment: Alignment.center,
              child: SizedBox(
                width: 200,
                child: MyButton(
                  height: 50,

                  onTap: isActive ? onTap : onTap,
                  buttonText: isActive ? 'Subscribe Now' : 'Unavailable',
                ),
              ),
            ),
            // SizedBox(
            //   width: double.infinity,
            //   child: ElevatedButton(
            //     style: ElevatedButton.styleFrom(
            //       backgroundColor:
            //           isActive ? Colors.blue : Colors.grey.shade400,
            //       shape: RoundedRectangleBorder(
            //         borderRadius: BorderRadius.circular(12),
            //       ),
            //       padding: const EdgeInsets.symmetric(vertical: 14),
            //     ),
            //     onPressed: isActive ? () {} : null,
            //     child: Text(
            //       isActive ? 'Subscribe Now' : 'Unavailable',
            //       style: const TextStyle(
            //         fontSize: 16,
            //         fontWeight: FontWeight.bold,
            //       ),
            //     ),
            //   ),
            // ),
          ],
        ),
      ),
    );
  }
}
