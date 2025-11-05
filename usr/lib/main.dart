import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:couldai_user_app/integrations/supabase.dart';
import 'package:couldai_user_app/screens/main_screen.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Initialize Supabase
  await Supabase.initialize(
    url: SupabaseConfig.supabaseUrl,
    anonKey: SupabaseConfig.supabaseAnonKey,
  );

  // Initialize notifications
  const AndroidInitializationSettings initializationSettingsAndroid =
      AndroidInitializationSettings('@mipmap/ic_launcher');
  const InitializationSettings initializationSettings =
      InitializationSettings(android: initializationSettingsAndroid);
  await FlutterLocalNotificationsPlugin().initialize(initializationSettings);

  runApp(const ImonApp());
}

class ImonApp extends StatelessWidget {
  const ImonApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Imon App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.green,
        primaryColor: const Color(0xFF006400), // Dark green
        hintColor: const Color(0xFFFFD700), // Gold
        scaffoldBackgroundColor: const Color(0xFF1a1a2e), // Dark night sky
        fontFamily: 'Montserrat',
        textTheme: const TextTheme(
          headlineLarge: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold, color: Color(0xFFFFD700)),
          bodyLarge: TextStyle(fontSize: 16.0, color: Colors.white),
          bodyMedium: TextStyle(fontSize: 14.0, color: Colors.white70),
        ),
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.green).copyWith(
          secondary: const Color(0xFFFFD700),
          surface: const Color(0xFF16213e), // Mosque-like gradient base
        ),
        appBarTheme: const AppBarTheme(
          backgroundColor: Color(0xFF006400),
          foregroundColor: Colors.white,
          titleTextStyle: TextStyle(fontFamily: 'Amiri', fontSize: 20, fontWeight: FontWeight.bold),
        ),
      ),
      home: const MainScreen(),
    );
  }
}