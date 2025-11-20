class CategoryListModel {
  final String message;
  final List<CategoryItem> lists;

  CategoryListModel({required this.message, required this.lists});

  factory CategoryListModel.fromJson(Map<String, dynamic> json) {
    return CategoryListModel(
      message: json.containsKey('message') ? json['message'] ?? '' : '',
      lists:
          json.containsKey('lists') && json['lists'] is List
              ? (json['lists'] as List)
                  .map((e) => CategoryItem.fromJson(e))
                  .toList()
              : [],
    );
  }
}

class CategoryItem {
  final String id;
  final String name;
  final String? description;
  final String image;
  final bool isActive;
  final String createdAt;
  final String updatedAt;

  CategoryItem({
    required this.id,
    required this.name,
    this.description,
    required this.image,
    required this.isActive,
    required this.createdAt,
    required this.updatedAt,
  });

  factory CategoryItem.fromJson(Map<String, dynamic> json) {
    return CategoryItem(
      id: json.containsKey('id') ? json['id'] ?? '' : '',
      name: json.containsKey('name') ? json['name'] ?? '' : '',
      description: json.containsKey('description') ? json['description'] : null,
      image: json.containsKey('image') ? json['image'] ?? '' : '',
      isActive:
          json.containsKey('is_active') ? json['is_active'] ?? false : false,
      createdAt: json.containsKey('created_at') ? json['created_at'] ?? '' : '',
      updatedAt: json.containsKey('updated_at') ? json['updated_at'] ?? '' : '',
    );
  }
}
