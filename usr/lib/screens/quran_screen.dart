import 'package:flutter/material.dart';
import 'package:couldai_user_app/services/api_service.dart';
import 'package:couldai_user_app/models/models.dart';

class QuranScreen extends StatefulWidget {
  const QuranScreen({super.key});

  @override
  _QuranScreenState createState() => _QuranScreenState();
}

class _QuranScreenState extends State<QuranScreen> {
  List<QuranVerse> _verses = [];
  String _searchQuery = '';
  String _selectedSurah = 'All';

  @override
  void initState() {
    super.initState();
    _loadQuran();
  }

  Future<void> _loadQuran() async {
    final verses = await ApiService.loadQuran();
    setState(() {
      _verses = verses;
    });
  }

  List<QuranVerse> _filteredVerses() {
    return _verses.where((verse) {
      final matchesQuery = verse.text.contains(_searchQuery) || verse.translation.contains(_searchQuery);
      final matchesSurah = _selectedSurah == 'All' || verse.surah.toString() == _selectedSurah;
      return matchesQuery && matchesSurah;
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Qur\'an'),
      ),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFF1a1a2e), Color(0xFF16213e)],
          ),
        ),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(16),
              child: Row(
                children: [
                  Expanded(
                    child: TextField(
                      onChanged: (value) => setState(() => _searchQuery = value),
                      decoration: const InputDecoration(
                        hintText: 'Search...',
                        border: OutlineInputBorder(),
                      ),
                    ),
                  ),
                  const SizedBox(width: 10),
                  DropdownButton<String>(
                    value: _selectedSurah,
                    items: ['All', '1', '2'].map((surah) {
                      return DropdownMenuItem(value: surah, child: Text('Surah $surah'));
                    }).toList(),
                    onChanged: (value) => setState(() => _selectedSurah = value!),
                  ),
                ],
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: _filteredVerses().length,
                itemBuilder: (context, index) {
                  final verse = _filteredVerses()[index];
                  return Card(
                    color: Colors.white.withOpacity(0.1),
                    margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
                    child: Padding(
                      padding: const EdgeInsets.all(16),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            '${verse.surah}:${verse.ayah}',
                            style: const TextStyle(color: Color(0xFFFFD700), fontWeight: FontWeight.bold),
                          ),
                          const SizedBox(height: 10),
                          Text(verse.text, style: const TextStyle(color: Colors.white, fontFamily: 'Amiri')),
                          const SizedBox(height: 10),
                          Text(verse.translation, style: const TextStyle(color: Colors.white70)),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}