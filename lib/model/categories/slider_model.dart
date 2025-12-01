class SliderResponse {
  final String message;
  final List<SliderData> sliders;

  SliderResponse({required this.message, required this.sliders});

  factory SliderResponse.fromJson(Map<String, dynamic> json) {
    return SliderResponse(
      message: json['message'] ?? '',
      sliders:
          json['sliders'] != null && json['sliders'] is List
              ? List<SliderData>.from(
                json['sliders'].map((item) => SliderData.fromJson(item)),
              )
              : [],
    );
  }
}

class SliderData {
  final String id;
  final String title;
  final int conis;
  final bool isPremium;
  final String apiEndpoint;
  final String prompt;
  final String coverImage;
  final int sliderPosition;
  final String type;
  final bool isVideo;

  SliderData({
    required this.id,
    required this.title,
    required this.conis,
    required this.isPremium,
    required this.apiEndpoint,
    required this.prompt,
    required this.coverImage,
    required this.sliderPosition,
    required this.type,
    required this.isVideo,
  });

  factory SliderData.fromJson(Map<String, dynamic> json) {
    return SliderData(
      id: json['id'] ?? '',
      title: json['title'] ?? '',
      conis: json['conis'] ?? 0,
      isPremium: json['is_premium'] ?? false,
      apiEndpoint: json['api_endpoint'] ?? '',
      prompt: json['prompt'] ?? '',
      coverImage: json['cover_image'] ?? '',
      sliderPosition: json['slider_postion'] ?? 0,
      type: json['type'] ?? '',
      isVideo: json['is_video'] ?? false,
    );
  }
}
