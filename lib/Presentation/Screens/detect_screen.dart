import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:flutter_object_detection_app/Presentation/Widgets/bnd_box_widget.dart';

import 'dart:math' as math;

import 'package:flutter_object_detection_app/Presentation/Widgets/camera_widget.dart';

class DetectScreen extends StatefulWidget {
  final List<CameraDescription> cameras;
  final String model;

  const DetectScreen({super.key, required this.cameras, required this.model});

  @override
  State<DetectScreen> createState() => _DetectScreenState();
}

class _DetectScreenState extends State<DetectScreen> {
  List<dynamic>? _recognitions;
  int _imageHeight = 0;
  int _imageWidth = 0;

  setRecognitions(recognitions, imageHeight, imageWidth) {
    setState(() {
      _recognitions = recognitions;
      _imageHeight = imageHeight;
      _imageWidth = imageWidth;
    });
  }

  @override
  Widget build(BuildContext context) {
    Size screen = MediaQuery.of(context).size;
    return Scaffold(
      body: Stack(
        children: [
          CameraWidget(
            widget.cameras,
            widget.model,
            setRecognitions,
          ),
          BndBoxWidget(
            _recognitions ?? [],
            math.max(_imageHeight, _imageWidth),
            math.min(_imageHeight, _imageWidth),
            screen.height,
            screen.width,
            widget.model,
          ),
        ],
      ),
    );
  }
}
