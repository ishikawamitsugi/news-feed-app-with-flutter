import 'package:flutter/material.dart';
import 'package:news_feed/components/category_chips.dart';
import 'package:news_feed/components/search_bar.dart';

class NewsListPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.refresh),
          tooltip: '更新',
          onPressed: () => onRefresh(context),
        ),
        body: Padding(
          padding: EdgeInsets.all(8.0),
          child: Column(
            children: [
              SearchBar(
                onSearch: (keyword) => getKeywordNews(context, keyword),
              ),
              CategoryChips(
                  onCategorySelected: (category) =>
                      getCategoryNews(context, category);
              ),
              Expanded(
                child: Center(
                  child: CircularProgressIndicator(),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // TODO
  onRefresh(BuildContext context) {}

  getKeywordNews(BuildContext context, String keyword) {
    print("my input keyword: $keyword");
  }

  getCategoryNews(BuildContext context, category) {
    print("my input keyword: ${category.nameJp}");
  }
}
