import 'package:flutter/material.dart';
import 'package:couldai_user_app/services/api_service.dart';
import 'package:couldai_user_app/models/models.dart';
import 'package:intl/intl.dart';

class MonthlyCalendarScreen extends StatelessWidget {
  const MonthlyCalendarScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Placeholder - implement monthly timetable with API data
    return Scaffold(
      appBar: AppBar(
        title: const Text('Monthly Prayer Times'),
      ),
      body: const Center(
        child: Text('Monthly Calendar Placeholder'),
      ),
    );
  }
}