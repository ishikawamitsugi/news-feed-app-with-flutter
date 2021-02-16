import 'package:flutter/material.dart';

class SearchBar extends StatelessWidget {
  final ValueChanged onSearch;
  final TextEditingController _textEditingController = TextEditingController();

  SearchBar({this.onSearch});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2.0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(24),
        ),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24),
        child: TextField(
          controller: _textEditingController,
          onSubmitted: this.onSearch,
          maxLines: 1,
          decoration: InputDecoration(
            icon: Icon(Icons.search),
            hintText: '検索ワードを入力してください',
            border: InputBorder.none,
          ),
        ),
      ),
    );
  }
}
