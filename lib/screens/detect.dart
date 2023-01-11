import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:flutter_tflite/flutter_tflite.dart';

import 'testscreen.dart';

class Detect extends StatefulWidget {
  @override
  _DetectState createState() => _DetectState();
}

class _DetectState extends State<Detect> {
  String answer = "";
  CameraController? cameraController;
  CameraImage? cameraImage;


//  change the model name in main file at line number 35,36 
//   loadmodel() async {
//     Tflite.loadModel(
//       model: "assets/detect.tflite",
//       labels: "assets/labels.txt",
//     );
//   }

  initCamera() {
    // cameraController = CameraController(cameras![0], ResolutionPreset.medium);

    // OR
    cameraController = CameraController(
        CameraDescription(
          name: '0', // 0 for back camera and 1 for front camera
          lensDirection: CameraLensDirection.back,
          sensorOrientation: 0,
        ),
        ResolutionPreset.medium);


    cameraController!.initialize().then(
          (value) {
        if (!mounted) {
          return;
        }
        setState(
              () {
            cameraController!.startImageStream(
                  (image) =>
              {
                if (true)
                  {
                    // setState(
                    //   () {
                    //     cameraImage = image;
                    //   },
                    // ),
                    cameraImage = image,

                    applymodelonimages(),
                  }
              },
            );
          },
        );
      },
    );
  }

  applymodelonimages() async {
    if (cameraImage != null) {
      var predictions = await Tflite.runModelOnFrame(
          bytesList: cameraImage!.planes.map(
                (plane) {
              return plane.bytes;
            },
          ).toList(),
          imageHeight: cameraImage!.height,
          imageWidth: cameraImage!.width,
          imageMean: 127.5,
          imageStd: 127.5,
          rotation: 90,
          numResults: 3,
          threshold: 0.1,
          asynch: true);

      answer = '';

      predictions!.forEach(
            (prediction) {
          answer +=
              prediction['label'].toString().substring(0, 1).toUpperCase() +
                  prediction['label'].toString().substring(1) +
                  " " +
                  (prediction['confidence'] as double).toStringAsFixed(3) +
                  '\n';
        },
      );
      setState(
            () {
          answer = answer;
        },
      );
    }
  }


  @override
  void initState() {
    super.initState();
    initCamera();
    // loadmodel();
  }

  @override
  void dispose() async {
    super.dispose();

    await Tflite.close();
    cameraController!.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      //theme:
      //ThemeData(brightness: Brightness.dark, primaryColor: Colors.purple),
      debugShowCheckedModeBanner: false,
      home: SafeArea(
        child: Scaffold(
          body: cameraImage != null
              ? Container(
            height: MediaQuery
                .of(context)
                .size
                .height,
            width: MediaQuery
                .of(context)
                .size
                .width,
            color: const Color(0xFFF1D97A),
            child: Stack(
              children: [
                Positioned(
                  child: Center(
                    child: SizedBox(
                      width: MediaQuery
                          .of(context)
                          .size
                          .width,
                      height: 500,
                      child: CameraPreview(
                        cameraController!,
                      ),
                    ),
                  ),
                ),
                Positioned(
                  bottom: 0,
                  left: 0,
                  right: 0,
                  child: Center(
                    child: Container(
                      padding: EdgeInsets.all(10),
                      color: const Color(0xFF7C4492),
                      child: Center(
                        child: Text(
                          answer,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontSize: 25, color: Colors.white),
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
          )
              : Container(),
        ),
      ),
    );
  }
}