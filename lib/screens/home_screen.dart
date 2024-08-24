import 'package:flutter/material.dart';
import 'package:jewelry_custom_flutter/widgets/foot_buttons.dart'; // 実際のパスに合わせてください


class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      //   title: const Text('Home'),
      // ),
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
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: const EdgeInsets.all(100.0),
              child: ElevatedButton(
                onPressed: () {
                },
                child: const Text(
                  'みがく',
                  style:TextStyle(fontSize: 24)
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFFE5F9FF), // ボタンの背景色
                  foregroundColor: const Color(0xFF006686), // ボタン上のテキストの色
                  side: BorderSide(color: Color(0xFF95DFF6), width: 8),//枠の設定
                  // shape: const StadiumBorder(),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                  fixedSize: Size(300, 100),
                ),
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: Container(
        color: Colors.grey[300], // 背景の灰色
        height: 150, // 背景の高さ
        child: FooterButtons(), // フッターボタンを追加
      ),
    );
  }
}
