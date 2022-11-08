import 'package:easy_splash_screen/easy_splash_screen.dart';
import 'package:flutter/material.dart';

class SplashScreenPage extends StatefulWidget {
  const SplashScreenPage({super.key});

  @override
  State<SplashScreenPage> createState() => _SplashScreenPageState();
}

class _SplashScreenPageState extends State<SplashScreenPage> {
  @override
  Widget build(BuildContext context) {
    return EasySplashScreen(
      durationInSeconds: 5,
      title: const Text(
        'Detector de Mascarillas',
        style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 26,
          color: Colors.black,
        ),
      ),
      logo: Image.asset('assets/SplashScreenImage.png'),
      logoWidth: 170,
      backgroundColor: Colors.white,
      loaderColor: Colors.amber,
      loadingText: const Text(
        'By ChampiMagic \n Homero Gazze',
        style: TextStyle(
          color: Colors.black,
          fontSize: 16,
        ),
        textAlign: TextAlign.center,
      ),
    );
  }
}
