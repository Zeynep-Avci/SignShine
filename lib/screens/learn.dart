import 'package:flutter/material.dart';
import 'package:signshine/screens/remember.dart';

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
    'assets/0.png',
    'assets/1.png',
    'assets/2.png',
    'assets/3.png',
    'assets/4.png',
    'assets/5.png',
    'assets/6.png',
    'assets/7.png',
    'assets/8.png',
    'assets/9.png',
    'assets/10.png'
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
      backgroundColor: Colors.purpleAccent,
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
              fontSize: 30,
              color: Colors.yellow,
            ),
          ),
          Expanded(
            child: ListView.builder(
              scrollDirection: Axis.vertical,
              itemCount: widget.signImages.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      Image(
                        image: AssetImage(widget.signImages[index]),
                        width: 300,
                        height: 300,
                      ),
                      IconButton(
                          icon: Icon(
                            _favoriteImages.contains(widget.signImages[index])
                                ? Icons.favorite
                                : Icons.favorite_border,
                          ),
                          onPressed: () {
                            _toggleFavorite(widget.signImages[index]);
                          }),
                    ],
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
}
