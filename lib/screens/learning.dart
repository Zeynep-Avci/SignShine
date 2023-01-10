import 'package:signshine/models/learning_models.dart';
import 'package:signshine/models/remember_page_models.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:signshine/common/theme.dart';
import 'package:signshine/screens/remember.dart';


void main() {
  runApp(MyAppLearn());
}

class MyAppLearn extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Using MultiProvider is convenient when providing multiple objects.
    return MultiProvider(
      providers: [
        // In this sample app, FavoriteListModel never changes, so a simple Provider
        // is sufficient.
        Provider(create: (context) => LearnPageModel()),
        // FavoritePageModel is implemented as a ChangeNotifier, which calls for the use
        // of ChangeNotifierProvider. Moreover, FavoritePageModel depends
        // on FavoriteListModel, so a ProxyProvider is needed.
        ChangeNotifierProxyProvider<LearnPageModel, RememberPageModel>(
          create: (context) => RememberPageModel(),
          update: (context, favoritelist, favoritepage) {
            if (favoritepage == null)
              throw ArgumentError.notNull('favoritepage');
            favoritepage.favoritelist = favoritelist;
            return favoritepage;
          },
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Favorite Provider',
        theme: appTheme,
        initialRoute: '/',
        routes: {
          '/': (context) => LearningPage(),
          '/favoritepage': (context) => RememberPage(),
        },
      ),
    );
  }
}

class LearningPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            title:
                Text('Learn', style: Theme.of(context).textTheme.headline1),
            floating: true,
            actions: [
              IconButton(
                icon: const Icon(Icons.favorite_border),
                // code of navigation to favorite page //
                onPressed: () => Navigator.pushNamed(context, '/favoritepage'),
              ),
            ],
          ),
          const SliverToBoxAdapter(child: SizedBox(height: 12)),
          SliverList(
            delegate:
                SliverChildBuilderDelegate((BuildContext context, int index) {
              // to call MyListItem widget //
              return _MyListItem(index);
            },
                    // to specify count the list show //
    childCount: 26),
          ),
        ],
      ),
    );
  }
}

// UI of MyListItem widget //
class _MyListItem extends StatelessWidget {
  final int index;

  const _MyListItem(this.index, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var item = context.select<LearnPageModel, Item>(
      // Here, we are only interested in the item at [index]. We don't favorite page
      // about any other change.
      (favoritelist) => favoritelist.getByPosition(index),
    );
    var textTheme = Theme.of(context).textTheme.headline6;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
      child: LimitedBox(
        maxHeight: 295,
        child: Row(
          children: [
            AspectRatio(
              aspectRatio: 1,
              child: Image.asset(item.image),
            ),
            const SizedBox(width: 5),
            // to call AddButton widget //
            _AddButton(item: item),
          ],
        ),
      ),
    );
  }
}

// UI of AddButton widget //
class _AddButton extends StatelessWidget {
  final Item item;

  const _AddButton({required this.item, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // The context.select() method will let you listen to changes to
    // a *part* of a model. You define a function that "selects" (i.e. returns)
    // the part you're interested in, and the provider package will not rebuild
    // this widget unless that particular part of the model changes.
    //
    // This can lead to significant performance improvements.
    var isInFavoritePage = context.select<RememberPageModel, bool>(
      // Here, we are only interested whether [item] is inside the favorite page.
      (favoritepage) => favoritepage.items.contains(item),
    );

    return IconButton(
      icon: isInFavoritePage
          ? Icon(Icons.favorite, color: Colors.black)
          : Icon(Icons.favorite_border),
      onPressed: isInFavoritePage
          ? () {
              // To make the user removes the favorite item not only from the favorite page but also from the favorite list
              // We are using context.read() here because the callback
              // is executed whenever the user taps the button. In other
              // words, it is executed outside the build method.
              var favoritepage = context.read<RememberPageModel>();
              favoritepage.remove(item);
            }
          : () {
              // If the item is not in favorite page, we let the user add it.
              // We are using context.read() here because the callback
              // is executed whenever the user taps the button. In other
              // words, it is executed outside the build method.
              var favoritepage = context.read<RememberPageModel>();
              favoritepage.add(item);
            },
    );
  }
}
