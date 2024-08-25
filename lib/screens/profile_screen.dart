import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:jewelry_custom_flutter/widgets/foot_buttons.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue[100],
        title: const Text('プロフィール'),
      ),
      /* -------------- コンテンツ -------------- */
      body: Stack(
        children: <Widget>[
          /* -------------- プロフィール -------------- */
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Container(
                  width: 80, // 円の幅
                  height: 80, // 円の高さ
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.white, // 背景の色
                    border: Border.all(
                      color: Colors.blue, // 枠の色
                      width: 4,
                    ),
                  ),
                  child: Center(
                    child: FaIcon(
                      FontAwesomeIcons.user,
                      color: Colors.blueGrey.shade900, // アイコンの色
                      size: 36, // アイコンのサイズr
                    ),
                  ),
                ),
                SizedBox(height: 10),
                Text("Name"),
                Text("Lv.999"),
                Text("開始日: 2024-07-01"),
              ],
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
