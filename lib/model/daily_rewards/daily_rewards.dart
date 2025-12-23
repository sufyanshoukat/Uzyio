class CoinRewardResponseModel {
  final bool? success;
  final int? currentCoins;
  final DailyLoginModel? dailyLogin;
  final StreakBonusModel? streakBonus;

  CoinRewardResponseModel({
    this.success,
    this.currentCoins,
    this.dailyLogin,
    this.streakBonus,
  });

  factory CoinRewardResponseModel.fromJson(Map<String, dynamic> json) {
    return CoinRewardResponseModel(
      success: json['success'],
      currentCoins: json['current_coins'],
      dailyLogin:
          json['daily_login'] != null
              ? DailyLoginModel.fromJson(json['daily_login'])
              : null,
      streakBonus:
          json['streak_bonus'] != null
              ? StreakBonusModel.fromJson(json['streak_bonus'])
              : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'success': success,
      'current_coins': currentCoins,
      'daily_login': dailyLogin?.toJson(),
      'streak_bonus': streakBonus?.toJson(),
    };
  }
}

class DailyLoginModel {
  final bool? available;
  final bool? claimedToday;
  final int? coins;
  final String? description;

  DailyLoginModel({
    this.available,
    this.claimedToday,
    this.coins,
    this.description,
  });

  factory DailyLoginModel.fromJson(Map<String, dynamic> json) {
    return DailyLoginModel(
      available: json['available'],
      claimedToday: json['claimed_today'],
      coins: json['coins'],
      description: json['description'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'available': available,
      'claimed_today': claimedToday,
      'coins': coins,
      'description': description,
    };
  }
}

class StreakBonusModel {
  final bool? available;
  final bool? claimed;
  final int? currentStreak;
  final int? requiredStreak;
  final int? daysRemaining;
  final int? coins;
  final String? description;

  StreakBonusModel({
    this.available,
    this.claimed,
    this.currentStreak,
    this.requiredStreak,
    this.daysRemaining,
    this.coins,
    this.description,
  });

  factory StreakBonusModel.fromJson(Map<String, dynamic> json) {
    return StreakBonusModel(
      available: json['available'],
      claimed: json['claimed'],
      currentStreak: json['current_streak'],
      requiredStreak: json['required_streak'],
      daysRemaining: json['days_remaining'],
      coins: json['coins'],
      description: json['description'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'available': available,
      'claimed': claimed,
      'current_streak': currentStreak,
      'required_streak': requiredStreak,
      'days_remaining': daysRemaining,
      'coins': coins,
      'description': description,
    };
  }
}
