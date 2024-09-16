import 'package:ecommerce/screens/showfilter.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../classes/Item.dart';
import '../providers/CategoryProvider.dart';

class Filter extends StatefulWidget {
  final items;

  Filter({super.key, required this.items});

  @override
  State<Filter> createState() => _FilterState();
}

class _FilterState extends State<Filter> {
  TextEditingController searchController = TextEditingController();

  var rangedValues = RangeValues(1, 3000);
  bool isPriceChecked = false;
  bool selectedPriceRadio = true;

  bool isPopularChecked = false;
  bool selectedPopularRadio = true;

  List<String> categories = [];
  List<String> filteredCategories = [];

  @override
  void initState() {
    super.initState();

    for (Item item in widget.items) {
      String category = item.category.type;
      if (!categories.contains(category)) {
        categories.add(category);
      }
    }
    print(categories);
    filteredCategories = categories;
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20.0),
          color: Theme.of(context).scaffoldBackgroundColor,
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              blurRadius: 20,
            )
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Consumer<CategoryProvider>(
              builder: (context, categoryProvider, child) {
            return Container(
              //height: MediaQuery.of(context).size.height * 0.7,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                      child: Text("Filter By",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 15))),
                  SizedBox(height: 15),
                  Text("Categories",
                      style: TextStyle(
                          color: Colors.grey[400],
                          fontWeight: FontWeight.w600,
                          fontSize: 15)),
                  SizedBox(height: 10),
                  TextField(
                    controller: searchController,
                    decoration: InputDecoration(
                        hintText: "Search...",
                        hintStyle: TextStyle(
                          color: Colors.grey[500],
                          fontWeight: FontWeight.w600,
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20.0),
                          borderSide: BorderSide(color: Colors.red),
                        )),
                    onChanged: (value) {
                      setState(() {
                        filteredCategories = categories
                            .where((category) => category
                                .toLowerCase()
                                .contains(value.toLowerCase()))
                            .toList();
                      });
                    },
                  ),
                  SizedBox(height: 10),
                  Container(
                    height: 50,
                    child: ListView.builder(
                      itemBuilder: (context, int index) {
                        return CategoriesWidget(
                            category: filteredCategories[index]);
                      },
                      itemCount: filteredCategories.length,
                      scrollDirection: Axis.horizontal,
                    ),
                  ),
                  SizedBox(height: 12),
                  Text("Prices",
                      style: TextStyle(
                          color: Colors.grey[400],
                          fontWeight: FontWeight.w600,
                          fontSize: 15)),
                  SizedBox(height: 10),
                  RangeSlider(
                      values: rangedValues,
                      max: 3000,
                      min: 1,
                      divisions: 10000,
                      activeColor: Theme.of(context).primaryColor,
                      inactiveColor: Colors.grey[400],
                      labels: RangeLabels(rangedValues.start.round().toString(),
                          rangedValues.end.round().toString()),
                      onChanged: (RangeValues values) {
                        setState(() {
                          rangedValues = values;
                        });
                      }),
                  SizedBox(height: 12),
                  CheckboxListTile(
                      title: Text("Sort Price",
                          style: TextStyle(
                              color: Colors.grey[400],
                              fontWeight: FontWeight.w600,
                              fontSize: 15)),
                      value: isPriceChecked,
                      activeColor: Theme.of(context).primaryColor,
                      onChanged: (value) {
                        setState(() {
                          isPriceChecked = value!;
                        });
                      }),
                  if (isPriceChecked) ...[
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 3.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: RadioListTile<bool>(
                                title: Text("ascending",
                                    style: TextStyle(
                                        color: Colors.grey[400],
                                        fontWeight: FontWeight.w600,
                                        fontSize: 12)),
                                activeColor: Theme.of(context).primaryColor,
                                value: true,
                                groupValue: selectedPriceRadio,
                                onChanged: (value) {
                                  setState(() {
                                    selectedPriceRadio = value!;
                                  });
                                }),
                          ),
                          Expanded(
                            child: RadioListTile<bool>(
                                title: Text("descending",
                                    style: TextStyle(
                                        color: Colors.grey[400],
                                        fontWeight: FontWeight.w600,
                                        fontSize: 12)),
                                activeColor: Theme.of(context).primaryColor,
                                value: false,
                                groupValue: selectedPriceRadio,
                                onChanged: (value) {
                                  setState(() {
                                    selectedPriceRadio = value!;
                                  });
                                }),
                          ),
                        ],
                      ),
                    )
                  ],
                  //SizedBox(height: 15),
                  CheckboxListTile(
                      title: Text("Sort Popularity",
                          style: TextStyle(
                              color: Colors.grey[400],
                              fontWeight: FontWeight.w600,
                              fontSize: 15)),
                      value: isPopularChecked,
                      activeColor: Theme.of(context).primaryColor,
                      onChanged: (value) {
                        setState(() {
                          isPopularChecked = value!;
                        });
                      }),
                  if (isPopularChecked) ...[
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 3.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: RadioListTile<bool>(
                                title: Text("ascending",
                                    style: TextStyle(
                                        color: Colors.grey[400],
                                        fontWeight: FontWeight.w600,
                                        fontSize: 12)),
                                activeColor: Theme.of(context).primaryColor,
                                value: true,
                                groupValue: selectedPopularRadio,
                                onChanged: (value) {
                                  setState(() {
                                    selectedPopularRadio = value!;
                                  });
                                }),
                          ),
                          Expanded(
                            child: RadioListTile<bool>(
                                title: Text("descending",
                                    style: TextStyle(
                                        color: Colors.grey[400],
                                        fontWeight: FontWeight.w600,
                                        fontSize: 12)),
                                activeColor: Theme.of(context).primaryColor,
                                value: false,
                                groupValue: selectedPopularRadio,
                                onChanged: (value) {
                                  setState(() {
                                    selectedPopularRadio = value!;
                                  });
                                }),
                          ),
                        ],
                      ),
                    )
                  ],
                  SizedBox(height: 15),
                  Center(
                    child: TextButton(
                        style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all(
                                Theme.of(context).primaryColor),
                            shape: MaterialStateProperty.all(
                                RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20)))),
                        onPressed: () {
                          List<String> selectedCategories =
                              categoryProvider.selectedCategories;
                          if (selectedCategories.isEmpty)
                            selectedCategories = filteredCategories;
                          List<Item> filteredItems = widget.items
                              .where((Item element) =>
                                  element.price <= rangedValues.end &&
                                  element.price >= rangedValues.start &&
                                  selectedCategories
                                      .contains(element.category.type))
                              .toList();
                          // Apply price sorting if checked
                          if (isPriceChecked) {
                            filteredItems.sort((a, b) {
                              return selectedPriceRadio
                                  ? a.price.compareTo(b.price) // Ascending
                                  : b.price.compareTo(a.price); // Descending
                            });
                          }

                          // Apply popularity sorting if checked
                          if (isPopularChecked) {
                            filteredItems.sort((a, b) {
                              return selectedPopularRadio
                                  ? a.star.compareTo(b.star) // Ascending
                                  : b.star.compareTo(a.star); // Descending
                            });
                          }

                          Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) =>
                                ShowFilter(items: filteredItems),
                          ));
                        },
                        child: Text("Apply Filter",
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w600,
                                fontSize: 15))),
                  )
                ],
              ),
            );
          }),
        ),
      ),
    );
  }
}

