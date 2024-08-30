import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:jewelry_custom_flutter/screens/collections_screen.dart';
import 'package:jewelry_custom_flutter/screens/finish_jewel_screen.dart';
import 'package:jewelry_custom_flutter/widgets/foot_buttons.dart';
import 'package:jewelry_custom_flutter/model/jewel_model.dart';

class HomeScreen extends StatefulWidget {
  final Jewel? jewel;

  const HomeScreen({super.key, this.jewel});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late Jewel _jewel;

  @override
  void initState() {
    super.initState();
    _jewel = widget.jewel ?? Jewel(jewelTypeId: 2, counter: 0, level: 0); // 初期化
  }

  static const List<int> countToLevel = [3, 10, 15, 20, 30, 999999999];
  void _update() {
    setState(() {
      _jewel.level=0;
    });
    while(_jewel.counter>=countToLevel[_jewel.level]){
      setState(() {
        _jewel.level++;
      });
    }
    _jewel.updatePath();
  }

  void _incrementJewelCounter() {
    setState(() {
      _jewel.counter++;
    });
    _update();
  }

  void _resetJewelCounter() {
    setState(() {
      _jewel = Jewel(jewelTypeId: 1, counter: 0, level: 0);
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
      body: Stack(
        children: <Widget>[
          /* -------------- 宝石 -------------- */
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Image.asset(
                  _jewel.imagePath ?? 'assets/images/test_jewel.png',
                  // 'assets/images/test_jewel.png',
                  width: 250, // 幅を指定
                  height: 250, // 高さを指定
                  fit: BoxFit.cover, // 画像を親ウィジェットに合わせてサイズ変更
                ),
              ],
            ),
          ),
          /* -------------- みがくボタン -------------- */
          Positioned(
            bottom: 60, // 画面下からの距離
            left: (screenWidth - buttonWidth) / 2, // ボタンを中央に配置
            child: SizedBox(
              width: buttonWidth,
              child: ElevatedButton(
                onPressed: () {
                  // ボタンが押されたときの処理
                  _incrementJewelCounter();
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFFE5F9FF), // ボタンの背景色
                  foregroundColor: const Color(0xFF006686), // ボタン上のテキストの色
                  side: const BorderSide(color: Color(0xFF95DFF6), width: 8), // 枠の設定
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                  fixedSize: Size(buttonWidth, 70), // ボタンの幅と高さ
                ),
                child: const Text(
                  'みがく',
                  style: TextStyle(fontSize: 24),
                ),
              ),
            ),
          ),
          /* -------------- カウンタ・レベル表示 -------------- */
          Positioned(
            bottom: 30, // 画面下からの距離
            left: (screenWidth - buttonWidth) / 2, // ボタンを中央に配置
            child: SizedBox(
              width: buttonWidth,
              child:Center(
                child: Text(
                  // 'レベル：$_level',
                  '磨いた回数：${_jewel.counter}  レベル：${_jewel.level}',
                  style: const TextStyle(fontSize: 16),
                ),
              ),
            ),
          ),
          /* -------------- コレクションのボタン1 -------------- */
          Positioned(
            top: 20,
            right: 20,
            child: FloatingActionButton(
              heroTag: 'setting button',
              onPressed: () {
                // ボタンが押されたときの処理
                // デバッグ用
                _resetJewelCounter();
              },
              backgroundColor: Colors.white, // 背景の色
              foregroundColor: Colors.black, // アイコンの色
              shape: RoundedRectangleBorder(
                // 枠
                borderRadius: BorderRadius.circular(15),
                side: const BorderSide(color: Colors.orange, width: 4),
              ),
              child: const FaIcon(FontAwesomeIcons.gear),
            ),
          ),
          /* -------------- コレクションのボタン2 -------------- */
          Positioned(
            top: 85,
            right: 20,
            child: FloatingActionButton(
              heroTag: 'finish button',
              onPressed: () {
              // ボタンが押されたときの処理
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => FinishJewelScreen(jewel: _jewel),
                  ),
                );
              },
              backgroundColor: Colors.white, // 背景の色
              foregroundColor: Colors.black, // アイコンの色
              shape: RoundedRectangleBorder(
                // 枠
                borderRadius: BorderRadius.circular(15),
                side: const BorderSide(color: Colors.orange, width: 4),
              ),
              child: const FaIcon(FontAwesomeIcons.toolbox),
            ),
          ),
          /* -------------- コレクションのボタン3 -------------- */
          Positioned(
            top: 150,
            right: 20,
            child: FloatingActionButton(
              heroTag: 'collection button',
              onPressed: () {
                // ボタンが押されたときの処理
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const CollectionsScreen()),
                );
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
        child: const FooterButtons(location: 1), // フッターボタンを追加
      ),
    );
  }
}
