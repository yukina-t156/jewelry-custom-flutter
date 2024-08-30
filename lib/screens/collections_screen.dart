// lib/screens/collections_screen.dart
import 'package:flutter/material.dart';
import 'package:jewelry_custom_flutter/services/jewel_service.dart';
import 'package:jewelry_custom_flutter/screens/collection_detail_screen.dart';
import 'package:jewelry_custom_flutter/model/jewelry_model.dart';
import 'package:jewelry_custom_flutter/widgets/foot_buttons.dart';

class CollectionsScreen extends StatefulWidget {
  const CollectionsScreen({super.key});

  @override
  State<CollectionsScreen> createState() => _CollectionsScreenState();
}

class _CollectionsScreenState extends State<CollectionsScreen> {
  List<Jewelry> jewelryList = [];

  @override
  void initState() {
    super.initState();
    _loadJewelry();
  }

  Future<void> _loadJewelry() async {
    final list = await JewelService.loadJewelry();
    setState(() {
      jewelryList = list;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue[100],
        title: const Text('コレクション'),
      ),
      body: jewelryList.isEmpty
          ? Center(child: Text('コレクションはありません'))
          : ListView.builder(
        itemCount: jewelryList.length,
        itemBuilder: (context, index) {
          final jewelry = jewelryList[index];
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
                      builder: (context) => CollectionDetailScreen(id: jewelry.id),
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
                        image: DecorationImage(
                          image: AssetImage(jewelry.imagePath ?? 'assets/images/default.png'),
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
                            jewelry.name ?? '',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: Colors.blueGrey[800],
                            ),
                          ),
                          Text(
                            'レベル: ${jewelry.level}',
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
