/*
import 'package:flutter/material.dart';
import 'package:signshine/screens/remember.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: LearningScreen(),
      routes: {
        '/favorites': (context) => FavoriteScreen(
          favoriteImages: [],
        ),
      },
    );
  }
}

class LearningScreen extends StatefulWidget {
  final List<String> signImages = [
    'assets/alphabet/a.png',
    'assets/alphabet/b.png',
    'assets/alphabet/c.png',
    'assets/alphabet/d.png',
    'assets/alphabet/e.png',
    'assets/alphabet/f.png',
    'assets/alphabet/g.png',
    'assets/alphabet/h.png',
    'assets/alphabet/i.png',
    'assets/alphabet/j.png',
    'assets/alphabet/k.png',
    'assets/alphabet/L.png',
    'assets/alphabet/m.png',
    'assets/alphabet/n.png',
    'assets/alphabet/o.png',
    'assets/alphabet/p.png',
    'assets/alphabet/q.png',
    'assets/alphabet/r.png',
    'assets/alphabet/s.png',
    'assets/alphabet/t.png',
    'assets/alphabet/u.png',
    'assets/alphabet/v.png',
    'assets/alphabet/w.png',
    'assets/alphabet/x.png',
    'assets/alphabet/y.png',
    'assets/alphabet/z.png',
  ];

  @override
  _LearningScreenState createState() => _LearningScreenState();
}

class _LearningScreenState extends State<LearningScreen> {
  List<String> _favoriteImages = [];

  void _toggleFavorite(String image) {
    setState(() {
      if (_favoriteImages.contains(image)) {
        _favoriteImages.remove(image);
      } else {
        _favoriteImages.add(image);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.purple[500],
      appBar: AppBar(
        title: Text('Learning Screen'),
        centerTitle: true,
        backgroundColor: Colors.deepPurple,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            'Learn Sign Language',
            style: TextStyle(
              fontSize: 25,
              color: Colors.yellow,
            ),
          ),
          Expanded(
            child: ListView.builder(
              scrollDirection: Axis.vertical,
              itemCount: widget.signImages.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.all(15),
                  child: Card(
                    elevation: 20,
                    shape: Border.all(width:5,),
                    color: Colors.purple[200],
                    child: Column(
                      children:[
                        SizedBox(height:20,),
                      Image(
                        image: AssetImage(widget.signImages[index]),
                        width: 248,
                        height: 248,
                      ),
                      IconButton(
                          icon: Icon(size:30,
                            _favoriteImages.contains(widget.signImages[index])
                                ? Icons.favorite
                                : Icons.favorite_border,
                          ),
                          onPressed: () {
                            _toggleFavorite(widget.signImages[index]);
                          }),
                   ],
                    ),
                  ),
                );
              },
            ),
          ),
          TextButton(
            child: Text('Remember sign',
                style: TextStyle(color: Colors.yellow, fontSize: 20,)),
            onPressed: () {
              Navigator.pushNamed(context, '/favorites');
            },
          ),
        ],
      ),
    );
  }
}*/
