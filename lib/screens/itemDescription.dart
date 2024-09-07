import 'package:flutter/material.dart';
import '../classes/Item.dart';

class ProductDetailPage extends StatelessWidget {
  final item1;

  ProductDetailPage({super.key, required this.item1});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(""),
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Stack(
            children: [
              SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: Column(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Image.network(
                          item1.path,
                          height: 500,
                        ),
                        SizedBox(height: 16),
                        Text(
                          item1.title,
                          style: TextStyle(
                              fontSize: 24, fontWeight: FontWeight.bold),
                        ),
                        SizedBox(height: 8),
                        Text(item1.category.type),
                        SizedBox(height: 8),
                        Text(item1.description),
                        SizedBox(height: 8),
                        Text(
                          "\$${item1.price}",
                          style: TextStyle(
                              fontSize: 24, fontWeight: FontWeight.bold),
                        ),
                        SizedBox(height: 8),
                        Text("Quantity: ${item1.quantity}"),
                        SizedBox(height: 100),
                      ],
                    ),
                  ],
                ),
              ),
              Positioned(
                  bottom: 16,
                  left: 16,
                  right: 16,
                  child: ElevatedButton(
                    onPressed: () {
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.red,
                      minimumSize: Size(double.infinity, 50),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    child: Text(
                      'ADD TO CART',
                      style: TextStyle(
                        fontSize: 18, // حجم الخط
                        fontWeight: FontWeight.bold, // سمك الخط
                        color: Colors.white, // لون النص
                      ),
                    ),
                  )),
            ],
          ),
        ));
  }
}
