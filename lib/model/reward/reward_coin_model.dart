// reward_coin_model.dart

class RewardCoinModel {
  bool? success;
  List<RewardData>? data;

  RewardCoinModel({this.success, this.data});

  factory RewardCoinModel.fromJson(Map<String, dynamic> json) {
    return RewardCoinModel(
      success: json['success'] as bool?,
      data:
          json['data'] != null
              ? List<RewardData>.from(
                (json['data'] as List).map((item) => RewardData.fromJson(item)),
              )
              : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'success': success,
      'data': data?.map((item) => item.toJson()).toList(),
    };
  }
}

class RewardData {
  String? key;
  String? label;
  int? value;

  RewardData({this.key, this.label, this.value});

  factory RewardData.fromJson(Map<String, dynamic> json) {
    return RewardData(
      key: json['key'] as String?,
      label: json['label'] as String?,
      value:
          json['value'] != null ? int.tryParse(json['value'].toString()) : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {'key': key, 'label': label, 'value': value};
  }
}
