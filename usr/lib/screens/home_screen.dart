import 'package:flutter/material.dart';
import 'package:couldai_user_app/services/api_service.dart';
import 'package:couldai_user_app/models/models.dart';
import 'package:couldai_user_app/widgets/prayer_times_widget.dart';
import 'package:couldai_user_app/widgets/qibla_widget.dart';
import 'package:couldai_user_app/widgets/daily_ayah_hadith_widget.dart';
import 'package:couldai_user_app/widgets/top_bar_widget.dart';
import 'package:intl/intl.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  PrayerTimes? _prayerTimes;
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _loadPrayerTimes();
  }

  Future<void> _loadPrayerTimes() async {
    try {
      final times = await ApiService.fetchPrayerTimes();
      setState(() {
        _prayerTimes = times;
        _isLoading = false;
      });
    } catch (e) {
      setState(() {
        _isLoading = false;
      });
      // Handle error
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(80),
        child: TopBarWidget(),
      ),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFF1a1a2e), Color(0xFF16213e), Color(0xFF0f3460)],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: _isLoading
            ? const Center(child: CircularProgressIndicator())
            : SingleChildScrollView(
                padding: const EdgeInsets.all(16),
                child: Column(
                  children: [
                    if (_prayerTimes != null) PrayerTimesWidget(prayerTimes: _prayerTimes!),
                    const SizedBox(height: 20),
                    const QiblaWidget(),
                    const SizedBox(height: 20),
                    const DailyAyahHadithWidget(),
                  ],
                ),
              ),
      ),
    );
  }
}