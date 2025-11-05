import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  _SettingsScreenState createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  bool _notificationsEnabled = true;
  bool _darkTheme = false;
  String _language = 'Uzbek';

  @override
  void initState() {
    super.initState();
    _loadSettings();
  }

  Future<void> _loadSettings() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      _notificationsEnabled = prefs.getBool('notifications') ?? true;
      _darkTheme = prefs.getBool('dark_theme') ?? false;
      _language = prefs.getString('language') ?? 'Uzbek';
    });
  }

  Future<void> _saveSettings() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('notifications', _notificationsEnabled);
    await prefs.setBool('dark_theme', _darkTheme);
    await prefs.setString('language', _language);
  }

  void _scheduleNotifications() {
    if (_notificationsEnabled) {
      // Schedule prayer notifications using FlutterLocalNotificationsPlugin
      // Placeholder - implement with prayer times
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Settings'),
      ),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFF1a1a2e), Color(0xFF16213e)],
          ),
        ),
        child: ListView(
          padding: const EdgeInsets.all(16),
          children: [
            SwitchListTile(
              title: const Text('Prayer Notifications', style: TextStyle(color: Colors.white)),
              value: _notificationsEnabled,
              onChanged: (value) {
                setState(() => _notificationsEnabled = value);
                _saveSettings();
                _scheduleNotifications();
              },
            ),
            SwitchListTile(
              title: const Text('Dark Theme', style: TextStyle(color: Colors.white)),
              value: _darkTheme,
              onChanged: (value) {
                setState(() => _darkTheme = value);
                _saveSettings();
              },
            ),
            ListTile(
              title: const Text('Language', style: TextStyle(color: Colors.white)),
              subtitle: Text(_language, style: const TextStyle(color: Colors.white70)),
              onTap: () {
                // Language selection dialog
              },
            ),
          ],
        ),
      ),
    );
  }
}