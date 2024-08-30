import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:jewelry_custom_flutter/model/jewel_model.dart';
import 'package:jewelry_custom_flutter/model/jewelry_model.dart';

class JewelService {
  static const String jewelsKey = 'jewels';
  static const String jewelryKey = 'jewelry';

  // 共有されたPreferencesインスタンスを取得
  static Future<SharedPreferences> _getPrefs() async {
    return await SharedPreferences.getInstance();
  }

  // Jewelデータを保存
  static Future<void> saveJewels(List<Jewel> jewels) async {
    final prefs = await _getPrefs();
    final jsonList = jewels.map((jewel) => json.encode(jewel.toJson())).toList();
    await prefs.setStringList(jewelsKey, jsonList);
  }

  // Jewelデータをロード
  static Future<List<Jewel>> loadJewels() async {
    final prefs = await _getPrefs();
    final jsonList = prefs.getStringList(jewelsKey) ?? [];
    return jsonList.map((jsonStr) => Jewel.fromJson(json.decode(jsonStr))).toList();
  }

  // Jewelデータを追加
  static Future<void> addJewel(Jewel jewel) async {
    final jewels = await loadJewels();
    jewels.add(jewel);
    await saveJewels(jewels);
  }

  // Jewelデータを削除
  static Future<void> removeJewel(Jewel jewelToRemove) async {
    final jewels = await loadJewels();
    jewels.removeWhere((jewel) => jewel.jewelTypeId == jewelToRemove.jewelTypeId);
    await saveJewels(jewels);
  }

  // 最大のJewel IDを取得
  static Future<int> getMaxId() async {
    final jewels = await loadJewels();
    return jewels.isEmpty ? 0 : jewels.map((jewel) => jewel.id).reduce((a, b) => a > b ? a : b);
  }

  // 新しいJewel IDを生成
  static Future<int> generateNewId() async {
    return (await getMaxId()) + 1;
  }

  // JewelとJewelryの全データを削除
  static Future<void> clearAllCollections() async {
    final prefs = await _getPrefs();
    await prefs.remove(jewelsKey);
    await prefs.remove(jewelryKey);
  }

  // Jewelryデータを追加
  static Future<void> addJewelry(Jewelry jewelry) async {
    final prefs = await _getPrefs();
    final jewelryData = prefs.getStringList(jewelryKey) ?? [];
    jewelryData.add(json.encode(jewelry.toJson()));
    await prefs.setStringList(jewelryKey, jewelryData);
  }

  // Jewelryデータをロード
  static Future<List<Jewelry>> loadJewelry() async {
    final prefs = await _getPrefs();
    final jsonList = prefs.getStringList(jewelryKey) ?? [];
    return jsonList.map((jsonStr) => Jewelry.fromJson(json.decode(jsonStr))).toList().reversed.toList();
  }
}
