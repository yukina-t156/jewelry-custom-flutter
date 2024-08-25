import 'package:flutter/material.dart';

class FooterButtons extends StatelessWidget {
  const FooterButtons({super.key});

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
            Expanded(
              child: _buildButton(context, 'ホーム', Icons.home, '/home'),
            ),
            SizedBox(width: 8), // ボタンの間に縦のスペースを追加
            Expanded(
              child: _buildButton(context, 'プロフィール', Icons.person, '/profile'),
            ),
            SizedBox(width: 8), // ボタンの間に縦のスペースを追加
            Expanded(
              child: _buildButton(context, 'フレンド', Icons.group, '/friends'),
            ),
        ],
      ),
    );
  }

  Widget _buildButton(BuildContext context, String label, IconData icon, String route) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16.0), // ボタンの角を丸くする
        ),
        backgroundColor: Colors.amber[200], // ボタンの背景色
        foregroundColor: Colors.yellow[900], // ボタン上のテキストの色
        // minimumSize: Size(60, 60), // ボタンの最小サイズ
        padding: EdgeInsets.symmetric(vertical: 10.0), // ボタンの内側の余白（縦）
      ),
      // tooltip: label,
      onPressed: () {
        // 各ボタンが押されたときの処理をここに記述
        Navigator.pushNamed(context, route);
      },
      
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, size: 30), // アイコンのサイズ
          Text(label,style:TextStyle(fontSize: 12)),
        ],
      ),

    );
  }
}