class CategoriesWidget extends StatefulWidget {
  final String category;

  const CategoriesWidget({super.key, required this.category});

  @override
  State<CategoriesWidget> createState() => _CategoriesWidgetState();
}

class _CategoriesWidgetState extends State<CategoriesWidget> {
  @override
  Widget build(BuildContext context) {
    String category = widget.category;
    List<String> selectedCategories =
        Provider.of<CategoryProvider>(context, listen: false)
            .selectedCategories;

    Color textColor = selectedCategories.contains(category)
        ? Colors.white
        : Theme.of(context).primaryColor;
    Color bgColor = !selectedCategories.contains(category)
        ? Colors.white
        : Theme.of(context).primaryColor;

    return Consumer<CategoryProvider>(
        builder: (context, categoryProvider, child) {
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
            child: Text(category,
                style:
                    TextStyle(color: textColor, fontWeight: FontWeight.w600)),
          ),
          onTap: () {
            setState(() {
              if (!selectedCategories.contains(category))
                categoryProvider.selectedCategories.add(category);
              else
                categoryProvider.selectedCategories.remove(category);
              textColor = categoryProvider.selectedCategories.contains(category)
                  ? Colors.white
                  : Theme.of(context).primaryColor;
              bgColor = !categoryProvider.selectedCategories.contains(category)
                  ? Colors.white
                  : Theme.of(context).primaryColor;
            });
          },
        ),
      );
    });
  }
}
