import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      appBar: AppBar(
        backgroundColor: Colors.blueGrey.shade400,
        title: Text('API Bloc Practice', style: TextStyle(fontWeight: .bold)),
        centerTitle: true,
      ),
    );
  }
}
