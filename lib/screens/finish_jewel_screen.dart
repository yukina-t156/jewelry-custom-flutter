import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:jewelry_custom_flutter/model/jewelry_model.dart';
import 'package:jewelry_custom_flutter/screens/new_jewel_screen.dart';
import 'package:jewelry_custom_flutter/services/jewel_service.dart';
import 'package:jewelry_custom_flutter/providers.dart';

class FinishJewelScreen extends ConsumerStatefulWidget {
  const FinishJewelScreen({super.key});

  @override
  ConsumerState<FinishJewelScreen> createState() => _FinishJewelScreenState();
}

class _FinishJewelScreenState extends ConsumerState<FinishJewelScreen> {
  int? selectedProcessingTypeId;

  @override
  Widget build(BuildContext context) {
    final jewel = ref.watch(jewelProvider);
    final screenWidth = MediaQuery.of(context).size.width;
    final buttonWidth = screenWidth * 0.75;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue[100],
        title: const Text('加工する'),
      ),
      body: Stack(
        children: <Widget>[
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                DropdownButton<int>(
                  hint: const Text('加工方法を選んでね'),
                  value: selectedProcessingTypeId,
                  onChanged: (int? newValue) {
                    setState(() {
                      selectedProcessingTypeId = newValue;
                    });
                  },
                  items: processingMethods.entries.map<DropdownMenuItem<int>>((entry) {
                    return DropdownMenuItem<int>(
                      value: entry.key,
                      child: Text(entry.value),
                    );
                  }).toList(),
                ),
                SizedBox(
                  width: 200,
                  height: 200,
                  child: selectedProcessingTypeId != null
                      ? Image.asset(
                    getJewelryImagePath(
                        jewel.jewelTypeId, selectedProcessingTypeId ?? 0, jewel.level),
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
                onPressed: () {
                  if (selectedProcessingTypeId != null) {
                    final jewelry = Jewelry(
                      id: jewel.id,
                      jewelTypeId: jewel.jewelTypeId,
                      counter: jewel.counter,
                      level: jewel.level,
                      processingMethod: selectedProcessingTypeId!,
                      imagePath: getJewelryImagePath(
                          jewel.jewelTypeId, selectedProcessingTypeId!, jewel.level),
                    );
                    JewelService.addJewelry(jewelry);

                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => NewJewelScreen(),
                      ),
                    );
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('加工方法を選んでね')),
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
                  '完成',
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
