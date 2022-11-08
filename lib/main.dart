import 'package:flutter/material.dart';
import 'package:mask_detector_app/Pages/splash_screen_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return (const MaterialApp(
      title: 'Detector de Mascarillas',
      home: SplashScreenPage(),
    ));
  }
}
