import 'package:flutter/material.dart';

class NamazScreen extends StatelessWidget {
  const NamazScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Namaz'),
        backgroundColor: Theme.of(context).primaryColor,
      ),
      body: const Center(
        child: Text('Namaz Screen'),
      ),
    );
  }
}
