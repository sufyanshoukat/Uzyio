class SubscriptionPlan {
  final String id;
  final String planCategoryId;
  final String name;
  final String description;
  final String price;
  final String currency;
  final String billingPeriod;
  final int credit;
  final String googleBillingId;
  final String appleBillingId;
  final bool canControlPrivacy;
  final String defaultCreationPrivacy;
  final Map<String, dynamic> features;
  final bool isPopular;
  final bool isActive;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final String? type;

  SubscriptionPlan({
    required this.id,
    required this.planCategoryId,
    required this.name,
    required this.description,
    required this.price,
    required this.currency,
    required this.billingPeriod,
    required this.credit,
    required this.googleBillingId,
    required this.appleBillingId,
    required this.canControlPrivacy,
    required this.defaultCreationPrivacy,
    required this.features,
    required this.isPopular,
    required this.isActive,
    required this.createdAt,
    required this.updatedAt,
    required this.type,
  });

  factory SubscriptionPlan.fromJson(Map<String, dynamic> json) {
    return SubscriptionPlan(
      id: json.containsKey('id') ? json['id'] ?? '' : '',
      planCategoryId:
          json.containsKey('plan_category_id')
              ? json['plan_category_id'] ?? ''
              : '',
      name: json.containsKey('name') ? json['name'] ?? '' : '',
      description:
          json.containsKey('description') ? json['description'] ?? '' : '',
      price: json.containsKey('price') ? json['price'] ?? '' : '',
      currency: json.containsKey('currency') ? json['currency'] ?? '' : '',
      billingPeriod:
          json.containsKey('billing_period')
              ? json['billing_period'] ?? ''
              : '',
      credit:
          json.containsKey('credit')
              ? int.tryParse(json['credit'].toString()) ?? 0
              : 0,
      googleBillingId:
          json.containsKey('google_billing_id')
              ? json['google_billing_id'] ?? ''
              : '',
      appleBillingId:
          json.containsKey('apple_billing_id')
              ? json['apple_billing_id'] ?? ''
              : '',
      canControlPrivacy:
          json.containsKey('can_control_privacy')
              ? json['can_control_privacy'] ?? false
              : false,
      defaultCreationPrivacy:
          json.containsKey('default_creation_privacy')
              ? json['default_creation_privacy'] ?? ''
              : '',
      features:
          json.containsKey('features') && json['features'] is Map
              ? Map<String, dynamic>.from(json['features'])
              : {},
      isPopular:
          json.containsKey('is_popular') ? json['is_popular'] ?? false : false,
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
      type: json.containsKey('type') ? json['type'] : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'plan_category_id': planCategoryId,
      'name': name,
      'description': description,
      'price': price,
      'currency': currency,
      'billing_period': billingPeriod,
      'credit': credit,
      'google_billing_id': googleBillingId,
      'apple_billing_id': appleBillingId,
      'can_control_privacy': canControlPrivacy,
      'default_creation_privacy': defaultCreationPrivacy,
      'features': features,
      'is_popular': isPopular,
      'is_active': isActive,
      'created_at': createdAt?.toIso8601String(),
      'updated_at': updatedAt?.toIso8601String(),
      'type': type,
    };
  }
}
