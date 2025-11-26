String baseUrl = "http://47.252.37.188:3050/";
String getListCategoriesURL = "${baseUrl}api/user/categories/list";
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
  // return "${baseUrl}api/user/categories/$categoryID";
  return "${baseUrl}api/user/categories/${categoryID}";
}

// CREATE VIDEO
String createVideoURL = "${baseUrl}api/user/create-video";

// GET SLIDER
String getSliderURL = "${baseUrl}api/user/slider";

// Login API
String postAuthURL = "${baseUrl}api/auth/mobile";
