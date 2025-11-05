import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:geolocator/geolocator.dart';
import 'package:couldai_user_app/models/models.dart';

class ApiService {
  static const String baseUrl = 'https://api.aladhan.com/v1';

  // Fetch prayer times for Tashkent
  static Future<PrayerTimes> fetchPrayerTimes() async {
    final response = await http.get(Uri.parse('$baseUrl/timingsByCity?city=Tashkent&country=Uzbekistan&method=2'));
    if (response.statusCode == 200) {
      return PrayerTimes.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to load prayer times');
    }
  }

  // Fetch Qibla direction
  static Future<double> fetchQiblaDirection(double latitude, double longitude) async {
    final response = await http.get(Uri.parse('$baseUrl/qibla/$latitude/$longitude'));
    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      return data['data']['direction'];
    } else {
      throw Exception('Failed to load Qibla direction');
    }
  }

  // Get current location
  static Future<Position> getCurrentLocation() async {
    bool serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      throw Exception('Location services are disabled');
    }
    LocationPermission permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        throw Exception('Location permissions are denied');
      }
    }
    return await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
  }

  // Load static Quran data (placeholder - replace with asset loading)
  static Future<List<QuranVerse>> loadQuran() async {
    // In a real app, load from assets or Supabase
    return []; // Placeholder
  }

  // Load daily Ayah (random from static list)
  static QuranVerse getDailyAyah() {
    // Placeholder - implement random selection
    return QuranVerse(surah: 1, ayah: 1, text: 'Bismillah', translation: 'In the name of Allah');
  }

  // Load daily Hadith
  static Hadith getDailyHadith() {
    // Placeholder - implement random selection
    return Hadith(text: 'Sample Hadith', translation: 'Translation', source: 'Sahih Bukhari');
  }

  // Load Duas
  static List<Dua> loadDuas() {
    return [
      Dua(text: 'Astaghfirullah', translation: 'I seek forgiveness from Allah', category: 'Istighfar'),
      Dua(text: 'Subhanallah', translation: 'Glory be to Allah', category: 'Zikr'),
      Dua(text: 'Allahu Akbar', translation: 'Allah is the Greatest', category: 'Zikr'),
      // Add more as needed
    ];
  }
}