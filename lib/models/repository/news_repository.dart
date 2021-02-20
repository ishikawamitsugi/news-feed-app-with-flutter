import 'package:chopper/chopper.dart';
import 'package:flutter/cupertino.dart';
import 'package:news_feed/data/category_info.dart';
import 'package:news_feed/data/search_type.dart';
import 'package:news_feed/models/model/news_model.dart';
import 'package:news_feed/models/networking/api_service.dart';

class NewsListRepository {
  final ApiService _apiService = ApiService.create();

  // TODO 返値にFuture<List<Article>>を設定する
  Future<Article> getNews(
      {@required SearchType searchType, String keyword, Category category}) async {
    Response response;
    try {
      switch (searchType) {
        case SearchType.HEAD_LINE:
          response = await _apiService.getHeadLines();
          break;
        case SearchType.KEY_WORD:
          response = await _apiService.getKeywordNews();
          break;
        case SearchType.CATEGORY:
          response = await _apiService.getCategoryNews();
          break;
      }

      if (response.isSuccessful) {
        final responseBody = response.body;
      }
    }
    catch (err) {

    }
  }
}