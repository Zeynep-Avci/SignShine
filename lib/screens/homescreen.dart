import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:signshine/navigationwidget.dart';
import 'package:signshine/screens/flippingcardscreen/flip_card.dart';
import 'package:signshine/screens/testscreen.dart';

import 'learning.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context){
    var size = MediaQuery.of(context)
        .size; //gives us the total height and width of our device
    return Scaffold(
      drawer: Drawer(
        child: ListView(
          children: <Widget>[
            CustomListTile(Icons.home_filled, 'Home', ()=>{
            Navigator.of(context).push(
            MaterialPageRoute(builder: (context) => HomeScreen()),
            )}),
            CustomListTile(Icons.my_library_books_sharp, 'Learn', ()=>{Navigator.of(context).push(
              MaterialPageRoute(builder: (context) => MyAppLearn()),
            )}),
            CustomListTile(Icons.person, 'Practice', ()=>{Navigator.of(context).push(
              MaterialPageRoute(builder: (context) => FlipScreen()),
            )}),
            CustomListTile(Icons.camera_alt, 'Test', ()=>{Navigator.of(context).push(
              MaterialPageRoute(builder: (context) => DetectScreen()),
            )}),
          ],
        ),
      ),
      body: Stack(
        children: <Widget>[
          Container(
            decoration: BoxDecoration(
              color: Color(0xFFFFEFF1),
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
                          press: () {
                            Navigator.of(context).push(
                              MaterialPageRoute(builder: (context) => MyAppLearn()),
                            );
                          },
                        ),
                        CategoryCard(
                          categorytitel: "Favourites",
                          assetsrc: 'assets/homeassets/feelings.png',
                          press: () {
                            Navigator.of(context).push(
                              MaterialPageRoute(builder: (context) => FlipScreen()),
                            );
                          },
                        ),
                        CategoryCard(
                          categorytitel: "Practice",
                          assetsrc: 'assets/homeassets/first-place-medal.png',
                          press: () {
                            Navigator.of(context).push(
                              MaterialPageRoute(builder: (context) => FlipScreen()),
                            );
                          },
                        ),
                        CategoryCard(
                          categorytitel: "Test yourself",
                          assetsrc: 'assets/homeassets/holding-smartphone.png',
                          press: () {
                            Navigator.of(context).push(
                              MaterialPageRoute(builder: (context) => DetectScreen()),
                            );
                          },
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
  final Function()? press;
  const CategoryCard({
    Key? key, required this.categorytitel, required this.assetsrc, required this.press,
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
              offset: Offset(0, 17),
              blurRadius: 17,
              spreadRadius: -23,
              color: Colors.black,
            ),
          ],
        ),
        child: Material(
          color: Colors.transparent,
          child: InkWell(
            onTap: press,
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