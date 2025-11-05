import 'package:flutter/material.dart';
import 'package:couldai_user_app/models/models.dart';
import 'package:intl/intl.dart';

class PrayerTimesWidget extends StatelessWidget {
  final PrayerTimes prayerTimes;

  const PrayerTimesWidget({super.key, required this.prayerTimes});

  @override
  Widget build(BuildContext context) {
    final prayers = {
      'Bomdod (Fajr)': prayerTimes.fajr,
      'Peshin (Dhuhr)': prayerTimes.dhuhr,
      'Asr': prayerTimes.asr,
      'Shom (Maghrib)': prayerTimes.maghrib,
      'Xufton (Isha)': prayerTimes.isha,
    };

    return Card(
      color: Colors.white.withOpacity(0.1),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Namoz Vaqtlari',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Color(0xFFFFD700)),
            ),
            const SizedBox(height: 10),
            ...prayers.entries.map((entry) => Padding(
              padding: const EdgeInsets.symmetric(vertical: 4),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(entry.key, style: const TextStyle(color: Colors.white)),
                  Text(entry.value, style: const TextStyle(color: Colors.white)),
                ],
              ),
            )),
            const SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {
                // Navigate to monthly calendar
                Navigator.pushNamed(context, '/monthly_calendar');
              },
              child: const Text('Monthly Timetable'),
            ),
          ],
        ),
      ),
    );
  }
}