import 'package:camera/camera.dart';
import 'package:flutter/material.dart';

import '../main.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // Define required instances
  late CameraImage cameraImage;
  late CameraController cameraController;
  // Define required variables
  bool isWorking = false;
  String result = '';

  initCamera() {
    cameraController = CameraController(camera[0], ResolutionPreset.medium);
    cameraController.initialize().then((value) {
      if (!mounted) {
        return;
      }

      setState(() {
        cameraController.startImageStream((imageFromStream) {
          if (!isWorking) {
            isWorking = true;
            cameraImage = imageFromStream;
          }
        });
      });
    });
  }

  @override
  void initState() {
    initCamera();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SafeArea(
        child: Scaffold(
          appBar: AppBar(
            title: result.isEmpty
                ? const Text('ENFOQUE EL ROSTRO')
                : Padding(
                    padding: const EdgeInsets.only(top: 30.0),
                    child: Text(
                      result,
                      style: const TextStyle(fontSize: 25),
                      textAlign: TextAlign.center,
                    ),
                  ),
            centerTitle: true,
            backgroundColor: Colors.amber,
          ),
          body: Container(
            child: (!cameraController.value.isInitialized)
                ? Container()
                : Align(
                    alignment: Alignment.center,
                    child: AspectRatio(
                      aspectRatio: cameraController.value.aspectRatio,
                      child: CameraPreview(cameraController),
                    ),
                  ),
          ),
          backgroundColor: Colors.black,
        ),
      ),
      debugShowCheckedModeBanner: false,
    );
  }
}
