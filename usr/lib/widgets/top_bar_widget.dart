import 'package:flutter/material.dart';
import 'package:couldai_user_app/services/api_service.dart';
import 'package:intl/intl.dart';

class TopBarWidget extends StatelessWidget {
  const TopBarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final now = DateTime.now();
    final formatter = DateFormat('EEEE, d MMMM y');
    final hijriDate = 'Hijri Date Placeholder'; // From API if available
    final nextPrayer = 'Next: Fajr at 05:00'; // Calculate from times

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [Color(0xFF006400), Color(0xFF004400)],
        ),
      ),
      child: SafeArea(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(formatter.format(now), style: const TextStyle(color: Colors.white, fontSize: 14)),
                Text('Tashkent, Uzbekistan', style: const TextStyle(color: Colors.white70, fontSize: 12)),
                Text(hijriDate, style: const TextStyle(color: Color(0xFFFFD700), fontSize: 12)),
              ],
            ),
            Text(nextPrayer, style: const TextStyle(color: Colors.white, fontSize: 14)),
          ],
        ),
      ),
    );
  }
}