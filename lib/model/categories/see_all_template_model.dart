class SeeAllTempleteModel {
  final String? message;
  final Category? categories;

  SeeAllTempleteModel({this.message, this.categories});

  factory SeeAllTempleteModel.fromJson(Map<String, dynamic> json) {
    return SeeAllTempleteModel(
      message: json['message'],
      categories:
          json['categories'] != null
              ? Category.fromJson(json['categories'])
              : null,
    );
  }
}

class Category {
  final String? id;
  final String? name;
  final String? description;
  final bool? isActive;
  final String? createdAt;
  final String? updatedAt;
  final String? categoryListId;
  final List<TemplateItem> templates;

  Category({
    this.id,
    this.name,
    this.description,
    this.isActive,
    this.createdAt,
    this.updatedAt,
    this.categoryListId,
    required this.templates,
  });

  factory Category.fromJson(Map<String, dynamic> json) {
    return Category(
      id: json['id'],
      name: json['name'],
      description: json['description'],
      isActive: json['is_active'],
      createdAt: json['created_at'],
      updatedAt: json['updated_at'],
      categoryListId: json['category_list_id'],
      templates:
          (json['templates'] as List<dynamic>?)
              ?.map((e) => TemplateItem.fromJson(e))
              .toList() ??
          [],
    );
  }
}

class TemplateItem {
  final String? id;
  final String? title;
  final String? coverImage;
  final bool? isPremium;
  final bool? isVideo;

  TemplateItem({
    this.id,
    this.title,
    this.coverImage,
    this.isPremium,
    this.isVideo,
  });

  factory TemplateItem.fromJson(Map<String, dynamic> json) {
    return TemplateItem(
      id: json['id'],
      title: json['title'],
      coverImage: json['cover_image'],
      isPremium: json['is_premium'],
      isVideo: json['is_video'],
    );
  }
}
