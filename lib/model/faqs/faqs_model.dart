class FaqsModel {
  bool? success;
  List<Faq>? faqs;

  FaqsModel({this.success, this.faqs});

  FaqsModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    if (json['faqs'] != null) {
      faqs = <Faq>[];
      json['faqs'].forEach((v) {
        faqs!.add(Faq.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['success'] = success;
    if (faqs != null) {
      data['faqs'] = faqs!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Faq {
  String? id;
  String? categoryId;
  String? question;
  String? answer;
  int? displayOrder;
  bool? isActive;
  String? createdAt;
  String? updatedAt;

  Faq({
    this.id,
    this.categoryId,
    this.question,
    this.answer,
    this.displayOrder,
    this.isActive,
    this.createdAt,
    this.updatedAt,
  });

  Faq.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    categoryId = json['category_id'];
    question = json['question'];
    answer = json['answer'];
    displayOrder = json['display_order'];
    isActive = json['is_active'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['id'] = id;
    data['category_id'] = categoryId;
    data['question'] = question;
    data['answer'] = answer;
    data['display_order'] = displayOrder;
    data['is_active'] = isActive;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    return data;
  }
}
