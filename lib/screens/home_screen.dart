import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:jewelry_custom_flutter/screens/collections_screen.dart';
import 'package:jewelry_custom_flutter/screens/finish_jewel_screen.dart';
import 'package:jewelry_custom_flutter/widgets/foot_buttons.dart';
import 'package:jewelry_custom_flutter/services/jewel_service.dart';
import 'package:jewelry_custom_flutter/model/jewel_model.dart';
import 'package:jewelry_custom_flutter/providers.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    final jewel = ref.watch(jewelProvider);
    final screenWidth = MediaQuery.of(context).size.width;
    final buttonWidth = screenWidth * 0.75;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue[100],
        title: const Text('Home'),
      ),
      body: Stack(
        children: <Widget>[
          /* -------------- 宝石 -------------- */
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Image.asset(
                  jewel.imagePath ?? 'assets/images/test_jewel.png',
                  width: 250,
                  height: 250,
                  fit: BoxFit.cover,
                ),
              ],
            ),
          ),
          /* -------------- みがくボタン -------------- */
          Positioned(
            bottom: 60,
            left: (screenWidth - buttonWidth) / 2,
            child: SizedBox(
              width: buttonWidth,
              child: ElevatedButton(
                onPressed: () {
                  ref.read(jewelProvider.notifier).incrementCounter();
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFFE5F9FF),
                  foregroundColor: const Color(0xFF006686),
                  side: const BorderSide(color: Color(0xFF95DFF6), width: 8),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                  fixedSize: Size(buttonWidth, 70),
                ),
                child: const Text(
                  'みがく',
                  style: TextStyle(fontSize: 24),
                ),
              ),
            ),
          ),
          /* -------------- カウンタ・レベル表示 -------------- */
          Positioned(
            bottom: 30,
            left: (screenWidth - buttonWidth) / 2,
            child: SizedBox(
              width: buttonWidth,
              child: Center(
                child: Text(
                  '磨いた回数：${jewel.counter}  レベル：${jewel.level}  種類：${jewel.jewelTypeId}  画像パス：${jewel.imagePath}',
                  style: const TextStyle(fontSize: 16),
                ),
              ),
            ),
          ),
          /* -------------- 設定ボタン -------------- */
          Positioned(
            top: 20,
            right: 20,
            child: FloatingActionButton(
              heroTag: 'setting button',
              onPressed: () async {
                await JewelService.clearAllJewels();
                ref.read(jewelProvider.notifier).resetJewel();
              },
              backgroundColor: Colors.white,
              foregroundColor: Colors.black,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
                side: const BorderSide(color: Colors.orange, width: 4),
              ),
              child: const FaIcon(FontAwesomeIcons.gear),
            ),
          ),
          /* -------------- 完成ボタン -------------- */
          Positioned(
            top: 85,
            right: 20,
            child: FloatingActionButton(
              heroTag: 'finish button',
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => FinishJewelScreen(),
                  ),
                );
              },
              backgroundColor: Colors.white,
              foregroundColor: Colors.black,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
                side: const BorderSide(color: Colors.orange, width: 4),
              ),
              child: const FaIcon(FontAwesomeIcons.toolbox),
            ),
          ),
          /* -------------- コレクションのボタン -------------- */
          Positioned(
            top: 150,
            right: 20,
            child: FloatingActionButton(
              heroTag: 'collection button',
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const CollectionsScreen()),
                );
              },
              backgroundColor: Colors.white,
              foregroundColor: Colors.black,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
                side: const BorderSide(color: Colors.orange, width: 4),
              ),
              child: const FaIcon(FontAwesomeIcons.boxArchive),
            ),
          ),
        ],
      ),
      /* -------------- 下のメニュー欄 -------------- */
      bottomNavigationBar: Container(
        color: Colors.grey[300],
        height: 150,
        child: const FooterButtons(location: 1),
      ),
    );
  }
}
