import 'package:chopper/chopper.dart';
import 'package:flutter/cupertino.dart';
import 'package:news_feed/data/category_info.dart';
import 'package:news_feed/data/search_type.dart';
import 'package:news_feed/models/db/dao.dart';
import 'package:news_feed/models/model/news_model.dart';
import 'package:news_feed/models/networking/api_service.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart' as DotEnv;
import 'package:news_feed/util/extensions.dart';

class NewsRepository {

  // メンバ変数
  final ApiService _apiService;
  final NewsDao _dao;

  // 初期化つきコンストラクタ
  NewsRepository({dao, apiService})
      : _apiService = apiService,
        _dao = dao;

  Future<List<Article>> getNews({@required SearchType searchType,
    String keyword,
    Category category}) async {
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
          response = await _apiService.getKeywordNews(
              keyword: keyword, apiKey: apiKey);
          break;
        case SearchType.CATEGORY:
          response = await _apiService.getCategoryNews(
              category: category.nameEn, apiKey: apiKey);
          break;
      }

      if (response.isSuccessful) {
        final responseBody = response.body;
        // DBに結果を格納して、DBから値を取得する
        result = await insertAndReadFromDB(responseBody);
      } else {
        final errCode = response.statusCode;
        final error = response.error;
        print("response is not successful errCode: $errCode / $error");
      }
    } on Exception catch (error) {
      print("error : $error");
    }

    return result;
  }

  Future<List<Article>> insertAndReadFromDB(responseBody) async {
    // JsonからDartのクラスに変換
    final articles = News
        .fromJson(responseBody)
        .articles;

    // DartのクラスからDBのクラスに変換しローカルDBに格納し、DBのクラスで返す
    final articleRecords = await _dao
        .insertAndReadNewsFromDB(articles.toArticleRecord(articles));

    return articleRecords.toArticle(articleRecords);
  }

  void dispose() {
    // これを呼ばないとアプリがいつまでもHTTP通信をリクエストし続ける
    this._apiService.dispose();
  }
}
