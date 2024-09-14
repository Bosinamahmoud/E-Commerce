import 'package:ecommerce/classes/Item.dart';
import 'package:ecommerce/screens/itemDescription.dart';
import 'package:flutter/material.dart';

class ShowFilter extends StatelessWidget {
  final  items;

  ShowFilter({super.key, required this.items});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Filtered Items"),),
      body: Column(
        children: [
          Expanded(
            child: GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 0.502,
                crossAxisSpacing: 12.0,
                mainAxisSpacing: 15.0,
              ),
              itemCount: items.length,
              itemBuilder: (context, index) {
                return ItemsGrid(item: items[index]);
              },
            ),
          ),
        ],
      ),
    );
  }
}

class ItemsGrid extends StatelessWidget {
  final Item item;

  const ItemsGrid({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;

    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => ProductDetailPage(
              item1: item,
            )));
      },
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20.0),
          color: Theme.of(context).scaffoldBackgroundColor,
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              blurRadius: 5,
            )
          ],
        ),
        child: Column(
          children: [
            Stack(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(20),
                    topLeft: Radius.circular(20),
                    bottomLeft: Radius.circular(8),
                    bottomRight: Radius.circular(8),
                  ),
                  child: Image.network(
                    "${item.path}",
                    width: 200,
                    height: h * 0.23,
                    fit: BoxFit.fill,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 122, top: 155),
                  child: CircleAvatar(
                    backgroundColor: Theme.of(context).primaryColor,
                    child: IconButton(
                      onPressed: () {}, // No need for setState
                      icon: Icon(
                        Icons.shopping_cart_outlined,
                        color: Colors.white,
                      ),
                    ),
                  ),
                )
              ],
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: List.generate(5, (index) {
                      return Icon(
                        (index < item.star) ? Icons.star : Icons.star_border,
                        color: Colors.yellow[600],
                        size: 18,
                      );
                    }),
                  ),
                  Text(
                    item.title,
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                  ),
                  Text(
                    item.category.type,
                    style: TextStyle(color: Colors.grey[400]),
                  ),
                  SizedBox(height: 3),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("${item.price}\$",
                            style: TextStyle(fontWeight: FontWeight.bold)),
                        Text(
                          "${item.quantity}",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Theme.of(context).primaryColor),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),

    );
  }
}
