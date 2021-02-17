import 'package:flutter/material.dart';
import 'package:news_feed/data/category_info.dart';

class CategoryChips extends StatefulWidget {
  final ValueChanged onCategorySelected;
  CategoryChips({this.onCategorySelected});

  @override
  _CategoryChipsState createState() => _CategoryChipsState();
}

class _CategoryChipsState extends State<CategoryChips> {
  var value = 0;
  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 4,
      children: List<Widget>.generate(categories.length, (int index) {
        return ChoiceChip(
          label: Text(categories[index].nameJp),
          selected:  value == index,
          // onSelectedのカリ引数にはselectedの値が入る
          onSelected: (bool isSelected) {
            setState(() {
              value = isSelected ? index : 0;
              widget.onCategorySelected(categories[index]);
            });
          }
        );
      }).toList(),
    );
  }
}
