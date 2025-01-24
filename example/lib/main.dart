import 'package:flutter/material.dart';
import 'package:safe_edge_insets/safe_edge_insets.dart';

void main() => runApp(const ExampleApp());

class ExampleApp extends StatelessWidget {
  const ExampleApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: ExamplePage(),
    );
  }
}

class ExamplePage extends StatelessWidget {
  const ExamplePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: TextField(),
      ),
      body: ListView.builder(
        padding: SafeEdgeInsets(
          context,
          top: false,
          minimum: EdgeInsets.all(16),
        ),
        itemBuilder: (context, index) => Container(
          color: Colors.primaries[index],
          height: 100,
        ),
        itemCount: Colors.primaries.length,
      ),
    );
  }
}
