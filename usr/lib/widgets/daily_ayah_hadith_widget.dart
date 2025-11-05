import 'package:flutter/material.dart';
import 'package:couldai_user_app/services/api_service.dart';
import 'package:url_launcher/url_launcher.dart';

class DailyAyahHadithWidget extends StatelessWidget {
  const DailyAyahHadithWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final ayah = ApiService.getDailyAyah();
    final hadith = ApiService.getDailyHadith();

    return Column(
      children: [
        Card(
          color: Colors.white.withOpacity(0.1),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              children: [
                const Text(
                  'Kunlik Oyat',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Color(0xFFFFD700)),
                ),
                const SizedBox(height: 10),
                Text(ayah.text, style: const TextStyle(color: Colors.white, fontFamily: 'Amiri')),
                Text(ayah.translation, style: const TextStyle(color: Colors.white70)),
                IconButton(
                  icon: const Icon(Icons.share, color: Color(0xFFFFD700)),
                  onPressed: () => _shareContent(ayah.text + '\n' + ayah.translation),
                ),
              ],
            ),
          ),
        ),
        const SizedBox(height: 20),
        Card(
          color: Colors.white.withOpacity(0.1),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              children: [
                const Text(
                  'Kunlik Hadis',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Color(0xFFFFD700)),
                ),
                const SizedBox(height: 10),
                Text(hadith.text, style: const TextStyle(color: Colors.white, fontFamily: 'Amiri')),
                Text(hadith.translation, style: const TextStyle(color: Colors.white70)),
                Text('Source: ${hadith.source}', style: const TextStyle(color: Colors.white70)),
                IconButton(
                  icon: const Icon(Icons.share, color: Color(0xFFFFD700)),
                  onPressed: () => _shareContent(hadith.text + '\n' + hadith.translation),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  void _shareContent(String content) async {
    final url = 'https://t.me/share/url?url=&text=${Uri.encodeComponent(content)}';
    if (await canLaunch(url)) {
      await launch(url);
    }
  }
}