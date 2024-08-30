// lib/screens/finish_jewel_screen.dart
import 'package:flutter/material.dart';
import 'package:jewelry_custom_flutter/model/jewelry_model.dart';
import 'package:jewelry_custom_flutter/services/jewel_service.dart';
import 'package:jewelry_custom_flutter/providers.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class FinishJewelScreen extends ConsumerStatefulWidget {
  const FinishJewelScreen({super.key});

  @override
  ConsumerState<FinishJewelScreen> createState() => _FinishJewelScreenState();
}

class _FinishJewelScreenState extends ConsumerState<FinishJewelScreen> {
  int selectedProcessingMethod = 0; // デフォルトの加工方法

  @override
  Widget build(BuildContext context) {
    final jewel = ref.watch(jewelProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('完成画面'),
      ),
      body: Column(
        children: <Widget>[
          Text('加工方法を選択してください'),
          DropdownButton<int>(
            value: selectedProcessingMethod,
            onChanged: (int? newValue) {
              setState(() {
                selectedProcessingMethod = newValue ?? 0;
              });
            },
            items: [0, 1, 2].map<DropdownMenuItem<int>>((value) {
              return DropdownMenuItem<int>(
                value: value,
                child: Text('加工方法 $value'),
              );
            }).toList(),
          ),
          ElevatedButton(
            onPressed: () {
              if (jewel != null) {
                final jewelry = Jewelry(
                  id: jewel.id,
                  jewelTypeId: jewel.jewelTypeId,
                  counter: jewel.counter,
                  level: jewel.level,
                  processingMethod: selectedProcessingMethod,
                  imagePath: getJewelryImagePath(
                      jewel.jewelTypeId, selectedProcessingMethod, jewel.level),
                );
                JewelService.addJewelry(jewelry); // Jewelryを保存
                Navigator.pop(context); // 画面を戻る
              }
            },
            child: const Text('保存する'),
          ),
        ],
      ),
    );
  }
}
