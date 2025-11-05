import 'package:supabase_flutter/supabase_flutter.dart';

class SupabaseConfig {
  static const String supabaseUrl = 'https://sdzfmuudnschzeyxditt.supabase.co';
  static const String supabaseAnonKey = 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InNkemZtdXVkbnNjaHpleXhkaXR0Iiwicm9sZSI6ImFub24iLCJpYXQiOjE3NjIzMTg2MTIsImV4cCI6MjA3Nzg5NDYxMn0.jC1l8qI6wbLB5-j_GnyjO1vlGELSRPkRYnqVZJf6zvo';
  
  static SupabaseClient get client => Supabase.instance.client;
}