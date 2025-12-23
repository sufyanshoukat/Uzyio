class SubscriptionCategory {
  final String id;
  final String name;
  final String description;
  final String type;
  final int displayOrder;
  final bool isActive;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final int planCount;

  SubscriptionCategory({
    required this.id,
    required this.name,
    required this.description,
    required this.type,
    required this.displayOrder,
    required this.isActive,
    required this.createdAt,
    required this.updatedAt,
    required this.planCount,
  });

  factory SubscriptionCategory.fromJson(Map<String, dynamic> json) {
    return SubscriptionCategory(
      id: json.containsKey('id') ? json['id'] ?? '' : '',
      name: json.containsKey('name') ? json['name'] ?? '' : '',
      description:
          json.containsKey('description') ? json['description'] ?? '' : '',
      type: json.containsKey('type') ? json['type'] ?? '' : '',
      displayOrder:
          json.containsKey('display_order') ? (json['display_order'] ?? 0) : 0,
      isActive:
          json.containsKey('is_active') ? json['is_active'] ?? false : false,
      createdAt:
          json.containsKey('created_at') && json['created_at'] != null
              ? DateTime.tryParse(json['created_at'])
              : null,
      updatedAt:
          json.containsKey('updated_at') && json['updated_at'] != null
              ? DateTime.tryParse(json['updated_at'])
              : null,
      planCount:
          json.containsKey('plan_count')
              ? int.tryParse(json['plan_count'].toString()) ?? 0
              : 0,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'description': description,
      'type': type,
      'display_order': displayOrder,
      'is_active': isActive,
      'created_at': createdAt?.toIso8601String(),
      'updated_at': updatedAt?.toIso8601String(),
      'plan_count': planCount,
    };
  }
}
