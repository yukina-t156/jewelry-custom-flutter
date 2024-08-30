import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:jewelry_custom_flutter/model/jewel_model.dart';
import 'package:jewelry_custom_flutter/model/jewelry_model.dart';

class JewelNotifier extends StateNotifier<Jewel> {
  JewelNotifier() : super(Jewel(id: 0, jewelTypeId: 2, counter: 0, level: 0));

  void incrementCounter() {
    state = state.copyWith(counter: state.counter + 1);
    _updateLevel();
  }

  void resetJewel() {
    state = Jewel(id: 0, jewelTypeId: 1, counter: 0, level: 0);
    _updateLevel();
  }

  void updateJewel(Jewel newJewel) {
    state = newJewel;
  }

  void _updateLevel() {
    int newLevel = 0;
    while (state.counter >= _countToLevel[newLevel]) {
      newLevel++;
    }
    // 更新後のレベルを反映したJewelを作成
    state = state.copyWith(level: newLevel);
    // imagePathの更新
    state = state.copyWith(imagePath: getJewelImagePath(state.jewelTypeId, newLevel));
  }

  static const List<int> _countToLevel = [3, 10, 15, 20, 30, 999999999];
}

final jewelProvider = StateNotifierProvider<JewelNotifier, Jewel>((ref) {
  return JewelNotifier();
});
