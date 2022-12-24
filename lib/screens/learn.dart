import 'package:flutter/material.dart';
import 'package:signshine/screens/remember.dart';


void main() {
  runApp(
    Container(
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: LearningScreen(),
    );
  }
}

class LearningScreen extends StatelessWidget {
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
              itemCount: signImages.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      Image(
                        image: AssetImage(signImages[index]),
                        width: 300,
                        height: 300,
                      ),
                      IconButton(
                        icon: Icon(Icons.favorite_border_outlined),
                        onPressed: () async {
                          // Add the letter to the database or file
                        },
                      ),
                   /*   RaisedButton(
                        child: Text('View Favorites'),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => FavoriteScreen(favoriteImages: []),
                            ),
                          );
                        },
                      ),*/
                    ],
                  ),
                );
              },
            ),
          )
        ],
      ),
    );
  }
}

