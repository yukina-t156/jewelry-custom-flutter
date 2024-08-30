class Jewel {
  final int id;
  String? name; // オプションにするために String? を使用
  int counter;
  int level;
  final int jewelTypeId;
  String? imagePath;

  // コンストラクタ
  Jewel({
    required this.id,
    required this.jewelTypeId,
    required this.counter,
    required this.level,
    String? imagePath,  // <- ここでimagePathを受け取れるようにする
  }) : name = jewelNames[jewelTypeId],
        imagePath = imagePath ?? 'assets/images/${jewelNames[jewelTypeId]}_0.png';

  Map<String, dynamic> toJson() => {
    'id': id,
    'imagePath': imagePath,
    'counter': counter,
    'level': level,
    'jewelTypeId': jewelTypeId,
  };

  static Jewel fromJson(Map<String, dynamic> json) => Jewel(
    id: json['id'] ?? 0, // Default value if null
    jewelTypeId: json['jewelTypeId'] ?? 0, // Default value if null
    counter: json['counter'] ?? 0, // Default value if null
    level: json['level'] ?? 0, // Default value if null
    imagePath: json['imagePath'], // Optional field
  );

  Jewel copyWith({
    int? id,
    int? jewelTypeId,
    int? counter,
    int? level,
    String? imagePath,
  }) {
    return Jewel(
      id: id ?? this.id,
      jewelTypeId: jewelTypeId ?? this.jewelTypeId,
      counter: counter ?? this.counter,
      level: level ?? this.level,
      imagePath: imagePath ?? this.imagePath,
    );
  }

  void updatePath() {
    String? jewelName = jewelNames[jewelTypeId];

    if (jewelName != null) {
      imagePath = getJewelImagePath(jewelTypeId, level);
    } else {
      imagePath = null;
    }
  }
}

String getJewelImagePath(int jewelTypeId, int level) {
  return 'assets/images/${jewelNames[jewelTypeId]}_$level.png';
}

// jewelId をキーとした宝石の名前リスト
final Map<int, String> jewelNames = {
  1: 'diamond',
  2: 'ruby',
  3: 'emerald',
};
