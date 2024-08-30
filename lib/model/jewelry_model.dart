import 'package:jewelry_custom_flutter/model/jewel_model.dart';

class Jewelry extends Jewel {
  final int processingMethod; // 加工方法

  Jewelry({
    required int id,
    required int jewelTypeId,
    required int counter,
    required int level,
    String? imagePath,
    required this.processingMethod,
  }) : super(
    id: id,
    jewelTypeId: jewelTypeId,
    counter: counter,
    level: level,
    imagePath: imagePath,
  );

  @override
  Map<String, dynamic> toJson() => {
    ...super.toJson(),
    'processingMethod': processingMethod,
  };

  factory Jewelry.fromJson(Map<String, dynamic> json) => Jewelry(
    id: json['id'],
    jewelTypeId: json['jewelTypeId'],
    counter: json['counter'],
    level: json['level'],
    imagePath: json['imagePath'],
    processingMethod: json['processingMethod'],
  );

  @override
  Jewelry copyWith({
    int? id,
    int? jewelTypeId,
    int? counter,
    int? level,
    String? imagePath,
    int? processingMethod,
  }) {
    return Jewelry(
      id: id ?? this.id,
      jewelTypeId: jewelTypeId ?? this.jewelTypeId,
      counter: counter ?? this.counter,
      level: level ?? this.level,
      imagePath: imagePath ?? this.imagePath,
      processingMethod: processingMethod ?? this.processingMethod,
    );
  }

  void updatePath() {
    String? jewelName = jewelNames[jewelTypeId];
    if (jewelName != null) {
      imagePath = getJewelryImagePath(jewelTypeId, processingMethod, level);
    } else {
      imagePath = null;
    }
  }
}

// 加工方法を含めた画像パスの生成
String getJewelryImagePath(int jewelTypeId, int processingMethod, int level) {
  if (processingMethod==0) {
    return 'assets/images/${jewelNames[jewelTypeId]}_$level.png';
  }
  return 'assets/images/${processingMethods[processingMethod]}_${jewelNames[jewelTypeId]}.png';
}

final Map<int, String> processingMethods = {
  0: 'original',
  1: 'ring',
  2: 'neckless',
};