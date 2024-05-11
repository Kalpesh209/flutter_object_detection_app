import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_object_detection_app/AppUtils/app_colors.dart';
import 'package:flutter_object_detection_app/AppUtils/app_strings.dart';
import 'package:flutter_object_detection_app/Presentation/Screens/detect_screen.dart';
import 'package:flutter_object_detection_app/Presentation/Widgets/text_button_widget.dart';
import 'package:camera/camera.dart';
import 'package:flutter_tflite/flutter_tflite.dart';

class HomePageScreen extends StatefulWidget {
  const HomePageScreen({super.key});

  @override
  State<HomePageScreen> createState() => _HomePageScreenState();
}

class _HomePageScreenState extends State<HomePageScreen> {
  late final List<CameraDescription> cameras;

  @override
  Future<void> didChangeDependencies() async {
    super.didChangeDependencies();
    await setupCameras();
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  loadModel(model) async {
    String? res;
    switch (model) {
      case AppStrings.yolo:
        res = await Tflite.loadModel(
          model: 'assets/yolov2_tiny.tflite',
          labels: 'assets/yolov2_tiny.txt',
        );
        break;

      case AppStrings.mobilenet:
        res = await Tflite.loadModel(
          model: 'assets/mobilenet_v1_1.0_224.tflite',
          labels: 'assets/mobilenet_v1_1.0_224.txt',
        );
        break;

      case AppStrings.posenet:
        res = await Tflite.loadModel(
          model: 'assets/posenet_mv1_075_float_from_checkpoints.tflite',
        );
        break;

      default:
        res = await Tflite.loadModel(
          model: 'assets/ssd_mobilenet.tflite',
          labels: 'assets/ssd_mobilenet.txt',
        );
    }
  }

  onSelect(model) {
    loadModel(model);
    final route = MaterialPageRoute(builder: (context) {
      return DetectScreen(
        cameras: cameras,
        model: model,
      );
    });
    Navigator.of(context).push(route);
  }

  setupCameras() async {
    try {
      cameras = await availableCameras();
    } on CameraException catch (e) {
      log('Error: $e.code\nError Message: $e.message');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextButtonWidget(
                onButtonTap: () {
                  onSelect(AppStrings.ssd);
                },
                btnTxt: AppStrings.ssd,
                btnBackColor: AppColors.kblueColor,
                txtColor: AppColors.kwhiteColor,
              )
            ],
          ),
        ),
      ),
    );
  }
  // All Design Widgets will go below Build()
}
