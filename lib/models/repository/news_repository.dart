import 'package:chopper/chopper.dart';
import 'package:flutter/cupertino.dart';
import 'package:news_feed/data/category_info.dart';
import 'package:news_feed/data/search_type.dart';
import 'package:news_feed/models/model/news_model.dart';
import 'package:news_feed/models/networking/api_service.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart' as DotEnv;

class NewsRepository {

  // ApiClientの作成
  final ApiService _apiService = ApiService.create();

  Future<List<Article>> getNews(
      {@required SearchType searchType, String keyword, Category category}) async {
    Response response;
    final apiKey = DotEnv.env["NEWS_API_KEY"];
    List<Article> result = [];
    print("get apiKey : $apiKey");

    try {
      switch (searchType) {
        case SearchType.HEAD_LINE:
          response = await _apiService.getHeadLines(apiKey: apiKey);
          break;
        case SearchType.KEY_WORD:
          response = await _apiService.getKeywordNews(keyword: keyword, apiKey: apiKey);
          break;
        case SearchType.CATEGORY:
          response = await _apiService.getCategoryNews(category: category.nameEn, apiKey: apiKey);
          break;
      }

      if (response.isSuccessful) {
        final responseBody = response.body;
        //　json形式のデータからArticle形式に変換
        result = News
            .fromJson(responseBody)
            .articles;
      } else {
        final errCode = response.statusCode;
        final error = response.error;
        print("response is not successful errCode: $errCode / $error");
      }
    }
    on Exception catch (error) {
      print("error : $error");
    }

    return result;
  }

  void dispose() {
    // これを呼ばないとアプリがいつまでもHTTP通信をリクエストし続ける
    this._apiService.dispose();
  }
}