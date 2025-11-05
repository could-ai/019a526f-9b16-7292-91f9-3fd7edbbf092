class PrayerTimes {
  final String fajr;
  final String dhuhr;
  final String asr;
  final String maghrib;
  final String isha;
  final String hijriDate;
  final String gregorianDate;

  PrayerTimes({
    required this.fajr,
    required this.dhuhr,
    required this.asr,
    required this.maghrib,
    required this.isha,
    required this.hijriDate,
    required this.gregorianDate,
  });

  factory PrayerTimes.fromJson(Map<String, dynamic> json) {
    final timings = json['data']['timings'];
    final date = json['data']['date'];
    return PrayerTimes(
      fajr: timings['Fajr'],
      dhuhr: timings['Dhuhr'],
      asr: timings['Asr'],
      maghrib: timings['Maghrib'],
      isha: timings['Isha'],
      hijriDate: date['hijri']['date'],
      gregorianDate: date['gregorian']['date'],
    );
  }
}

class QuranVerse {
  final int surah;
  final int ayah;
  final String text;
  final String translation;

  QuranVerse({
    required this.surah,
    required this.ayah,
    required this.text,
    required this.translation,
  });
}

class Hadith {
  final String text;
  final String translation;
  final String source;

  Hadith({
    required this.text,
    required this.translation,
    required this.source,
  });
}

class Dua {
  final String text;
  final String translation;
  final String category; // e.g., 'Zikr', 'Salawat', 'Istighfar'

  Dua({
    required this.text,
    required this.translation,
    required this.category,
  });
}