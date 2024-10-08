import 'package:flutter/material.dart';
import 'package:jewelry_custom_flutter/screens/friend_detail_screen.dart';
import 'package:jewelry_custom_flutter/widgets/foot_buttons.dart';

class FriendsScreen extends StatefulWidget {
  const FriendsScreen({super.key});

  @override
  State<FriendsScreen> createState() => _FriendsScreenState();
}

class _FriendsScreenState extends State<FriendsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue[100],
        title: const Text('ともだち'),
      ),
      /* -------------- リスト -------------- */
      body: ListView.builder(
        itemCount: 10, // リストのアイテム数
        itemBuilder: (context, index) {
          // ダミーデータの生成
          const icon = Icons.star; // アイコン
          final name = 'Name ${index + 1}'; // 名前
          final level = 'Level ${index + 1}'; // レベル
          final id = index + 1; // 仮のID

          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0), // 左右の余白
            child: Container(
              margin: const EdgeInsets.symmetric(vertical: 8.0), // 要素同士の間隔
              padding: const EdgeInsets.all(16.0), // コンテンツの内側の余白
              decoration: BoxDecoration(
                color: Colors.blueGrey[200], // 長方形の背景色
                borderRadius: BorderRadius.circular(12.0), // 四角の角を丸くする
              ),
              child: InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => FriendDetailScreen(id: id),
                    ),
                  );
                },
                child: Row(
                  children: <Widget>[
                  /* -------------- アイコン -------------- */
                    Container(
                      width: 50.0,
                      height: 50.0,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.blueGrey[300], // アイコンの背景色
                      ),
                      child: const Icon(
                        icon,
                        color: Colors.white, // アイコンの色
                        size: 24.0,
                      ),
                    ),
                    const SizedBox(width: 16.0), // アイコンとテキストの間隔
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                  /* -------------- 名前 -------------- */
                          Text(
                            name,
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: Colors.blueGrey[800], // レベルの色
                            ),
                          ),
                  /* -------------- レベル -------------- */
                          Text(
                            level,
                            style: TextStyle(
                              fontSize: 14,
                              color: Colors.blueGrey[600], // 名前の色
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
      /* -------------- 下のメニュー欄 -------------- */
      bottomNavigationBar: Container(
        color: Colors.grey[300], // 背景の灰色
        height: 150, // 背景の高さ
        child: const FooterButtons(location: 3), // フッターボタンを追加
      ),
    );
  }
}
