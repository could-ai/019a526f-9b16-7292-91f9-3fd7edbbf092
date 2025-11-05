import 'package:flutter/material.dart';
import 'package:flutter_compass/flutter_compass.dart';
import 'package:couldai_user_app/services/api_service.dart';

class QiblaWidget extends StatefulWidget {
  const QiblaWidget({super.key});

  @override
  _QiblaWidgetState createState() => _QiblaWidgetState();
}

class _QiblaWidgetState extends State<QiblaWidget> {
  double? _qiblaDirection;
  double? _deviceDirection;
  bool _isLocationDetected = false;

  @override
  void initState() {
    super.initState();
    _loadQiblaDirection();
    FlutterCompass.events?.listen((event) {
      setState(() {
        _deviceDirection = event.heading;
      });
    });
  }

  Future<void> _loadQiblaDirection() async {
    try {
      final position = await ApiService.getCurrentLocation();
      final direction = await ApiService.fetchQiblaDirection(position.latitude, position.longitude);
      setState(() {
        _qiblaDirection = direction;
        _isLocationDetected = true;
      });
    } catch (e) {
      // Handle error
    }
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white.withOpacity(0.1),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            const Text(
              'Qibla Kompas',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Color(0xFFFFD700)),
            ),
            const SizedBox(height: 10),
            Text(
              _isLocationDetected ? 'Sizning joylashuvingiz aniqlandi' : 'Joylashuv aniqlanmoqda...',
              style: const TextStyle(color: Colors.white),
            ),
            const SizedBox(height: 20),
            if (_qiblaDirection != null && _deviceDirection != null)
              Transform.rotate(
                angle: (_qiblaDirection! - _deviceDirection!) * (3.14159 / 180),
                child: const Icon(
                  Icons.arrow_upward,
                  size: 100,
                  color: Color(0xFFFFD700),
                ),
              ),
          ],
        ),
      ),
    );
  }
}