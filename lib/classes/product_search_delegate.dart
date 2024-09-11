import 'package:ecommerce/classes/Item.dart';
import 'package:flutter/material.dart';

import '../screens/itemDescription.dart';

class productSearchDelegate extends SearchDelegate {
  final items;
  List<Item>  filter=[];
  productSearchDelegate({required this.items});

  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(onPressed: () {
        query = "";
      }, icon: Icon(Icons.close))
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return
      IconButton(onPressed: () {
        close(context, null);
      }, icon: Icon(Icons.arrow_back
      ))
    ;
  }

  @override
  Widget buildResults(BuildContext context) {
    return Text("");
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    if(query=="") {
    return ListView.builder(itemCount: items.length, itemBuilder: (context, i) {

        return Card(

            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Text("${items[i].title}"),
            ));


    });
    }
    else{ filter=items.where((Item element)=>element.title.toLowerCase().contains(query.toLowerCase())).toList();

    return ListView.builder(itemCount: filter.length, itemBuilder: (context, i) {
      return GestureDetector(
        onTap: (){
          Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => ProductDetailPage(item1: items[i])));
        },
        child: Card(
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Text("${filter[i].title}"),
            )
        ),
      );


    });}
  }

}