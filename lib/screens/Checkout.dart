import 'package:ecommerce/classes/CreditCard.dart';
import 'package:ecommerce/customs/appBar.dart';
import 'package:ecommerce/customs/bottomNavigator.dart';
import 'package:ecommerce/customs/drawer.dart';
import 'package:flutter/material.dart';

import 'PayDialog.dart';
import 'PaymentSheet.dart';

class Checkout extends StatefulWidget {
  const Checkout({super.key});

  @override
  State<Checkout> createState() => _CheckoutState();
}

class _CheckoutState extends State<Checkout> {
  List<CreditCard> cards = [
    CreditCard(name: "taki", code: '123456812345678', type: "visa"),
    CreditCard(name: "takii", code: '123456812345678', type: "Amex"),
  ];

  List<List<Color>> gradientList = [
    [Colors.blue, Colors.purple],
    [Colors.orange, Colors.red],
    [Colors.yellow, Colors.green],
    [Colors.red, Colors.purple],
    [Colors.yellow, Colors.blue],
  ];
  Color c = Colors.white;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: getAppBar(),
      drawer: getDrawer(),
      bottomNavigationBar: getBottomNavigator(context),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            //mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                  height: MediaQuery.of(context).size.width * 0.6,
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
                                  width: MediaQuery.of(context).size.width * 0.2,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(20.0),
                                      gradient: LinearGradient(
                                          colors: [Colors.grey, Colors.white])),
                                  child: Icon(Icons.add, size: 40, color: c,)),
                            ),
                          );
                        }
                        CreditCard card = cards[index];
                        return GestureDetector(
                          onTap: () {},
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                              width: MediaQuery.of(context).size.width * 0.55,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20.0),
                                  gradient: LinearGradient(
                                      colors: gradientList[index])),
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                    vertical: 8.0, horizontal: 15.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Align(
                                      child: IconButton(
                                          onPressed: () {},
                                          icon: Icon(
                                            Icons.delete,
                                            color: c,
                                          )),
                                      alignment: Alignment.topRight,
                                    ),
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
                                    Align(
                                        child: Text(card.type.toUpperCase(),
                                            style: TextStyle(
                                                color: c,
                                                fontSize: 30,
                                                fontWeight: FontWeight.w600)),
                                        alignment: Alignment.bottomRight),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        );
                      })),
              SizedBox(height: 100),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Number of Products", style: TextStyle(fontSize: 15, fontWeight: FontWeight.w600, color: Colors.grey[400]),),
                  Text("5 Products", style: TextStyle(fontSize: 15, fontWeight: FontWeight.w700, color: Colors.red)),
                ],
              ),
              SizedBox(height: 30,),
              Text("Total", style: TextStyle(fontSize: 30, fontWeight: FontWeight.w600),),
              Text("3000.00\$", style: TextStyle(fontSize: 40, fontWeight: FontWeight.w700, color: Colors.red)),
              SizedBox(height:30),
              TextButton(
                  style: ButtonStyle(
                    padding: MaterialStateProperty.all(EdgeInsets.symmetric(vertical: 10, horizontal: 50)),
                      backgroundColor: MaterialStateProperty.all(Colors.red),
                      shape: MaterialStateProperty.all(RoundedRectangleBorder(borderRadius: BorderRadius.circular(20))
                      )
                  ),
                  onPressed: (){
                    showDialog(context: context, builder: (context)=>PayDialog());
                  },
                  child: Text("Pay", style: TextStyle(
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
