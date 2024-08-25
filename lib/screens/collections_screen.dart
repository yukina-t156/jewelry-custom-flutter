import 'package:flutter/material.dart';
import 'package:jewelry_custom_flutter/widgets/foot_buttons.dart'; // 実際のパスに合わせてください

class CollectionsScreen extends StatefulWidget {
  const CollectionsScreen({super.key});

  @override
  State<CollectionsScreen> createState() => _CollectionsScreenState();
}

class _CollectionsScreenState extends State<CollectionsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue[100],
        title: const Text('Collections'),
      ),
      /* -------------- 宝石 -------------- */
      body: Stack(
        children: <Widget>[
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
