import 'dart:ui';

class Item{
  String title;
  String description;
  double price;
  late String quantity;
  String path;
  Category category;

  Item(
      {required this.title,
        required this.description,
        required this.price,
        required int q,
        required this.path,
        required this.category}){
        quantity="$q left";
  }
}

class Category{
  String type;
  Color color;

  Category({required this.type, required this.color});
}

