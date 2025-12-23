import 'package:firebase_messaging/firebase_messaging.dart';

String baseUrl = "http://192.168.100.14:3000/";
// String baseUrl = "http://34.201.148.222:3050/";
String getListCategoriesURL = "${baseUrl}api/user/categories/list?type=mobile";
String getTemplateURL({required String categoryID}) {
  return "${baseUrl}api/user/categories?category_list_id=$categoryID";
}

String getSingleTemplateURL({
  required String templateID,
  String deviceID = '123456',
}) {
  return "${baseUrl}api/user/templates/${templateID}?device_id=${deviceID}";
}

String getSeeAllTemplateURL({required String categoryID}) {
  return "${baseUrl}api/user/categories/${categoryID}";
}

// CREATE VIDEO
String createVideoURL = "${baseUrl}api/user/create-video";

// GET SLIDERI
String getSliderURL = "${baseUrl}api/user/slider?type=mobile";

// LOGIN API
String postAuthURL = "${baseUrl}api/auth/mobile";

// FCM TOKEN
getFcmToken() async {
  try {
    var token = await FirebaseMessaging.instance.getToken();
    return token;
  } catch (e) {
    return '';
  }
}

// GET USER
String getUserAPI = "${baseUrl}api/auth/me";

// GET MY CREATION
String getMyCreationAPI({required String id}) {
  return "${baseUrl}api/user/my-creations?user_id=$id";
}

// FEED API
String feedAPIURL({required String page, required String limit}) {
  return "${baseUrl}api/user/explore?page=$page&limit=$limit";
}

// REWARD API
String getRewardURL({String type = ''}) {
  return "${baseUrl}api/rewards?type=$type";
}

// Faqs
String getFaqsCategoriesURL = "${baseUrl}api/faq-categories";
String getFAQS(id) {
  return "${baseUrl}api/faqs?category_id=$id";
}

// REDEEM NOW
String redeemNowAPI = "api/rewards/rewards-request";

// Text TO IMAGE
String getTextToImageAPI = "${baseUrl}api/user/text-to-image";

// Text TO Video
String postTextToVideoAPI = "${baseUrl}api/user/text-to-video";

// REWARD COINS DETAIL / REWARD SETTING
String rewardSettingAPI = "${baseUrl}api/user/coins-settings";

// DAILY REWARD
String dailyRewardsAPI({required String id}) {
  return "${baseUrl}api/user/claim-reward?user_id=$id";
}

// REWARD COINS DETAIL / REWARD SETTING
String isLikeAPI = "${baseUrl}api/user/likes";
