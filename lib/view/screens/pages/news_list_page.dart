import 'package:flutter/material.dart';
import 'package:news_feed/components/article_tile.dart';
import 'package:news_feed/components/category_chips.dart';
import 'package:news_feed/components/search_bar.dart';
import 'package:news_feed/data/category_info.dart';
import 'package:news_feed/data/search_type.dart';
import 'package:news_feed/models/model/news_model.dart';
import 'package:news_feed/view_models/news_list_view_model.dart';
import 'package:provider/provider.dart';

class NewsListPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final viewModel = NewsListViewModel();

    if (!viewModel.isLoading && viewModel.articles.isEmpty) {
      Future(() => viewModel.getNews(
          searchType: SearchType.CATEGORY,
          keyword: "",
          category: categories[0]));
    }
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
                child: Consumer<NewsListViewModel>(
                  builder: (context, viewModel, child) {
                    return viewModel.isLoading
                        ? Center(
                            child: CircularProgressIndicator(),
                          )
                        : ListView.builder(
                            itemCount: viewModel.articles.length,
                            itemBuilder: (context, int index) => ArticleTile(
                              article: viewModel.articles[index],
                              onArticleClicked: (article) =>
                                  _openArticlePage(context, article),
                            ),
                          );
                  },
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

  _openArticlePage(BuildContext context, Article article) {}
}
