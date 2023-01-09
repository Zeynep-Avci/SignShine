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
        title: Text(
          'Remember',
          style: Theme.of(context).textTheme.headline1,
        ),
      ),
      body: Container(
        color: Colors.purple[100],
        child: Column(
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(40),
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
        child: LimitedBox(
          maxHeight: 250,
          child: Row(
            children: [
              AspectRatio(
                aspectRatio: 1,
                child: Image.asset(favoritepage.items[index].image),
              ),
              IconButton(
                icon: const Icon(Icons.delete),
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







