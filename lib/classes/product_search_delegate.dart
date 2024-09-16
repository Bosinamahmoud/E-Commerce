import 'package:ecommerce/classes/Item.dart';
import 'package:flutter/material.dart';

import '../screens/itemDescription.dart';

class productSearchDelegate extends SearchDelegate {
  final items;
  List<Item> filter = [];
  List<Item> pricefilter = [];
  List<Item> catagoryfilter = [];

  productSearchDelegate({required this.items});

  List<Item> Price_Filter(double start, double end) {
    pricefilter = items
        .where((Item element) => element.price <= end && element.price >= start)
        .toList();
    return pricefilter;
  }

  List<Item> Catagory_Filter() {
    catagoryfilter =
        items.where((Item element) => element.category == "beauty").toList();
    return catagoryfilter;
  }

  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
          onPressed: () {
            query = "";
          },
          icon: Icon(Icons.close))
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
        onPressed: () {
          close(context, null);
        },
        icon: Icon(Icons.arrow_back));
  }

  @override
  Widget buildResults(BuildContext context) {
    return Text("");
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    if (query == "") {
      return ListView.builder(
          itemCount: items.length,
          itemBuilder: (context, i) {
            return Card(
                child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: ListTile(
                      title: Text("${items[i].title}"),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  ProductDetailPage(item1: items[i])),
                        );
                      },
                    )));
          });
    } else {
      filter = items
          .where((Item element) =>
              element.title.toLowerCase().contains(query.toLowerCase()))
          .toList();

      return ListView.builder(
          itemCount: filter.length,
          itemBuilder: (context, i) {
            return GestureDetector(
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => ProductDetailPage(item1: items[i])));
              },
              child: Card(
                  child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Text("${filter[i].title}"),
              )),
            );
          });
    }
  }
}
