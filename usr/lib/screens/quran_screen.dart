import 'package:flutter/material.dart';

class QuranScreen extends StatelessWidget {
  const QuranScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Qur\'an'),
        backgroundColor: Theme.of(context).primaryColor,
      ),
      body: const Center(
        child: Text('Qur\'an Screen'),
      ),
    );
  }
}
