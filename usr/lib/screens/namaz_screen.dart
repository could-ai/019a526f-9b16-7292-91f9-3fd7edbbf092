import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'dart:convert';

class NamazScreen extends StatefulWidget {
  const NamazScreen({super.key});

  @override
  _NamazScreenState createState() => _NamazScreenState();
}

class _NamazScreenState extends State<NamazScreen> {
  late YoutubePlayerController _controller;
  String _selectedNamaz = 'Fajr';
  List<String> _steps = [];
  String _textExplanation = '';

  final Map<String, String> _videoIds = {
    'Fajr': 'VIDEO_ID_FOR_FAJR',
    'Dhuhr': 'VIDEO_ID_FOR_DHUHR',
    // Add others
  };

  @override
  void initState() {
    super.initState();
    _controller = YoutubePlayerController(
      initialVideoId: _videoIds[_selectedNamaz]!,
      flags: const YoutubePlayerFlags(autoPlay: false),
    );
    _loadNamazData();
  }

  Future<void> _loadNamazData() async {
    // Load from assets (placeholder)
    final data = await rootBundle.loadString('assets/namaz/${_selectedNamaz.toLowerCase()}.json');
    final jsonData = json.decode(data);
    setState(() {
      _steps = List<String>.from(jsonData['steps']);
      _textExplanation = jsonData['explanation'];
    });
  }

  void _changeNamaz(String namaz) {
    setState(() {
      _selectedNamaz = namaz;
    });
    _controller.load(_videoIds[namaz]!);
    _loadNamazData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Namaz O\'rganish'),
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
              DropdownButton<String>(
                value: _selectedNamaz,
                items: ['Fajr', 'Dhuhr', 'Asr', 'Maghrib', 'Isha'].map((namaz) {
                  return DropdownMenuItem(value: namaz, child: Text(namaz));
                }).toList(),
                onChanged: (value) => _changeNamaz(value!),
              ),
              const SizedBox(height: 20),
              YoutubePlayer(controller: _controller),
              const SizedBox(height: 20),
              ..._steps.map((step) => Card(
                color: Colors.white.withOpacity(0.1),
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Row(
                    children: [
                      const Icon(Icons.check_circle, color: Color(0xFFFFD700)),
                      const SizedBox(width: 10),
                      Expanded(child: Text(step, style: const TextStyle(color: Colors.white))),
                    ],
                  ),
                ),
              )),
              const SizedBox(height: 20),
              Text(_textExplanation, style: const TextStyle(color: Colors.white)),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}