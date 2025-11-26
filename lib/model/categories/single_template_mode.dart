class SingleTemplateModel {
  final bool success;
  final TemplateData template;

  SingleTemplateModel({required this.success, required this.template});

  factory SingleTemplateModel.fromJson(Map<String, dynamic> json) {
    return SingleTemplateModel(
      success: json.containsKey('success') ? json['success'] ?? false : false,
      template:
          json.containsKey('template') && json['template'] is Map
              ? TemplateData.fromJson(json['template'])
              : TemplateData.empty(),
    );
  }
}

class TemplateData {
  final String id;
  final String title;
  final int coins;
  final bool isPremium;
  final String apiEndpoint;
  final String prompt;
  final String coverImage;
  final List<String> videos;
  final bool isActive;
  final String createdAt;
  final String updatedAt;
  final TemplateCategory category;
  final TemplateStats stats;

  TemplateData({
    required this.id,
    required this.title,
    required this.coins,
    required this.isPremium,
    required this.apiEndpoint,
    required this.prompt,
    required this.coverImage,
    required this.videos,
    required this.isActive,
    required this.createdAt,
    required this.updatedAt,
    required this.category,
    required this.stats,
  });

  factory TemplateData.fromJson(Map<String, dynamic> json) {
    return TemplateData(
      id: json.containsKey('id') ? json['id'] ?? '' : '',
      title: json.containsKey('title') ? json['title'] ?? '' : '',
      coins: json.containsKey('conis') ? (json['conis'] ?? 0) : 0,
      isPremium:
          json.containsKey('is_premium') ? json['is_premium'] ?? false : false,
      apiEndpoint:
          json.containsKey('api_endpoint') ? json['api_endpoint'] ?? '' : '',
      prompt: json.containsKey('prompt') ? json['prompt'] ?? '' : '',
      coverImage:
          json.containsKey('cover_image') ? json['cover_image'] ?? '' : '',
      videos:
          json.containsKey('videos') && json['videos'] is List
              ? List<String>.from(json['videos'].map((v) => v.toString()))
              : [],
      isActive:
          json.containsKey('is_active') ? json['is_active'] ?? false : false,
      createdAt: json.containsKey('created_at') ? json['created_at'] ?? '' : '',
      updatedAt: json.containsKey('updated_at') ? json['updated_at'] ?? '' : '',
      category:
          json.containsKey('category') && json['category'] is Map
              ? TemplateCategory.fromJson(json['category'])
              : TemplateCategory.empty(),
      stats:
          json.containsKey('stats') && json['stats'] is Map
              ? TemplateStats.fromJson(json['stats'])
              : TemplateStats.empty(),
    );
  }

  factory TemplateData.empty() {
    return TemplateData(
      id: '',
      title: '',
      coins: 0,
      isPremium: false,
      apiEndpoint: '',
      prompt: '',
      coverImage: '',
      videos: [],
      isActive: false,
      createdAt: '',
      updatedAt: '',
      category: TemplateCategory.empty(),
      stats: TemplateStats.empty(),
    );
  }
}

class TemplateCategory {
  final String? id;
  final String? name;
  final String? listId;
  final String? listName;

  TemplateCategory({
    required this.id,
    required this.name,
    required this.listId,
    required this.listName,
  });

  factory TemplateCategory.fromJson(Map<String, dynamic> json) {
    return TemplateCategory(
      id: json.containsKey('id') ? json['id'] : null,
      name: json.containsKey('name') ? json['name'] : null,
      listId: json.containsKey('list_id') ? json['list_id'] : null,
      listName: json.containsKey('list_name') ? json['list_name'] : null,
    );
  }

  factory TemplateCategory.empty() {
    return TemplateCategory(id: null, name: null, listId: null, listName: null);
  }
}

class TemplateStats {
  final int totalLikes;
  final int totalShares;
  final bool isLiked;

  TemplateStats({
    required this.totalLikes,
    required this.totalShares,
    required this.isLiked,
  });

  factory TemplateStats.fromJson(Map<String, dynamic> json) {
    return TemplateStats(
      totalLikes:
          json.containsKey('total_likes') ? json['total_likes'] ?? 0 : 0,
      totalShares:
          json.containsKey('total_shares') ? json['total_shares'] ?? 0 : 0,
      isLiked: json.containsKey('is_liked') ? json['is_liked'] ?? false : false,
    );
  }

  factory TemplateStats.empty() {
    return TemplateStats(totalLikes: 0, totalShares: 0, isLiked: false);
  }
}

// SLIDER SMALL MODEL

class SliderResponse {
  final String message;
  final List<TemplateData> sliders;

  SliderResponse({required this.message, required this.sliders});

  factory SliderResponse.fromJson(Map<String, dynamic> json) {
    return SliderResponse(
      message: json['message'] ?? '',
      sliders:
          json['sliders'] != null && json['sliders'] is List
              ? List<TemplateData>.from(
                json['sliders'].map((item) => TemplateData.fromJson(item)),
              )
              : [],
    );
  }
}
