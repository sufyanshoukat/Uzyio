class UserModel {
  String? id;
  String? name;
  String? email;
  String? profile;
  String? role;
  String? status;
  bool? isActive;
  String? fcmToken;
  String? createdAt;
  String? updatedAt;

  UserModel({
    this.id,
    this.name,
    this.email,
    this.profile,
    this.role,
    this.status,
    this.isActive,
    this.fcmToken,
    this.createdAt,
    this.updatedAt,
  });

  factory UserModel.fromJson(Map<String, dynamic>? json) {
    if (json == null) return UserModel();

    return UserModel(
      id: json.containsKey('id') ? json['id']?.toString() : null,
      name: json.containsKey('name') ? json['name']?.toString() : null,
      email: json.containsKey('email') ? json['email']?.toString() : null,
      profile: json.containsKey('profile') ? json['profile']?.toString() : null,
      role: json.containsKey('role') ? json['role']?.toString() : null,
      status: json.containsKey('status') ? json['status']?.toString() : null,
      isActive:
          json.containsKey('is_active') ? json['is_active'] as bool? : null,
      fcmToken:
          json.containsKey('fcm_token') ? json['fcm_token']?.toString() : null,
      createdAt:
          json.containsKey('created_at')
              ? json['created_at']?.toString()
              : null,
      updatedAt:
          json.containsKey('updated_at')
              ? json['updated_at']?.toString()
              : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "name": name,
      "email": email,
      "profile": profile,
      "role": role,
      "status": status,
      "is_active": isActive,
      "fcm_token": fcmToken,
      "created_at": createdAt,
      "updated_at": updatedAt,
    };
  }
}
