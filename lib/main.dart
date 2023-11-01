import 'package:flutter/material.dart';
import 'package:pertemuan6/get_api.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Pertemuan 6',
      home: MyScreen(),
    );
  }
}

class MyScreen extends StatelessWidget {
  const MyScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.pinkAccent,
        title: const Center(
          child: Text('Pertemuan 6'),
        ),
      ),
      body: const Center(
        child: GetApi(),
      ),
    );
  }
}
