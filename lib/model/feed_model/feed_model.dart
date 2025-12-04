class FeedModel {
  bool? success;
  Pagination? pagination;
  List<FeedCreation>? creations;

  FeedModel({this.success, this.pagination, this.creations});

  factory FeedModel.fromJson(Map<String, dynamic> json) {
    return FeedModel(
      success: json.containsKey("success") ? json["success"] : null,
      pagination:
          json.containsKey("pagination") && json["pagination"] != null
              ? Pagination.fromJson(json["pagination"])
              : null,
      creations:
          json.containsKey("creations") && json["creations"] != null
              ? List<FeedCreation>.from(
                json["creations"].map((x) => FeedCreation.fromJson(x)),
              )
              : [],
    );
  }

  Map<String, dynamic> toJson() => {
    "success": success,
    "pagination": pagination?.toJson(),
    "creations": creations?.map((x) => x.toJson()).toList(),
  };
}

// ------------------------- Pagination Model -------------------------

class Pagination {
  int? total;
  int? totalPages;
  int? currentPage;
  bool? nextPage;
  bool? prevPage;

  Pagination({
    this.total,
    this.totalPages,
    this.currentPage,
    this.nextPage,
    this.prevPage,
  });

  factory Pagination.fromJson(Map<String, dynamic> json) {
    return Pagination(
      total: json.containsKey("total") ? json["total"] : null,
      totalPages: json.containsKey("total_pages") ? json["total_pages"] : null,
      currentPage:
          json.containsKey("current_page") ? json["current_page"] : null,
      nextPage: json.containsKey("next_page") ? json["next_page"] : null,
      prevPage: json.containsKey("prev_page") ? json["prev_page"] : null,
    );
  }

  Map<String, dynamic> toJson() => {
    "total": total,
    "total_pages": totalPages,
    "current_page": currentPage,
    "next_page": nextPage,
    "prev_page": prevPage,
  };
}

// ------------------------- Creations Model -------------------------

class FeedCreation {
  String? id;
  String? title;
  String? file;
  String? templateId;
  String? userId;
  String? createdAt;
  String? creatorName;
  String? creatorProfile;
  int? conis;
  bool? isPremium;
  String? type;
  String? likeCount;
  String? shareCount;

  FeedCreation({
    this.id,
    this.title,
    this.file,
    this.templateId,
    this.userId,
    this.createdAt,
    this.creatorName,
    this.creatorProfile,
    this.conis,
    this.isPremium,
    this.type,
    this.likeCount,
    this.shareCount,
  });

  factory FeedCreation.fromJson(Map<String, dynamic> json) {
    return FeedCreation(
      id: json.containsKey("id") ? json["id"] : null,
      title: json.containsKey("title") ? json["title"] : null,
      file: json.containsKey("file") ? json["file"] : null,
      templateId: json.containsKey("template_id") ? json["template_id"] : null,
      userId: json.containsKey("user_id") ? json["user_id"] : null,
      createdAt: json.containsKey("created_at") ? json["created_at"] : null,
      creatorName:
          json.containsKey("creator_name") ? json["creator_name"] : null,
      creatorProfile:
          json.containsKey("creator_profile") ? json["creator_profile"] : null,
      conis: json.containsKey("conis") ? json["conis"] : null,
      isPremium: json.containsKey("is_premium") ? json["is_premium"] : null,
      type: json.containsKey("type") ? json["type"] : null,
      likeCount: json.containsKey("like_count") ? json["like_count"] : null,
      shareCount: json.containsKey("share_count") ? json["share_count"] : null,
    );
  }

  Map<String, dynamic> toJson() => {
    "id": id,
    "title": title,
    "file": file,
    "template_id": templateId,
    "user_id": userId,
    "created_at": createdAt,
    "creator_name": creatorName,
    "creator_profile": creatorProfile,
    "conis": conis,
    "is_premium": isPremium,
    "type": type,
    "like_count": likeCount,
    "share_count": shareCount,
  };
}
