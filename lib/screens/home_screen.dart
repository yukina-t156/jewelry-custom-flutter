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
  @override
  Widget build(BuildContext context) {
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
                  cacheWidth: 200,
                  cacheHeight: 200,
                ),
              ],
            ),
          ),
          /* -------------- みがくボタン -------------- */
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: const EdgeInsets.all(100.0),
              child: ElevatedButton(
                onPressed: () {
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
                  fixedSize: Size(300, 100),
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
                Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => CollectionsScreen()),
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
        child: FooterButtons(), // フッターボタンを追加
      ),
    );
  }
}
