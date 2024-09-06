import 'dart:convert';
import 'package:ecommerce/classes/Item.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class ItemsService {
  Future<List<Item>> getItems() async {
    try {
      final response = await http.get(Uri.parse("https://dummyjson.com/products"));

      if (response.statusCode == 200) {
        Map<String, dynamic> jsonData = json.decode(response.body);
        List<dynamic> products = jsonData["products"];
        List<Item> itemsList = [];

        for (var product in products) {

          if (product["title"] == null ||
              product["description"] == null ||
              product["price"] == null ||
              product["stock"] == null ||
              product["images"] == null ||
              product["category"] == null) continue;

          itemsList.add(Item(
            title: product["title"],
            description: product["description"],
            price: product["price"],
            q: product["stock"],
            path: product["images"][0],
            category: Category(type: product["category"], color: Colors.grey),
          ));
        }

        return itemsList;
      } else {
        print("Failed to load products: ${response.statusCode}");
        return [];
      }
    } catch (e) {
      print("Error fetching items: $e");
      return [];
    }
  }
}