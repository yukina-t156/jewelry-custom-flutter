class Jewel {
  String? name; // オプションにするために String? を使用
  int counter;
  int level;
  final int gemTypeId; // gemNumber から gemTypeId へ変更
  String? imagePath;

  // コンストラクタ
  Jewel({
    required this.gemTypeId,
    required this.counter,
    required this.level,
  }): name = gemNames[gemTypeId],
        imagePath = 'assets/images/${gemNames[gemTypeId]}_0.png';

  void updatePath() {
    String? gemName = gemNames[gemTypeId]; // gemTypeIdに対応する名前を取得

    if (gemName != null) {
      imagePath = 'assets/images/${gemName}_$level.png';
    } else {
      // gemTypeIdが正しくない場合のエラーハンドリング
      imagePath = null;
    }
  }
}

// gemId をキーとした宝石の名前リスト
final Map<int, String> gemNames = {
  1: 'diamond',
  2: 'ruby',
};
