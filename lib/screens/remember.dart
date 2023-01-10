import 'package:signshine/models/remember_page_models.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class RememberPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // This gets the current state of FavoritePageModel and also tells Flutter
    // to rebuild this widget when FavoritePageModel notifies listeners (in other words,
    // when it changes).
    return Scaffold(
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
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/bg.png'),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 12),
                // to call FavoritePageList widget //
                child: _RememberPageList(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// UI of FavoritePageList //
class _RememberPageList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var itemNameStyle = Theme
        .of(context)
        .textTheme
        .headline6;
    // This gets the current state of FavoritePageModel and also tells Flutter
    // to rebuild this widget when FavoritePageModel notifies listeners (in other words,
    // when it changes).
    var favoritepage = context.watch<RememberPageModel>();


    return ListView.builder(
      itemCount: favoritepage.items.length,
      itemBuilder: (context, index) => Container(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
        child: LimitedBox(
          maxHeight: 295,
          child: Row(
            children: [
              AspectRatio(
                aspectRatio: 1,
                child: Image.asset(favoritepage.items[index].image, scale: 0.8),
              ),
              IconButton(
                icon: const Icon(Icons.delete, color: Color(0xFF7C4492)),
                // code to remove the favorite list //
                onPressed: () {
                  favoritepage.remove(favoritepage.items[index]);
                },
              ),
              //title: Text(
              // favoritepage.items[index].name,
              //  style: itemNameStyle,
              //),
            ],
          ),
        ),
      ),
    );

  }
}







