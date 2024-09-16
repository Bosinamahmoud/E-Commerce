import 'dart:ui';

class Item {
  String title;
  String description;
  double price;
  late String quantity;
  late int star;
  String path;
  Category category;

  Item(
      {required this.title,
      required this.description,
      required this.price,
      required int q,
      this.star = 3,
      required this.path,
      required this.category}) {
    quantity = "$q left";
  }
}

class Category {
  String type;
  bool isSelected;

  Category({required this.type, required this.isSelected});
}
