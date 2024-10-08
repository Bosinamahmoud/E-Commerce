import 'package:ecommerce/providers/cartProvider.dart';
import 'package:ecommerce/screens/itemDescription.dart';
import 'package:ecommerce/service/items_service.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../classes/Item.dart';
import '../customs/appBar.dart';
import '../customs/bottomNavigator.dart';
import '../customs/drawer.dart';

class Home extends StatelessWidget {
  List<Item> items = [];

  Future<List<Item>> getData() async {
    return (await ItemsService().getItems()).cast<Item>();
  }

  Color c = Colors.red;

  List<String> trendingPath = [
    "assets/trendin1.jpg",
    "assets/trendin2.jpg",
    "assets/trendin3.jpg",
    "assets/trendin4.jpg",
  ];

  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;
    return Scaffold(
      bottomNavigationBar: getBottomNavigator(context, 0),
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "TRENDING",
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.w600),
              ),
              SizedBox(height: 10),
              Container(
                height: h * 0.23,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: trendingPath.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.only(right: 10.0),
                      child: Container(
                        width: 270,
                        child: GestureDetector(
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(20),
                            child: Image.asset(
                              trendingPath[index],
                              width: 270,
                              height: h * 0.23,
                              fit: BoxFit.fill,
                            ),
                          ),
                          onTap: () {},
                        ),
                      ),
                    );
                  },
                ),
              ),
              SizedBox(height: 30),
              Text(
                "PRODUCTS",
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.w600),
              ),
              SizedBox(height: 10),
              FutureBuilder<List<Item>>(
                  future: getData(),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return Center(child: CircularProgressIndicator());
                    } else if (snapshot.hasError) {
                      return Center(child: Text('Error loading items'));
                    } else if (snapshot.hasData) {
                      items = snapshot.data!;
                      return GridView.builder(
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            childAspectRatio: 0.502,
                            crossAxisSpacing: 12.0,
                            mainAxisSpacing: 15.0,
                          ),
                          shrinkWrap: true,
                          physics: NeverScrollableScrollPhysics(),
                          itemCount: items.length,
                          itemBuilder: (context, index) {
                            return ItemsGrid(item: items[index]);
                          });
                    } else {
                      return Center(child: Text('No items available'));
                    }
                  }),
            ],
          ),
        ),
      ),
      appBar: getAppBar(title: "Shoppe", items: items),
      drawer: getDrawer(),
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
                    child: Consumer<Cartprovider>(
                        builder: (context, cartProvider, child) {
                      return IconButton(
                        onPressed: () {
                          if (!cartProvider.names.contains(item.title))
                            cartProvider.addItem(context, item);
                          else
                            cartProvider.removeItem(context, item);
                        }, // No need for setState
                        icon: Icon(
                          cartProvider.names.contains(item.title)
                              ? Icons.shopping_cart
                              : Icons.shopping_cart_outlined,
                          color: Colors.white,
                        ),
                      );
                    }),
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
