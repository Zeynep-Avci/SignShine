import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:signshine/flippingcardscreen/flip_card.dart';
import 'dart:math';

import 'package:signshine/main.dart';

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
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({
    super.key, required this.title
  });

  // This flippingcardwidget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App flippingcardwidget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class Listsshuffler {
  List<String> flippingcards;
  List<String> flippingcardsletter;

  Listsshuffler(this.flippingcards, this.flippingcardsletter);

  void shuffle(){
    var combined = List.generate(flippingcards.length, (i) => [flippingcards[i],
      flippingcardsletter[i]]);
    combined.shuffle(Random.secure());
    flippingcards = combined.map((pair) => pair[0]).toList();
    flippingcardsletter = combined.map((pair) => pair[1]).toList();
  }
}

//comes inside scaffold under appbar
/*

 */

class _MyHomePageState extends State<MyHomePage> {

  var lists = Listsshuffler([
    'assets/flipping card/back/backa.png',
    'assets/flipping card/back/backb.png',
    'assets/flipping card/back/backc.png',
    'assets/flipping card/back/backd.png',
    'assets/flipping card/back/backe.png',
    'assets/flipping card/back/backf.png',
    'assets/flipping card/back/backg.png',
    'assets/flipping card/back/backh.png',
    'assets/flipping card/back/backi.png',
    'assets/flipping card/back/backj.png',
    'assets/flipping card/back/backk.png',
    'assets/flipping card/back/backl.png',
    'assets/flipping card/back/backm.png',
    'assets/flipping card/back/backn.png',
    'assets/flipping card/back/backo.png',
    'assets/flipping card/back/backp.png',
    'assets/flipping card/back/backq.png',
    'assets/flipping card/back/backr.png',
    'assets/flipping card/back/backs.png',
    'assets/flipping card/back/backt.png',
    'assets/flipping card/back/backu.png',
    'assets/flipping card/back/backv.png',
    'assets/flipping card/back/backw.png',
    'assets/flipping card/back/backx.png',
    'assets/flipping card/back/backy.png',
    'assets/flipping card/back/backz.png',
  ], [
    'A',
    'B',
    'C',
    'D',
    'E',
    'F',
    'G',
    'H',
    'I',
    'J',
    'K',
    'L',
    'M',
    'N',
    'O',
    'P',
    'Q',
    'R',
    'S',
    'T',
    'U',
    'V',
    'W',
    'X',
    'Y',
    'Z',]);

  @override
  Widget build(BuildContext context) =>
      Scaffold(
          appBar: AppBar(
            backgroundColor: const Color(0xFF7C4492),
            centerTitle: true,
            title: Container(
              height: 30,
              child: Image.asset('assets/fontlogo.png'),
            ),
          ),
          body: Container(
              alignment: Alignment.center,
              padding: EdgeInsets.all(32),
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/bg.png'),
                  fit: BoxFit.cover,
                ),
              ),
          ),
      );
}

