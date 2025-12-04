import 'dart:developer';
import 'package:get/get.dart';
import 'package:uzyio/constants/end_points.dart';
import 'package:uzyio/core/common/global_instance.dart';
import 'package:uzyio/model/feed_model/feed_model.dart';

class FeedController extends GetxController {
  /// DATA
  RxList<FeedCreation> feedList = <FeedCreation>[].obs;

  /// STATES
  RxBool isLoading = false.obs;
  RxBool isMoreLoading = false.obs;

  /// Pagination
  int currentPage = 1;
  final int limit = 10;
  bool hasNextPage = true;
  bool isLoadingMore = false; // Prevent multiple simultaneous loads

  /// INITIAL CALL
  @override
  void onInit() {
    super.onInit();
    fetchFeed();
  }

  /// FETCH FIRST PAGE
  Future<void> fetchFeed() async {
    if (isLoading.value) return; // Prevent multiple calls

    try {
      isLoading(true);
      currentPage = 1; // Reset to first page
      log("📡 Fetching FEED page: $currentPage");

      final response = await apiService.get(
        feedAPIURL(page: currentPage.toString(), limit: limit.toString()),
        false,
        showResult: false,
        successCode: 200,
      );

      if (response != null) {
        FeedModel body = FeedModel.fromJson(response);

        /// Save data
        feedList.assignAll(body.creations ?? []);

        /// Pagination update
        hasNextPage = body.pagination?.nextPage ?? false;
        log("✅ Loaded ${feedList.length} items. Has next page: $hasNextPage");
      } else {
        log("⚠️ Response is null");
      }
    } catch (e) {
      log("❌ FEED ERROR: $e");
      // Show error to user if needed
    } finally {
      isLoading(false);
    }
  }

  /// LOAD MORE WHEN USER SCROLLS
  Future<void> loadMore() async {
    // Prevent multiple simultaneous calls
    if (!hasNextPage || isMoreLoading.value || isLoadingMore) {
      log(
        "⏸️ Load more skipped - hasNext: $hasNextPage, isLoading: ${isMoreLoading.value}",
      );
      return;
    }

    try {
      isLoadingMore = true;
      isMoreLoading(true);
      currentPage++;
      log("⬆ Loading More: Page $currentPage");

      final response = await apiService.get(
        feedAPIURL(page: currentPage.toString(), limit: limit.toString()),
        false,
        showResult: false,
        successCode: 200,
      );

      if (response != null) {
        FeedModel body = FeedModel.fromJson(response);

        /// Append new data (avoid duplicates)
        final newItems = body.creations ?? [];
        if (newItems.isNotEmpty) {
          feedList.addAll(newItems);
          log(
            "✅ Added ${newItems.length} more items. Total: ${feedList.length}",
          );
        }

        hasNextPage = body.pagination?.nextPage ?? false;
      } else {
        log("⚠️ Load more response is null");
        // Don't increment page if failed
        currentPage--;
      }
    } catch (e) {
      log("❌ LOAD MORE ERROR: $e");
      currentPage--; // Revert page increment on error
    } finally {
      isMoreLoading(false);
      isLoadingMore = false;
    }
  }

  /// Refresh feed (pull to refresh)
  Future<void> refreshFeed() async {
    currentPage = 1;
    hasNextPage = true;
    await fetchFeed();
  }

  @override
  void onClose() {
    // Clean up if needed
    super.onClose();
  }
}
