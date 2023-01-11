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
  runApp(DetectScreen());
}

class DetectScreen extends StatelessWidget {
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
      model: "assets/ml/model.tflite",
      labels: "assets/ml/labels.txt",
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
      appBar: AppBar(
        backgroundColor: const Color(0xFF7C4492),
        centerTitle: true,
        title: Container(
          height: 30,
          child: Image.asset('assets/fontlogo.png'),
        ),
      ),
      body: Center(
        child: Container(
          alignment: Alignment.center,
          padding: EdgeInsets.all(32),
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/bg.png'),
              fit: BoxFit.cover,
            ),
          ),
          //color: Theme.of(context).primaryColor,
          child: Container(
            margin: EdgeInsets.all(20),
            height: 50,
            width: w,
            child: MaterialButton(
              color: const Color(0xFFF1D97A),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20)),
              onPressed: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => Detect(),
                  ),
                );
              },
              child: const Text(
                'Test it yourself!',
                style: TextStyle( fontFamily: 'Neatstone',
                        fontSize: 30,
                        color: Colors.black54,
                    /*TextStyle(
                   /   color: Colors.black54,
                      fontWeight: FontWeight.w900,
                      fontSize: 20,)*/
              ),
            ),
          ),
        ),
      ),
    ),
    );
  }
}
