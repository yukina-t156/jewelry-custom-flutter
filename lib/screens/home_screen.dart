import 'dart:math';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:jewelry_custom_flutter/screens/collections_screen.dart';
import 'package:jewelry_custom_flutter/widgets/foot_buttons.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _jewelCounter = 0;
  int _level = 1;

  static const List<int> countToLevel = [1, 5, 10, 20, 999999999];
  void _update() {
    _level=0;
    while(_jewelCounter>=countToLevel[max(_level, 0)]){
      setState(() {
        _level++;
      });
    }
  }

  void _incrementJewelCounter() {
    setState(() {
      _jewelCounter++;
    });
    _update();
  }

  void _resetJewelCounter() {
    setState(() {
      _jewelCounter=0;
    });
    _update();
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final buttonWidth = screenWidth * 0.75; // 画面幅の80%

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue[100],
        title: const Text('Home'),
      ),
      /* -------------- 宝石 -------------- */
      body: Stack(
        children: <Widget>[
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Image.asset(
                  'assets/images/test_jewel.png',
                  width: 150, // 幅を指定
                  height: 150, // 高さを指定
                  fit: BoxFit.cover, // 画像を親ウィジェットに合わせてサイズ変更
                ),
              ],
            ),
          ),
          /* -------------- みがくボタン -------------- */
          Positioned(
            bottom: 60, // 画面下からの距離
            left: (screenWidth - buttonWidth) / 2, // ボタンを中央に配置
            child: Container(
              width: buttonWidth,
              child: ElevatedButton(
                onPressed: () {
                  // ボタンが押されたときの処理
                  _incrementJewelCounter();
                },
                child: const Text(
                  'みがく',
                  style: TextStyle(fontSize: 24),
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFFE5F9FF), // ボタンの背景色
                  foregroundColor: const Color(0xFF006686), // ボタン上のテキストの色
                  side: BorderSide(color: Color(0xFF95DFF6), width: 8), // 枠の設定
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                  fixedSize: Size(buttonWidth, 70), // ボタンの幅と高さ
                ),
              ),
            ),
          ),
          /* -------------- カウンタ・レベル表示 -------------- */
          Positioned(
            bottom: 30, // 画面下からの距離
            left: (screenWidth - buttonWidth) / 2, // ボタンを中央に配置
            child: Container(
              width: buttonWidth,
              child:Center(
                child: Text(
                  // 'レベル：$_level',
                  '磨いた回数：$_jewelCounter レベル：$_level',
                  style: TextStyle(fontSize: 16),
                ),
              ),
            ),
          ),
          /* -------------- コレクションのボタン -------------- */
          Positioned(
            top: 20,
            right: 20,
            child: FloatingActionButton(
              onPressed: () {
                // ボタンが押されたときの処理
                // デバッグ用
                _resetJewelCounter();
                // Navigator.push(
                //   context,
                //   MaterialPageRoute(builder: (context) => CollectionsScreen()),
                // );
              },
              backgroundColor: Colors.white, // 背景の色
              foregroundColor: Colors.black, // アイコンの色
              shape: RoundedRectangleBorder(
                // 枠
                borderRadius: BorderRadius.circular(15),
                side: const BorderSide(color: Colors.orange, width: 4),
              ),
              child: const FaIcon(FontAwesomeIcons.boxArchive),
            ),
          ),
        ],
      ),
      /* -------------- 下のメニュー欄 -------------- */
      bottomNavigationBar: Container(
        color: Colors.grey[300], // 背景の灰色
        height: 150, // 背景の高さ
        child: FooterButtons(location: 1), // フッターボタンを追加
      ),
    );
  }
}
