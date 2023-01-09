import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:signshine/navigationwidget.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context){
    var size = MediaQuery.of(context)
        .size; //gives us the total height and width of our device
    return Scaffold(
      drawer: Drawer(
        child: ListView(
          children: <Widget>[
            CustomListTile(Icons.home_filled, 'Home', ()=>{}),
            CustomListTile(Icons.my_library_books_sharp, 'Learn', ()=>{}),
            CustomListTile(Icons.person, 'Practice', ()=>{}),
            CustomListTile(Icons.camera_alt, 'Test', ()=>{}),
          ],
        ),
      ),
      body: Stack(
        children: <Widget>[
          Container(
            decoration: BoxDecoration(
              color: Color(0xFFFFF8FA),
            ),
          ),
          Container(
            height: size.height * .40,
            decoration: BoxDecoration(
              color: Color(0xFF7C4492),
            ),
          ),
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget> [
                  AppBar(

                    backgroundColor: const Color(0xFF7C4492),
                    elevation: 0.0,
                    centerTitle: true,
                    title: Container(
                      height: 30,
                      child: Image.asset('assets/fontlogo.png'),
                    ),
                  ),
                  SizedBox(height: 20),
                  Text(
                    "Good Morning, \nShiner",
                    style: TextStyle(
                      fontFamily: 'Neatstone',
                      fontSize: 50,
                      color: Color(0xFFF1D97A),
                    ),
                  ),
                  SizedBox(height: 30),
                  Expanded(
                    child: GridView.count(
                      crossAxisCount: 2,
                      childAspectRatio: 0.75,
                      crossAxisSpacing: 20,
                      mainAxisSpacing: 20,
                      children: <Widget> [
                        CategoryCard(
                          categorytitel: "Learn the ASL",
                          assetsrc: 'assets/homeassets/fist-bump-gesture.png',
                        ),
                        CategoryCard(
                          categorytitel: "Favourites",
                          assetsrc: 'assets/homeassets/feelings.png',
                        ),
                        CategoryCard(
                          categorytitel: "Practice",
                          assetsrc: 'assets/homeassets/first-place-medal.png',
                        ),
                        CategoryCard(
                          categorytitel: "Test yourself",
                          assetsrc: 'assets/homeassets/holding-smartphone.png',
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );

  }
}

class CategoryCard extends StatelessWidget {
  final String categorytitel;
  final String assetsrc;
  const CategoryCard({
    Key? key, required this.categorytitel, required this.assetsrc,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(13),
      child: Container(
        //padding: EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(13),
          boxShadow: [
            BoxShadow(
              offset: Offset(30,50),
              blurRadius: 7,
              spreadRadius: 2,
              color: Colors.grey,
            ),
          ],
        ),
        child: Material(
          color: Colors.transparent,
          child: InkWell(
            onTap: () {},
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                children: <Widget>[
                  Spacer(),
                  Image.asset(assetsrc),
                  Spacer(),
                  Text(
                      categorytitel,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.black54,
                        fontWeight: FontWeight.w900,
                        fontSize: 20,)
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}