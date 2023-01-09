import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:signshine/screens/flippingcardscreen/flip_card.dart';
import 'package:signshine/screens/flippingcardscreen/listshufflerclass.dart';

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
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context){
    var size = MediaQuery.of(context)
        .size; //gives us the total height and width of our device
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Container(
            height: size.height * .45,
            decoration: BoxDecoration(
              color: Color(0xFFF5CE88),
            ),
          ),
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget> [
                  Align(
                    alignment: Alignment.topRight,
                    child: Container(
                      alignment: Alignment.center,
                      height: 32,
                      width: 52,
                      decoration: BoxDecoration(
                        color: Color(0xFFF2BEA1),
                        shape: BoxShape.circle,
                      ),
                    ),
                  ),
                Text(
                  "Learn fabulously to \nSHINE :)",
                  style: TextStyle(
                    fontWeight: FontWeight.w900,
                    fontSize: 20,
                  ),
                ),
                  Expanded(
                    child: GridView.count(
                      crossAxisCount: 2,
                      childAspectRatio: 0.85,
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
              offset: Offset(0,17),
              blurRadius: 17,
              spreadRadius: -23,
              color: Colors.black12,
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
                      fontWeight: FontWeight.w900,
                      fontSize: 18,)
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
