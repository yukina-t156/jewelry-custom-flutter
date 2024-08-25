import 'dart:core'; // DateTime クラスを使用するためにインポート

class User {
  final String name;
  final DateTime lastLogin;
  final DateTime startDate;
  final bool isWithdrawn;
  final int exp;
  final int level;
  final List<int> friends;
  final List<int> collections;

  User({
    required this.name,
    required this.lastLogin,
    required this.startDate,
    required this.isWithdrawn,
    required this.exp,
    required this.level,
    required this.friends,
    required this.collections,
  });

  // JSONからUserオブジェクトを作成
  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      name: json['name'],
      lastLogin: DateTime.parse(json['last_login']),
      startDate: DateTime.parse(json['start_date']),
      isWithdrawn: json['is_withdrawn'] ?? false,
      exp: json['exp'],
      level: json['level'],
      friends: List<int>.from(json['friends']),
      collections: List<int>.from(json['collections']),
    );
  }

  // UserオブジェクトをJSONに変換
  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'last_login': lastLogin.toIso8601String(),
      'start_date': startDate.toIso8601String(),
      'is_withdrawn': isWithdrawn,
      'exp': exp,
      'level': level,
      'friends': friends,
      'collections': collections,
    };
  }
}