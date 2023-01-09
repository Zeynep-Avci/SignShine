import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:flutter_tflite/flutter_tflite.dart';
import 'detect.dart';

List<CameraDescription>? cameras;

//main() async {
//WidgetsFlutterBinding.ensureInitialized();
// cameras = await availableCameras();
//  runApp(MyApp());
//}

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  //cameras = await availableCameras();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Colors.amber[50],
      ),
      home: TestScreen(),
    );
  }
}

class TestScreen extends StatefulWidget {
  @override
  _TestScreenState createState() => _TestScreenState();
}

class _TestScreenState extends State<TestScreen> {
  loadmodel() async {
    Tflite.loadModel(
      model: "assets/ml/model_all.tflite",
      labels: "assets/ml/label.txt",
    );
  }

  @override
  void initState() {
    super.initState();
    loadmodel();
  }

  @override
  Widget build(BuildContext context) {
    var h = MediaQuery.of(context).size.height;
    var w = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.deepPurpleAccent,
      body: Center(
        child: Container(
          color: Theme.of(context).primaryColor,
          child: Container(
            margin: EdgeInsets.all(20),
            height: 50,
            width: w,
            child: MaterialButton(
              color: Colors.amberAccent,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20)),
              onPressed: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => Home(),
                  ),
                );
              },
              child: Text(
                'Test it yourself!',
                style: TextStyle(fontSize: 22),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
