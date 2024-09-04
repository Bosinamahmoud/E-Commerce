import 'package:ecommerce/customs/appBar.dart';
import 'package:ecommerce/customs/bottomNavigator.dart';
import 'package:ecommerce/customs/drawer.dart';
import 'package:flutter/material.dart';

class history extends StatelessWidget {
   history({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: getAppBar(),
      drawer: getDrawer(),

      bottomNavigationBar: getBottomNavigator(context , 0),
      body:   Column(
        children: [
          Text(
            "My Orders",
            style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              TextButton(onPressed: () {}, child: Text('Delivered',style: TextStyle(color: Colors.white),),style: TextButton.styleFrom(backgroundColor: Theme.of(context).primaryColor),),
              TextButton(onPressed: () {}, child: Text('Processing',)),
              TextButton(onPressed: () {}, child: Text('Cancelled'),),
            ],
          ),
          Expanded(
            child: ListView.builder(
              itemCount: 2, // Example count
              itemBuilder: (context, index) {
                return OrderCard();
              },
            ),
          ),
        ],
      ),
    );
  }
}
class OrderCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(10),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Order ', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                Text('05-12-2019', style: TextStyle(color: Colors.grey)),
              ],
            ),
            SizedBox(height: 8),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Quantity: 3'),
                Text('Total Amount: 112\$', style: TextStyle(fontWeight: FontWeight.bold)),
              ],
            ),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ElevatedButton(
                  onPressed: () {},
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
