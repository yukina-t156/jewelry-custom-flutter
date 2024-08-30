import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:jewelry_custom_flutter/model/jewel_model.dart';
import 'package:jewelry_custom_flutter/model/jewelry_model.dart';


class JewelService {
  static Future<void> saveJewels(List<Jewel> jewels) async {
    final prefs = await SharedPreferences.getInstance();
    final jsonList = jewels.map((jewel) => json.encode(jewel.toJson())).toList();
    await prefs.setStringList('jewels', jsonList);
  }

  static Future<List<Jewel>> loadJewels() async {
    final prefs = await SharedPreferences.getInstance();
    final jsonList = prefs.getStringList('jewels') ?? [];
    return jsonList.map((jsonStr) {
      final jsonMap = json.decode(jsonStr);
      return Jewel.fromJson(jsonMap);
    }).toList();
  }

  static Future<void> addJewel(Jewel jewel) async {
    final prefs = await SharedPreferences.getInstance();
    final jewelData = prefs.getStringList('jewels') ?? [];
    jewelData.add(json.encode(jewel.toJson()));
    await prefs.setStringList('jewels', jewelData);
  }

  static Future<void> removeJewel(Jewel jewelToRemove) async {
    final jewels = await loadJewels();
    jewels.removeWhere((jewel) => jewel.jewelTypeId == jewelToRemove.jewelTypeId);
    await saveJewels(jewels);
  }

  // ローカルストレージにjewelの情報を保存
  static Future<List<Jewel>> getJewels() async {
    final prefs = await SharedPreferences.getInstance();
    final jewelData = prefs.getStringList('jewels') ?? [];
    return jewelData.map((jsonStr) => Jewel.fromJson(json.decode(jsonStr))).toList();
  }

  // 最大のIDを取得
  static Future<int> getMaxId() async {
    final jewels = await loadJewels();
    if (jewels.isEmpty) {
      return 0;
    }
    return jewels.map((jewel) => jewel.id).reduce((a, b) => a > b ? a : b);
  }

  // 新しいIDを生成
  static Future<int> generateNewId() async {
    final maxId = await getMaxId();
    return maxId + 1;
  }

  static Future<void> clearAllCollections() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove('jewels');
    await prefs.remove('jewelry');
  }

  static Future<void> addJewelry(Jewelry jewelry) async {
    final prefs = await SharedPreferences.getInstance();
    final jewelryData = prefs.getStringList('jewelry') ?? [];
    jewelryData.add(json.encode(jewelry.toJson()));
    await prefs.setStringList('jewelry', jewelryData);
  }

  static Future<List<Jewelry>> loadJewelry() async {
    final prefs = await SharedPreferences.getInstance();
    final jsonList = prefs.getStringList('jewelry') ?? [];
    return jsonList.map((jsonStr) {
      final jsonMap = json.decode(jsonStr);
      return Jewelry.fromJson(jsonMap);
    }).toList();
  }
}
