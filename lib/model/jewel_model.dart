class Jewel {
  String? name; // オプションにするために String? を使用
  int counter;
  int level;
  final int jewelTypeId;
  String? imagePath;

  // コンストラクタ
  Jewel({
    required this.jewelTypeId,
    required this.counter,
    required this.level,
    String? imagePath,  // <- ここでimagePathを受け取れるようにする
  }): name = jewelNames[jewelTypeId],
        imagePath = imagePath ?? 'assets/images/${jewelNames[jewelTypeId]}_0.png';

  Jewel copyWith({
    int? jewelTypeId,
    int? counter,
    int? level,
    String? imagePath,
  }) {
    return Jewel(
      jewelTypeId: jewelTypeId ?? this.jewelTypeId,
      counter: counter ?? this.counter,
      level: level ?? this.level,
      imagePath: imagePath ?? this.imagePath,  // ここでオプションのimagePathを設定
    );
  }

  void updatePath() {
    String? jewelName = jewelNames[jewelTypeId];

    if (jewelName != null) {
      imagePath = getJewelImagePath(jewelTypeId, level);
    } else {
      // jewelTypeIdが正しくない場合のエラーハンドリング
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
};
