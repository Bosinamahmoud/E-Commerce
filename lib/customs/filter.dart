import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../classes/Item.dart';

class Filter extends StatefulWidget {
  const Filter({super.key});

  @override
  State<Filter> createState() => _FilterState();
}

class _FilterState extends State<Filter> {
  List<Category> categories = [
    Category(type: "Fashion", color: Colors.pink),
    Category(type: "Electronics", color: Colors.blue),
    Category(type: "Home Appliances", color: Colors.deepPurple)
  ];
  var rangedValues = RangeValues(0.1, 99999);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Container(
          height: MediaQuery.of(context).size.height * 0.5,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                  child: Text("Filter By",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 15))),
              SizedBox(height: 15),
              Text("Categories",
                  style: TextStyle(
                      color: Colors.grey[400],
                      fontWeight: FontWeight.w600,
                      fontSize: 15)),
              SizedBox(height: 10),
              Container(
                height: 50,
                child: ListView.builder(
                  itemBuilder: (context, int index) {
                    return CategoriesWidget(
                        category: categories[index]);
                  },
                  itemCount: categories.length,
                  scrollDirection: Axis.horizontal,
                ),
              ),
              SizedBox(height: 15),
              Text("Prices",
                  style: TextStyle(
                      color: Colors.grey[400],
                      fontWeight: FontWeight.w600,
                      fontSize: 15)),
              SizedBox(height: 10),
              RangeSlider(
                  values: rangedValues,
                  max: 99999,
                  min: 0,
                  divisions: 5,
                  labels: RangeLabels(
                      rangedValues.start.round().toString(),
                      rangedValues.end.round().toString()),
                  onChanged: (RangeValues values) {
                    setState(() {
                      rangedValues=values;
                    });
                  }
              )
            ],
          )),
    );
  }
}

class CategoriesWidget extends StatefulWidget {
  final Category category;

  const CategoriesWidget({super.key, required this.category});

  @override
  State<CategoriesWidget> createState() => _CategoriesWidgetState();
}

class _CategoriesWidgetState extends State<CategoriesWidget> {
  bool isSelected = false;

  Color textColor = Colors.red;
  Color bgColor = Colors.white70;

  @override
  Widget build(BuildContext context) {
    Category category = widget.category;
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: GestureDetector(
        child: Container(
          padding: EdgeInsets.all(8.0),
          decoration: BoxDecoration(
              color: bgColor,
              borderRadius: BorderRadius.circular(20.0),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  blurRadius: 7,
                )
              ]),
          child: Text(category.type,
              style: TextStyle(color: textColor, fontWeight: FontWeight.w600)),
        ),
        onTap: () {
          setState(() {
            isSelected = !isSelected;
            textColor = isSelected ? Colors.white : Colors.red;
            bgColor = !isSelected ? Colors.white : Colors.red;
          });
        },
      ),
    );
  }
}
