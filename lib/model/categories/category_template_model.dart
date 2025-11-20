class CategoryTemplateModel {
  final String message;
  final List<CategoryTemplateItem> categories;

  CategoryTemplateModel({required this.message, required this.categories});

  factory CategoryTemplateModel.fromJson(Map<String, dynamic> json) {
    return CategoryTemplateModel(
      message: json.containsKey('message') ? json['message'] ?? '' : '',
      categories:
          json.containsKey('categories') && json['categories'] is List
              ? (json['categories'] as List)
                  .map((e) => CategoryTemplateItem.fromJson(e))
                  .toList()
              : [],
    );
  }
}

class CategoryTemplateItem {
  final String id;
  final String name;
  final String? description;
  final bool isActive;
  final String createdAt;
  final String updatedAt;
  final List<TemplateItem> templates;

  CategoryTemplateItem({
    required this.id,
    required this.name,
    this.description,
    required this.isActive,
    required this.createdAt,
    required this.updatedAt,
    required this.templates,
  });

  factory CategoryTemplateItem.fromJson(Map<String, dynamic> json) {
    return CategoryTemplateItem(
      id: json.containsKey('id') ? json['id'] ?? '' : '',
      name: json.containsKey('name') ? json['name'] ?? '' : '',
      description: json.containsKey('description') ? json['description'] : null,
      isActive:
          json.containsKey('is_active') ? json['is_active'] ?? false : false,
      createdAt: json.containsKey('created_at') ? json['created_at'] ?? '' : '',
      updatedAt: json.containsKey('updated_at') ? json['updated_at'] ?? '' : '',
      templates:
          json.containsKey('templates') && json['templates'] is List
              ? (json['templates'] as List)
                  .map((e) => TemplateItem.fromJson(e))
                  .toList()
              : [],
    );
  }
}

class TemplateItem {
  final String id;
  final String title;
  final String coverImage;
  final bool isPremium;

  TemplateItem({
    required this.id,
    required this.title,
    required this.coverImage,
    required this.isPremium,
  });

  factory TemplateItem.fromJson(Map<String, dynamic> json) {
    return TemplateItem(
      id: json.containsKey('id') ? json['id'] ?? '' : '',
      title: json.containsKey('title') ? json['title'] ?? '' : '',
      coverImage:
          json.containsKey('cover_image') ? json['cover_image'] ?? '' : '',
      isPremium:
          json.containsKey('is_premium') ? json['is_premium'] ?? false : false,
    );
  }
}
