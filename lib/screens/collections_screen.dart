import 'package:flutter/material.dart';
import 'package:jewelry_custom_flutter/services/jewel_service.dart';
import 'collection_detail_screen.dart';
import 'package:jewelry_custom_flutter/model/jewel_model.dart';
import 'package:jewelry_custom_flutter/widgets/foot_buttons.dart';

class CollectionsScreen extends StatefulWidget {
  const CollectionsScreen({super.key});

  @override
  State<CollectionsScreen> createState() => _CollectionsScreenState();
}

class _CollectionsScreenState extends State<CollectionsScreen> {
  List<Jewel> jewels = [];

  @override
  void initState() {
    super.initState();
    _loadJewels();
  }

  Future<void> _loadJewels() async {
    final jewelList = await JewelService.getJewels();
    setState(() {
      jewels = jewelList.reversed.toList(); // 新しいものを上に表示
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue[100],
        title: const Text('コレクション'),
      ),
      body: jewels.isEmpty
          ? Center(child: Text('コレクションはありません'))
          : ListView.builder(
        itemCount: jewels.length,
        itemBuilder: (context, index) {
          final jewel = jewels[index];
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Container(
              margin: const EdgeInsets.symmetric(vertical: 8.0),
              padding: const EdgeInsets.all(16.0),
              decoration: BoxDecoration(
                color: Colors.blueGrey[200],
                borderRadius: BorderRadius.circular(12.0),
              ),
              child: InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => CollectionDetailScreen(id: jewel.id),
                    ),
                  );
                },
                child: Row(
                  children: <Widget>[
                    Container(
                      width: 50.0,
                      height: 50.0,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.blueGrey[300],
                      ),
                      child: ClipOval(
                        child: Image.asset(
                          jewel.imagePath ?? 'assets/images/default.png', // デフォルト画像を設定
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    const SizedBox(width: 16.0),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            jewel.name ?? '',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: Colors.blueGrey[800],
                            ),
                          ),
                          Text(
                            'レベル: ${jewel.level}',
                            style: TextStyle(
                              fontSize: 14,
                              color: Colors.blueGrey[600],
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
      bottomNavigationBar: Container(
        color: Colors.grey[300],
        height: 150,
        child: const FooterButtons(),
      ),
    );
  }
}
