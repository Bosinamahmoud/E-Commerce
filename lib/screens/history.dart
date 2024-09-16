import 'package:ecommerce/customs/appBar.dart';
import 'package:ecommerce/customs/bottomNavigator.dart';
import 'package:ecommerce/customs/drawer.dart';
import 'package:ecommerce/providers/CartItemsProvider.dart';
import 'package:ecommerce/screens/PayDialog.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../classes/Item.dart';
import 'HistoryProducts.dart';

class history extends StatelessWidget {

  const history({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text("My History",style: TextStyle( fontWeight: FontWeight.bold),),
          centerTitle: true),
      // drawer: getDrawer(),
      bottomNavigationBar: getBottomNavigator(context , 2),
      body:   Column(
        children: [
          // SizedBox(height: 20),
          // Row(
          //   mainAxisAlignment: MainAxisAlignment.spaceAround,
          //   children: [
          //     TextButton(onPressed: () {}, child: Text('Delivered',style: TextStyle(color: Colors.white),),style: TextButton.styleFrom(backgroundColor: Theme.of(context).primaryColor),),
          //     TextButton(onPressed: () {}, child: Text('Processing',)),
          //     TextButton(onPressed: () {}, child: Text('Cancelled'),),
          //   ],
          // ),
          Expanded(
            child: ListView.builder(
              itemCount: PayDialog.historyCarts.length, // Example count
              itemBuilder: (context, index) {
                return OrderCard(historyCart:PayDialog.historyCarts[index]);
              },
            ),
          ),
        ],
      ),
    );
  }
}
class OrderCard extends StatelessWidget {
  CartItemsProvider historyCart;
  OrderCard({super.key, required this.historyCart});


  @override
  Widget build(BuildContext context) {
    String date=historyCart.date;
    final items=historyCart.items;
    String total=historyCart.total.toStringAsFixed(2);

    return Card(
      margin: EdgeInsets.all(10),
      color: Theme.of(context).scaffoldBackgroundColor,
      shadowColor: Colors.grey,
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Order ', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                Text(date, style: TextStyle(color: Colors.grey)),
              ],
            ),
            SizedBox(height: 8),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Quantity: ${items.length}', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.grey)),
                Text('Total Amount: $total\$', style: TextStyle(fontWeight: FontWeight.bold)),
              ],
            ),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>HistoryProducts(items:items)));
                  },
                  child: Text('Details',style: TextStyle(color: Colors.white),),
                  style: ElevatedButton.styleFrom(backgroundColor: Theme.of(context).primaryColor),
                ),
                Text('Delivered', style: TextStyle(color: Colors.green)),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
