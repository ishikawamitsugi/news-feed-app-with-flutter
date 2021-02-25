import 'package:news_feed/models/db/database.dart';
import 'package:news_feed/models/model/news_model.dart';

// List<Article>の拡張メソッドを定義
extension ConvertToArticleRecord on List<Article> {
  // DartクラスからDBのクラスへ
  List<ArticleRecord>  toArticleRecord (List<Article> articles) {
    var articleRecords = articles.map((article) {
      return ArticleRecord(
        title: article.title ?? "",
        url: article.url,
        urlToImage: article.urlToImage ?? "",
        content: article.content ?? "",
        description: article.description ?? "",
        publishDate: article.publishDate ?? "",
      );
    }).toList();
    return articleRecords;
  }
}

extension ConvertToArticle on List<ArticleRecord> {
  List<Article> toArticle(List<ArticleRecord> articleRecords) {
    var articles = articleRecords.map((record) {
      return Article(
        title: record.title ?? "",
        url: record.url,
        urlToImage: record.urlToImage ?? "",
        content: record.content ?? "",
        description: record.description ?? "",
        publishDate: record.publishDate ?? "",
      );
    }).toList();
    return articles;
  }
}