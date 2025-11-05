import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:couldai_user_app/services/api_service.dart';
import 'package:couldai_user_app/models/models.dart';

class DuasScreen extends StatefulWidget {
  const DuasScreen({super.key});

  @override
  _DuasScreenState createState() => _DuasScreenState();
}

class _DuasScreenState extends State<DuasScreen> {
  int _counter = 0;
  final List<Dua> _duas = ApiService.loadDuas();

  @override
  void initState() {
    super.initState();
    _loadCounter();
  }

  Future<void> _loadCounter() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      _counter = prefs.getInt('tasbeeh_counter') ?? 0;
    });
  }

  Future<void> _saveCounter() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setInt('tasbeeh_counter', _counter);
  }

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
    _saveCounter();
  }

  void _resetCounter() {
    setState(() {
      _counter = 0;
    });
    _saveCounter();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tasbeh va Duolar'),
      ),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFF1a1a2e), Color(0xFF16213e)],
          ),
        ),
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              Card(
                color: Colors.white.withOpacity(0.1),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    children: [
                      const Text(
                        'Tasbeeh Counter',
                        style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Color(0xFFFFD700)),
                      ),
                      const SizedBox(height: 20),
                      Text(
                        '$_counter',
                        style: const TextStyle(fontSize: 48, color: Colors.white),
                      ),
                      const SizedBox(height: 20),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          ElevatedButton(
                            onPressed: _incrementCounter,
                            child: const Text('+'),
                          ),
                          const SizedBox(width: 20),
                          ElevatedButton(
                            onPressed: _resetCounter,
                            child: const Text('Reset'),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 20),
              ..._duas.map((dua) => Card(
                color: Colors.white.withOpacity(0.1),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    children: [
                      Text(dua.text, style: const TextStyle(color: Colors.white, fontFamily: 'Amiri')),
                      Text(dua.translation, style: const TextStyle(color: Colors.white70)),
                      Text(dua.category, style: const TextStyle(color: Color(0xFFFFD700))),
                    ],
                  ),
                ),
              )),
            ],
          ),
        ),
      ),
    );
  }
}