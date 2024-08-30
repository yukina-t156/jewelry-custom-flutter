import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:jewelry_custom_flutter/model/jewel_model.dart';
import 'package:jewelry_custom_flutter/screens/new_jewel_screen.dart';
import 'screens/home_screen.dart';
import 'screens/profile_screen.dart';
import 'screens/friends_screen.dart';

void main() {
  runApp(
    ProviderScope(
      child: MyApp(),
    ),
  );
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
      // home: const HomeScreen(),
      initialRoute: '/new_jewel', // 初期ルート
      routes: {
        '/home': (context) => HomeScreen(
          // jewel: Jewel(
          //   jewelTypeId: 1, // 適切な値に置き換えてください
          //   counter: 0,
          //   level: 0,
          // ),
        ),
        '/profile': (context) => const ProfileScreen(),
        '/friends': (context) => const FriendsScreen(),
        '/new_jewel': (context) => const NewJewelScreen(),
      },
    );
  }
}
