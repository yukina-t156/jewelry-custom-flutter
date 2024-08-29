import 'package:flutter/material.dart';

class CollectionDetailScreen extends StatelessWidget {
  final int id;

  const CollectionDetailScreen({super.key, required this.id});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Detail of Item $id'),
      ),
      body: Center(
        child: Text('Details for item with ID: $id'),
      ),
    );
  }
}
