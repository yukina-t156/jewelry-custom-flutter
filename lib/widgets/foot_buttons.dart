import 'package:flutter/material.dart';

class FooterButtons extends StatelessWidget {
  final int location;
  // デフォルト値を設定
  const FooterButtons({super.key, this.location = 0});

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Expanded(
            child: _buildButton(context, 'ホーム', Icons.home, '/home', location == 1),
          ),
          const SizedBox(width: 8), // ボタンの間に縦のスペースを追加
          Expanded(
            child: _buildButton(context, 'プロフィール', Icons.person, '/profile', location == 2),
          ),
          const SizedBox(width: 8), // ボタンの間に縦のスペースを追加
          Expanded(
            child: _buildButton(context, 'フレンド', Icons.group, '/friends', location == 3),
          ),
        ],
      ),
    );
  }
  Widget _buildButton(BuildContext context, String label, IconData icon, String route, bool isActive) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16.0), // ボタンの角を丸くする
        ),
        backgroundColor: isActive ? Colors.amber : Colors.amber[200], // ボタンの背景色
        foregroundColor: Colors.yellow[900], // ボタン上のテキストの色
        padding: const EdgeInsets.symmetric(vertical: 10.0), // ボタンの内側の余白（縦）
      ),
      onPressed: () {
        Navigator.pushNamed(context, route);
      },
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
              icon,
              size: 30,
              color: isActive ? Colors.white : Colors.grey[700],
            ),
          Text(
            label,
            style: TextStyle(
              fontSize: 12,
              color: isActive ? Colors.white : Colors.grey[700],
            ),
          ),
        ],
      ),
    );
  }
}
