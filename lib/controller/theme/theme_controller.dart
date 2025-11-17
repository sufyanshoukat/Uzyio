import 'dart:developer';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ThemeController extends GetxController {
  RxBool isDarkTheme = true.obs;
  final String _counterKey = "app_open_counter";

  @override
  void onInit() {
    super.onInit();
    _handleThemeToggle();
  }

  Future<void> _handleThemeToggle() async {
    final prefs = await SharedPreferences.getInstance();

    // Read previous counter
    int counter = prefs.getInt(_counterKey) ?? 0;

    counter++;

    await prefs.setInt(_counterKey, counter);

    // Toggle theme based on odd or even
    if (counter % 2 == 1) {
      isDarkTheme.value = true; // odd
    } else {
      isDarkTheme.value = false; // even
    }

    log("✅ ----> App opened count: $counter");
    log("✅ ----> isDarkTheme: ${isDarkTheme.value}");
  }
}
