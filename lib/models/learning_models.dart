/// A proxy of the favorite list of items the user can buy.
///
/// In a real app, this might be backed by a backend and cached on device.
/// In this sample app, the favorite list is procedurally generated and infinite.
///
/// For simplicity, the favorite list is expected to be immutable (no Lists are
/// expected to be added, removed or changed during the execution of the app).
class LearnPageModel {
  // change the list title from here in order with image path and subtitle //
  static List<String> itemNames = [
    'A',
    'B',
    'C',
    'D',
    'E',
    'F',
    'G',
    'H',
    'I',
    'J',
    'K',
    'L',
    'M',
    'N',
    'O',
    'P',
    'Q',
    'R',
    'S',
    'T',
    'U',
    'V',
    'W',
    'X',
    'Y',
    'Z',
  ];

  // change or add the image path from here in order with name and subtitle //
  static List<String> itemImages = [
    ("assets/alphabet/a.png"),
    ("assets/alphabet/b.png"),
    ("assets/alphabet/c.png"),
    ("assets/alphabet/d.png"),
    ("assets/alphabet/e.png"),
    ("assets/alphabet/f.png"),
    ("assets/alphabet/g.png"),
    ("assets/alphabet/h.png"),
    ("assets/alphabet/i.png"),
    ("assets/alphabet/j.png"),
    ("assets/alphabet/k.png"),
    ("assets/alphabet/L.png"),
    ("assets/alphabet/m.png"),
    ("assets/alphabet/n.png"),
    ("assets/alphabet/o.png"),
    ("assets/alphabet/p.png"),
    ("assets/alphabet/q.png"),
    ("assets/alphabet/r.png"),
    ("assets/alphabet/s.png"),
    ("assets/alphabet/t.png"),
    ("assets/alphabet/u.png"),
    ("assets/alphabet/v.png"),
    ("assets/alphabet/w.png"),
    ("assets/alphabet/x.png"),
    ("assets/alphabet/y.png"),
    ("assets/alphabet/z.png"),
  ];

  /// Get item by [id].
  ///
  /// In this sample, the catalog is infinite, looping over [itemNames].
  Item getById(int id) => Item(
        id,
        //itemNames[id % itemNames.length],
        itemImages[id % itemImages.length],
      );

  /// Get item by its position in the List.
  Item getByPosition(int position) {
    // In this simplified case, an item's position in the List
    // is also its id.
    return getById(position);
  }
}

class Item {
  final int id;
  //final String name;
  final String image;

  const Item(
    this.id,
    //this.name,
    this.image,
  );

  // To make the sample app look nicer, each item is given id ,name and icon.

  @override
  int get hashCode => id;

  @override
  bool operator ==(Object other) => other is Item && other.id == id;
}
