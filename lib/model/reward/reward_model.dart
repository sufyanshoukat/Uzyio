class RewardModel {
  final String? id;
  final String? userId;
  final int? coins;
  final String? title;
  final String? description;
  final List<String>? images;
  final String? type;
  final int? templateUsageCount;
  final bool? isActive;
  final String? createdAt;
  final String? updatedAt;
  final String? userName;
  final String? userEmail;

  RewardModel({
    this.id,
    this.userId,
    this.coins,
    this.title,
    this.description,
    this.images,
    this.type,
    this.templateUsageCount,
    this.isActive,
    this.createdAt,
    this.updatedAt,
    this.userName,
    this.userEmail,
  });

  factory RewardModel.fromJson(Map<String, dynamic> json) {
    return RewardModel(
      id: json['id'],
      userId: json['user_id'],
      coins: json['coins'],
      title: json['title'],
      description: json['description'],
      images: json['images'] != null ? List<String>.from(json['images']) : [],
      type: json['type'],
      templateUsageCount: json['template_usage_count'],
      isActive: json['is_active'],
      createdAt: json['created_at'],
      updatedAt: json['updated_at'],
      userName: json['user_name'],
      userEmail: json['user_email'],
    );
  }

  Map<String, dynamic> toJson() => {
    "id": id,
    "user_id": userId,
    "coins": coins,
    "title": title,
    "description": description,
    "images": images,
    "type": type,
    "template_usage_count": templateUsageCount,
    "is_active": isActive,
    "created_at": createdAt,
    "updated_at": updatedAt,
    "user_name": userName,
    "user_email": userEmail,
  };
}
