import 'package:ecommerce/classes/CreditCard.dart';
import 'package:ecommerce/customs/bottomNavigator.dart';
import 'package:ecommerce/customs/drawer.dart';
import 'package:ecommerce/providers/CreditProvider.dart';
import 'package:ecommerce/providers/TotalProvider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../classes/Item.dart';
import 'PayDialog.dart';
import 'PaymentSheet.dart';

class Checkout extends StatelessWidget {
  final List<Item> items;

  Checkout({super.key, required this.items});

  List<List<Color>> gradientList = [
    [Colors.blue, Colors.purple],
    [Colors.orange, Colors.red],
    [Colors.yellow, Colors.green],
    [Colors.red, Colors.purple],
    [Colors.yellow, Colors.blue],
  ];

  Color c = Colors.white;

  CreditCard? selectedCard;

  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width * 0.55;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Checkout",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        leading: Builder(builder: (context) {
          return IconButton(
              onPressed: () {
                Scaffold.of(context).openDrawer();
              },
              icon: Icon(Icons.menu, color: Theme.of(context).primaryColor));
        }),
      ),
      drawer: getDrawer(),
      bottomNavigationBar: getBottomNavigator(context),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            //mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Consumer<CreditProvider>(
                  builder: (context, creditProvider, child) {
                List<CreditCard> cards = creditProvider.creditCards;
                return Container(
                    height: MediaQuery.of(context).size.width * 0.55,
                    child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: cards.length + 1,
                        itemBuilder: (context, index) {
                          if (index == cards.length) {
                            return GestureDetector(
                              onTap: () {
                                Scaffold.of(context).showBottomSheet((context) {
                                  return PaymentSheet();
                                });
                              },
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Container(
                                    width:
                                        MediaQuery.of(context).size.width * 0.2,
                                    decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(20.0),
                                        gradient: LinearGradient(colors: [
                                          Colors.grey,
                                          Colors.white
                                        ])),
                                    child: Icon(
                                      Icons.add,
                                      size: 40,
                                      color: c,
                                    )),
                              ),
                            );
                          }
                          CreditCard card = cards[index];
                          bool isSelected =
                              (creditProvider.selectedCard == card);
                          return GestureDetector(
                            onTap: () {
                              creditProvider.updteSelectedCard(card);
                            },
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Container(
                                //width: w,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20.0),
                                  gradient: LinearGradient(
                                      colors: gradientList[
                                          index % gradientList.length]),
                                  boxShadow: isSelected
                                      ? [
                                          BoxShadow(
                                            color: Colors.red.withOpacity(0.7),
                                            blurRadius: 10,
                                          )
                                        ] // Add shadow if selected
                                      : [
                                          BoxShadow(
                                              color:
                                                  Colors.grey.withOpacity(0.5),
                                              blurRadius: 8)
                                        ],
                                  border: isSelected
                                      ? Border.all(
                                          color: Colors.red,
                                          width:
                                              1.5) // Border for selected card
                                      : Border.all(
                                          color: Colors
                                              .transparent), // No border for unselected
                                ),

                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      vertical: 8.0, horizontal: 15.0),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Text(card.name,
                                          style: TextStyle(
                                              color: c,
                                              fontSize: 25,
                                              fontWeight: FontWeight.w600)),
                                      Text(card.obscureText(card.code),
                                          style: TextStyle(
                                              color: c,
                                              fontSize: 15,
                                              fontWeight: FontWeight.w600)),
                                      SizedBox(height: 10),
                                      Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceAround,
                                          children: [
                                            Text(card.type.toUpperCase(),
                                                style: TextStyle(
                                                    color: c,
                                                    fontSize: 25,
                                                    fontWeight:
                                                        FontWeight.w600)),
                                            SizedBox(width: 15),
                                            IconButton(
                                                onPressed: () {
                                                  creditProvider
                                                      .removeCard(card);
                                                },
                                                icon: Icon(
                                                  Icons.delete,
                                                  color: c,
                                                ))
                                          ]),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          );
                        }));
              }),
              SizedBox(height: 80),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Number of Products",
                      style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w600,
                          color: Colors.grey[400]),
                    ),
                    Text("${items.length}",
                        style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w700,
                            color: Colors.red)),
                  ],
                ),
              ),
              SizedBox(
                height: 30,
              ),
              Text(
                "Total",
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.w600),
              ),
              Text(
                  "${Provider.of<TotalProvider>(context).total.toStringAsFixed(2)}\$",
                  style: TextStyle(
                      fontSize: 40,
                      fontWeight: FontWeight.w700,
                      color: Colors.red)),
              SizedBox(height: 30),
              TextButton(
                  style: ButtonStyle(
                      padding: MaterialStateProperty.all(
                          EdgeInsets.symmetric(vertical: 10, horizontal: 50)),
                      backgroundColor: MaterialStateProperty.all(
                          items.length != 0 || items.isNotEmpty
                              ? Colors.red
                              : Colors.grey[400]),
                      shape: MaterialStateProperty.all(RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20)))),
                  onPressed: () {
                    if (items.length != 0 || items.isNotEmpty)
                      showDialog(
                          context: context,
                          builder: (context) => PayDialog(items: items));
                  },
                  child: Text("Pay",
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w600,
                          fontSize: 30))),
            ],
          ),
        ),
      ),
    );
  }
}
