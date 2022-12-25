import 'package:flutter/material.dart';

class FavoriteScreen extends StatelessWidget {
  final List<String> favoriteImages;

  FavoriteScreen({required this.favoriteImages});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Favorites'),
        centerTitle: true,
        backgroundColor: Colors.deepPurple,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            'Favorite Sign Language Images',
            style: TextStyle(
              fontSize: 30,
              color: Colors.yellow,
            ),
          ),
          Expanded(
            child: ListView.builder(
              scrollDirection: Axis.vertical,
              itemCount: favoriteImages.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      Image(
                        image: AssetImage(favoriteImages[index]),
                        width: 300,
                        height: 300,
                      ),
                      IconButton(
                        icon: Icon(Icons.favorite),
                        onPressed: () async {
// Remove the letter from the database or file
                        },
                      ),
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
