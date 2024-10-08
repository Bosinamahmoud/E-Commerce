import 'package:ecommerce/classes/Item.dart';
import 'package:ecommerce/customs/appBar.dart';
import 'package:ecommerce/customs/bottomNavigator.dart';
import 'package:ecommerce/customs/drawer.dart';
import 'package:ecommerce/providers/CartItemsProvider.dart';
import 'package:ecommerce/providers/DeleteProvider.dart';
import 'package:ecommerce/providers/cartProvider.dart';
import 'package:ecommerce/providers/counter_provider.dart';
import 'package:ecommerce/screens/Checkout.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../classes/Item.dart';
import '../providers/TotalProvider.dart';
import 'itemDescription.dart';

class Cart extends StatelessWidget {
  static double total = 0;

  Cart({super.key});

  @override
  Widget build(BuildContext context) {
    final list_items =
        Provider.of<Cartprovider>(context, listen: false).items;
    return Scaffold(
        appBar: AppBar(
          title: Text(
            "My Cart",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          centerTitle: true,
        ),
        // drawer: getDrawer(),
        // bottomNavigationBar: getBottomNavigator(context, 1),
        body: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Stack(children: [
              Consumer<DeleteProvider>(builder: (context, deleteItem, child) {
                return ListView.builder(
                  itemCount: list_items.length + 1,
                  itemBuilder: (context, index) {
                    if (index == list_items.length) {
                      return SizedBox(height: 100);
                    }
                    final item = list_items[index];
                    return CartItems(item: item);
                  },
                );
              }),
              Positioned(
                bottom: 0,
                left: 0,
                right: 0,
                child: Padding(
                    padding: const EdgeInsets.all(20),
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20.0),
                        color: Theme.of(context).scaffoldBackgroundColor,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.5),
                            blurRadius: 10,
                          )
                        ],
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 30.0, vertical: 10),
                        child: Column(
                          children: [
                            Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "Total:",
                                    style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.w600),
                                  ),
                                  Consumer<TotalProvider>(
                                      builder: (context, totalProvider, child) {
                                    return Text(
                                        "${totalProvider.total.toStringAsFixed(2)}\$",
                                        style: TextStyle(
                                            fontSize: 20,
                                            fontWeight: FontWeight.w700,
                                            color: Colors.red));
                                  }),
                                ]),
                            ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                  backgroundColor:
                                      Theme.of(context).primaryColor,
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10))),
                              onPressed: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            Checkout(items: list_items)));
                              },
                              child: Text(
                                "CHECKOUT",
                                style: TextStyle(
                                    fontSize: 20, color: Colors.white),
                              ),
                            ),
                          ],
                        ),
                      ),
                    )),
              ),
            ])));
  }
}

class CartItems extends StatefulWidget {
  final  item;

  CartItems({super.key, required this.item});

  @override
  State<CartItems> createState() => _CartItemsState();
}

class _CartItemsState extends State<CartItems> {
  @override
  Widget build(BuildContext context) {
    final counterProvider = Provider.of<CounterProvider>(context);
    final item = widget.item;
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15.0),
          color: Theme.of(context).scaffoldBackgroundColor,
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              blurRadius: 5,
            )
          ],
        ),
        child: GestureDetector(
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => ProductDetailPage(
                        item1: item,
                      )));
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Image.network(
                  item.path,
                  width: w / 4,
                  height: w / 4,
                ),
                /*    Padding(
                    padding: const EdgeInsets.all(10.0),child: ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: Image.asset(
                        item.path,
                        width: w*0.3,
                        height: h*0.15,
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),*/
                Container(
                  width: 2 * w / 4,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        item.title,
                        style: TextStyle(
                          fontWeight: FontWeight.w800,
                          fontSize: 15,
                        ),
                        softWrap: true,
                      ),
                      Row(
                        children: [
                          Text("${item.price}\$",
                              style: TextStyle(fontWeight: FontWeight.w600)),
                          SizedBox(width: 40),
                          Text(
                            "${item.quantity}",
                            style: TextStyle(
                                fontWeight: FontWeight.w600,
                                color: Theme.of(context).primaryColor),
                          )
                        ],
                      ),
                      SizedBox(height: 10),
                      Row(
                        children: [
                          CircleAvatar(
                            radius: 16,
                            backgroundColor: Colors.grey[400],
                            child: IconButton(
                              onPressed: () {
                                bool response = counterProvider
                                    .decrementCounter(item: item);
                                if (response)
                                  Provider.of<TotalProvider>(context,
                                          listen: false)
                                      .removeTotal(price: item.price);
                              },
                              icon: Icon(
                                Icons.remove,
                                color: Colors.white,
                                size: 15,
                              ),
                            ),
                          ),
                          Consumer<CounterProvider>(
                            builder: (key, CounterProvider, _) {
                              return Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 20.0),
                                child: Text(
                                    CounterProvider.getCounter(item).toString(),
                                    style: TextStyle(
                                        fontWeight: FontWeight.w600,
                                        fontSize: 20)),
                              );
                            },
                          ),
                          CircleAvatar(
                            radius: 16,
                            backgroundColor: Colors.grey[400],
                            child: IconButton(
                              onPressed: () {
                                bool response = counterProvider
                                    .increamentCounter(item: item);
                                if (response)
                                  Provider.of<TotalProvider>(context,
                                          listen: false)
                                      .addTotal(price: item.price);
                              },
                              icon: Icon(
                                Icons.add,
                                color: Colors.white,
                                size: 15,
                              ),
                            ),
                          ),
                          IconButton(
                              onPressed: () {
                                Provider.of<DeleteProvider>(context,
                                        listen: false)
                                    .deleteItem(context: context, item: item);
                              },
                              icon: Icon(
                                Icons.delete,
                                color: Theme.of(context).primaryColor,
                              ))
                        ],
                      )
                    ],
                  ),
                ),
              ],
            )),
      ),
    );
  }
}
