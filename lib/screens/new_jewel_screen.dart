import 'package:flutter/material.dart';
import 'package:jewelry_custom_flutter/model/jewel_model.dart';
import 'package:jewelry_custom_flutter/services/jewel_service.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:jewelry_custom_flutter/providers.dart';

class NewJewelScreen extends ConsumerStatefulWidget {
  const NewJewelScreen({super.key});

  @override
  ConsumerState<NewJewelScreen> createState() => _NewJewelScreenState();
}

class _NewJewelScreenState extends ConsumerState<NewJewelScreen> {
  int? selectedJewelTypeId; // ここでフィールドを定義

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final buttonWidth = screenWidth * 0.75; // 画面幅の75%

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue[100],
        title: const Text('新しく作る'),
      ),
      body: Stack(
        children: <Widget>[
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                DropdownButton<int>(
                  hint: const Text('宝石の種類を選んでね'),
                  value: selectedJewelTypeId,
                  onChanged: (int? newValue) {
                    setState(() {
                      selectedJewelTypeId = newValue;
                    });
                  },
                  items: jewelNames.entries.map<DropdownMenuItem<int>>((entry) {
                    return DropdownMenuItem<int>(
                      value: entry.key,
                      child: Text(entry.value),
                    );
                  }).toList(),
                ),
                SizedBox(
                  width: 200,
                  height: 200,
                  child: selectedJewelTypeId != null
                      ? Image.asset(
                    getJewelImagePath(selectedJewelTypeId ?? 0, 5),
                    fit: BoxFit.cover,
                  )
                      : const Text(
                    '選ぶ',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 20,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            bottom: 60,
            left: (screenWidth - buttonWidth) / 2,
            child: SizedBox(
              width: buttonWidth,
              child: ElevatedButton(
                onPressed: () async {
                  if (selectedJewelTypeId != null) {
                    final newId = await JewelService.generateNewId();
                    final jewel = Jewel(
                      id: newId,
                      jewelTypeId: selectedJewelTypeId!,
                      counter: 0,
                      level: 0,
                    );
                    ref.read(jewelProvider.notifier).updateJewel(jewel);
                    Navigator.pushNamedAndRemoveUntil(context, '/home', (route) => false);
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Please select a jewel type')),
                    );
                  }
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
                  '作成',
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
