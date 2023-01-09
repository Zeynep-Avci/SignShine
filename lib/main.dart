import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:signshine/screens/flippingcardscreen/flip_card.dart';
import 'package:signshine/screens/flippingcardscreen/listshufflerclass.dart';
import 'package:signshine/screens/homescreen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

//immersive mode
  SystemChrome.setEnabledSystemUIMode(
    SystemUiMode.immersiveSticky,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This flippingcardwidget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'SignShine',
      home: HomeScreen(
      ),
    );
  }
}

