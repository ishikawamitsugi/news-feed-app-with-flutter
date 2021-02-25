import 'package:flutter/material.dart';
import 'package:news_feed/data/category_info.dart';
import 'package:news_feed/data/search_type.dart';
import 'package:news_feed/models/model/news_model.dart';
import 'package:news_feed/models/repository/news_repository.dart';

class HeadLineViewModel extends ChangeNotifier {

  final NewsRepository _repository;

  // 初期化つきコンストラクタ
  HeadLineViewModel({repository}): _repository = repository;
  List<Article> _articles = [];

  List<Article> get articles => _articles;

  SearchType _searchType = SearchType.HEAD_LINE;

  SearchType get searchType => this._searchType;

  bool _isLoading = false;

  bool get isLoading => _isLoading;

  Future<void> getHeadLineNews({@required SearchType searchType}) async {
    this._searchType = searchType;
    this._isLoading = true;
    notifyListeners();

    this._articles = await this._repository.getNews(
        searchType: SearchType.HEAD_LINE, keyword: '', category: categories[0]);

    print("article / ${_articles[0].title}");
    this._isLoading = false;
    notifyListeners();
  }

  @override
  void dispose() {
    _repository.dispose();
    super.dispose();
  }
}