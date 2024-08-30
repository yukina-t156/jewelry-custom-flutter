import 'package:flutter/material.dart';
import 'package:jewelry_custom_flutter/model/jewel_model.dart';
import 'package:jewelry_custom_flutter/screens/new_jewel_screen.dart';
import 'package:jewelry_custom_flutter/providers.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class FinishJewelScreen extends ConsumerStatefulWidget {
  const FinishJewelScreen({super.key});

  @override
  ConsumerState<FinishJewelScreen> createState() => _FinishJewelScreenState();
}

class _FinishJewelScreenState extends ConsumerState<FinishJewelScreen> {
  @override
  Widget build(BuildContext context) {
    final jewel = ref.watch(jewelProvider);
    final screenWidth = MediaQuery.of(context).size.width;
    final buttonWidth = screenWidth * 0.75; // 画面幅の75%

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue[100],
        title: const Text('完成'),
      ),
      /* -------------- 宝石 -------------- */
      body: Stack(
        children: <Widget>[
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Image.asset(
                  jewel.imagePath ?? 'assets/images/test_jewel.png',
                  width: 250, // 幅を指定
                  height: 250, // 高さを指定
                  fit: BoxFit.cover, // 画像を親ウィジェットに合わせてサイズ変更
                ),
              ],
            ),
          ),
          /* -------------- 完成ボタン -------------- */
          Positioned(
            bottom: 60, // 画面下からの距離
            left: (screenWidth - buttonWidth) / 2, // ボタンを中央に配置
            child: SizedBox(
              width: buttonWidth,
              child: ElevatedButton(
                onPressed: () {
                  // ボタンが押されたときの処理
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const NewJewelScreen()),
                  );
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
                  '完成',
                  style: TextStyle(fontSize: 24),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
