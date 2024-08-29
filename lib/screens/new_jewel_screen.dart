import 'package:flutter/material.dart';
import 'package:jewelry_custom_flutter/model/jewel_model.dart';
import 'package:jewelry_custom_flutter/screens/home_screen.dart';

class NewJewelScreen extends StatefulWidget {
  const NewJewelScreen({super.key});

  @override
  State<NewJewelScreen> createState() => _NewJewelScreenState();
}

class _NewJewelScreenState extends State<NewJewelScreen> {
  int? selectedJewelTypeId;

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
                  hint: const Text('Select a jewel type'),
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
                  child: Image.asset(
                    (selectedJewelTypeId!=null)?getJewelImagePath(selectedJewelTypeId ?? 0, 5):'assets/images/test_jewel.png',
                    fit: BoxFit.cover,
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
                  // ボタンが押されたときの処理
                  if (selectedJewelTypeId != null) {
                    final jewel = Jewel(
                      jewelTypeId: selectedJewelTypeId!,
                      counter: 0,
                      level: 0,
                    );
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => HomeScreen(jewel: jewel), // 修正済み
                      ),
                    );
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
