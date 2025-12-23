class UserModel {
  String? id;
  String? name;
  String? email;
  String? password;
  String? profile;
  String? role;
  String? status;
  int? credits;
  int? coins;
  bool? isActive;
  String? fcmToken;
  String? createdAt;
  String? updatedAt;

  UserModel({
    this.id,
    this.name,
    this.email,
    this.password,
    this.profile,
    this.role,
    this.status,
    this.credits,
    this.coins,
    this.isActive,
    this.fcmToken,
    this.createdAt,
    this.updatedAt,
  });

  factory UserModel.fromJson(Map<String, dynamic>? json) {
    if (json == null) return UserModel();

    return UserModel(
      id: json['id']?.toString(),
      name: json['name']?.toString(),
      email: json['email']?.toString(),
      password: json['password']?.toString(),
      profile: json['profile']?.toString(),
      role: json['role']?.toString(),
      status: json['status']?.toString(),
      credits:
          json['credits'] is int
              ? json['credits']
              : int.tryParse(json['credits']?.toString() ?? "0"),
      coins:
          json['coins'] is int
              ? json['coins']
              : int.tryParse(json['coins']?.toString() ?? "0"),
      isActive: json['is_active'] as bool?,
      fcmToken: json['fcm_token']?.toString(),
      createdAt: json['created_at']?.toString(),
      updatedAt: json['updated_at']?.toString(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "name": name,
      "email": email,
      "password": password,
      "profile": profile,
      "role": role,
      "status": status,
      "credits": credits,
      "coins": coins,
      "is_active": isActive,
      "fcm_token": fcmToken,
      "created_at": createdAt,
      "updated_at": updatedAt,
    };
  }
}
