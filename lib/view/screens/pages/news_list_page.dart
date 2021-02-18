import 'package:flutter/material.dart';
import 'package:news_feed/components/category_chips.dart';
import 'package:news_feed/components/search_bar.dart';
import 'package:news_feed/data/category_info.dart';
import 'package:news_feed/data/search_type.dart';
import 'package:news_feed/view_models/news_list_view_model.dart';
import 'package:provider/provider.dart';

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
                    getCategoryNews(context, category),
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

  onRefresh(BuildContext context) {
    final viewModel = Provider.of<NewsListViewModel>(context, listen: false);
    viewModel.getNews(
      searchType: viewModel.searchType,
      keyword: viewModel.keyword,
      category: viewModel.category,
    );
  }

  getKeywordNews(BuildContext context, String keyword) {
    final viewModel = Provider.of<NewsListViewModel>(context, listen: false);
    viewModel.getNews(
      searchType: SearchType.KEY_WORD,
      keyword: keyword,
      category: categories[0],
    );
    print("my input keyword: $keyword");
  }

  getCategoryNews(BuildContext context, category) {
    final viewModel = Provider.of<NewsListViewModel>(context, listen: false);
    viewModel.getNews(
      searchType: SearchType.CATEGORY,
      keyword: '',
      category: category,
    );
    print("my input keyword: ${category.nameJp}");
  }
}
