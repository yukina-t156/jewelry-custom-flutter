import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:jewelry_custom_flutter/widgets/foot_buttons.dart';
import 'package:jewelry_custom_flutter/model/user_model.dart';

// 日付のフォーマット
final DateFormat formatter = DateFormat('yyyy-MM-dd');

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  late Future<User> userFuture;

  @override
  void initState() {
    super.initState();
    userFuture = fetchUserData(); // ユーザーデータを取得
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue[100],
        title: const Text('プロフィール'),
      ),
      /* -------------- コンテンツ -------------- */
      body: FutureBuilder<User>(
        future: userFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('エラー: ${snapshot.error}'));
          } else if (!snapshot.hasData) {
            return Center(child: Text('データがありません'));
          } else {
            final user = snapshot.data!;
            return Center(
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
                        size: 36, // アイコンのサイズ
                      ),
                    ),
                  ),
                  SizedBox(height: 10),
                  Text(user.name, style: TextStyle(fontSize: 20)),
                  Text("Lv.${user.level}", style: TextStyle(fontSize: 16)),
                  Text("開始日: ${DateFormat('yyyy-MM-dd').format(user.startDate)}", style: TextStyle(fontSize: 14)),
                ],
              ),
            );
          }
        },
      ),
      /* -------------- 下のメニュー欄 -------------- */
      bottomNavigationBar: Container(
        color: Colors.grey[300], // 背景の灰色
        height: 150, // 背景の高さ
        child: FooterButtons(location: 2), // フッターボタンを追加
      ),
    );
  }
}

Future<User> fetchUserData() async {
  // 実際のAPI呼び出しに置き換えてください
  final response = await Future.delayed(
    Duration(seconds: 2),
        () => {
      'id': 1,
      'name': 'hanako',
      'last_login': '2024-08-01T00:00:00Z',
      'start_date': '2024-01-01T00:00:00Z',
      'exp': 1000,
      'level': 5,
      'friends': [1, 23, 456],
      'collections': [98, 765, 4321],
      'favorites': [], // サンプルデータ
    },
  );

  return User.fromJson(response);
}
