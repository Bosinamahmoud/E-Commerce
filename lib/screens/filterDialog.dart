import 'package:flutter/material.dart';

class FilterDialog extends StatefulWidget {
  final double minPrice;
  final double maxPrice;
  final String category;
  final Function(double, double, String) onApply;

  FilterDialog({
    required this.minPrice,
    required this.maxPrice,
    required this.category,
    required this.onApply,
  });

  @override
  _FilterDialogState createState() => _FilterDialogState();
}

class _FilterDialogState extends State<FilterDialog> {
  late double _minPrice;
  late double _maxPrice;
  String _category = '';

  @override
  void initState() {
    super.initState();
    _minPrice = widget.minPrice;
    _maxPrice = widget.maxPrice;
    _category = widget.category;
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('Filter'),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text('Price Range'),
          RangeSlider(
            values: RangeValues(_minPrice, _maxPrice),
            min: 0,
            max: 1000,
            divisions: 10,
            labels: RangeLabels(
              _minPrice.toString(),
              _maxPrice.toString(),
            ),
            onChanged: (values) {
              setState(() {
                _minPrice = values.start;
                _maxPrice = values.end;
              });
            },
          ),
          Text('Category'),
          DropdownButton<String>(
            value: _category.isEmpty ? null : _category,
            hint: Text('Select Category'),
            items: ['Beauty', 'Electronics', 'Fashion', 'Home'].map((String category) {
              return DropdownMenuItem<String>(
                value: category,
                child: Text(category),
              );
            }).toList(),
            onChanged: (value) {
              setState(() {
                _category = value ?? '';
              });
            },
          ),
        ],
      ),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: Text('Cancel'),
        ),
        TextButton(
          onPressed: () {
            widget.onApply(_minPrice, _maxPrice, _category);
            Navigator.pop(context);
          },
          child: Text('Apply'),
        ),
      ],
    );
  }
}
