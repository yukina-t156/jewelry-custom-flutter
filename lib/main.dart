import 'package:flutter/material.dart';
import 'screens/home_screen.dart';
import 'screens/profile_screen.dart';
import 'screens/friends_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Pull ver',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const HomeScreen(),
      initialRoute: '/home', // 初期ルート
      routes: {
        '/home': (context) => HomeScreen(),
        '/profile': (context) => ProfileScreen(),
        '/friends': (context) => FriendsScreen(),
      },
    );
  }
}
