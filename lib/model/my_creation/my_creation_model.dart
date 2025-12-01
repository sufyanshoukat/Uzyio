class MyCreationResponse {
  bool? success;
  String? message;
  List<MyCreationModel>? data;

  MyCreationResponse({this.success, this.message, this.data});

  factory MyCreationResponse.fromJson(Map<String, dynamic>? json) {
    if (json == null) return MyCreationResponse();

    return MyCreationResponse(
      success: json.containsKey('success') ? json['success'] as bool? : null,
      message: json.containsKey('message') ? json['message']?.toString() : null,
      data:
          json.containsKey('data') && json['data'] is List
              ? (json['data'] as List)
                  .map((e) => MyCreationModel.fromJson(e))
                  .toList()
              : null,
    );
  }
}

class MyCreationModel {
  String? id;
  String? userId;
  String? templateId;
  String? title;
  String? file;
  bool? isPublish;
  String? createdAt;
  String? updatedAt;

  MyCreationModel({
    this.id,
    this.userId,
    this.templateId,
    this.title,
    this.file,
    this.isPublish,
    this.createdAt,
    this.updatedAt,
  });

  factory MyCreationModel.fromJson(Map<String, dynamic>? json) {
    if (json == null) return MyCreationModel();

    return MyCreationModel(
      id: json.containsKey('id') ? json['id']?.toString() : null,
      userId: json.containsKey('user_id') ? json['user_id']?.toString() : null,
      templateId:
          json.containsKey('template_id')
              ? json['template_id']?.toString()
              : null,
      title: json.containsKey('title') ? json['title']?.toString() : null,
      file: json.containsKey('file') ? json['file']?.toString() : null,
      isPublish:
          json.containsKey('is_publish') ? json['is_publish'] as bool? : null,
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
      "user_id": userId,
      "template_id": templateId,
      "title": title,
      "file": file,
      "is_publish": isPublish,
      "created_at": createdAt,
      "updated_at": updatedAt,
    };
  }
}
