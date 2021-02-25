import 'package:moor/moor.dart';
import 'package:news_feed/models/db/database.dart';

part 'dao.g.dart';

@UseDao(tables: [ArticleRecords])
class NewsDao extends DatabaseAccessor<MyDatabase> with _$NewsDaoMixin {

  NewsDao(MyDatabase db) : super(db);

  Future clearDB() => delete(articleRecords).go();

  Future insertDB(List<ArticleRecord> articles) async {
    await batch((function) {
      // batch関数はコールバック関数としていくつも関数を記述できる。
      function.insertAll(articleRecords, articles);
    });
  }

  Future<List<ArticleRecord>> get articlesFromDB =>
      select(articleRecords).get();

  Future<List<ArticleRecord>> insertAndReadNewsFromDB (
      List<ArticleRecord> articles) async {
    // transactionは分割できない処理の時に使う。
    return transaction(() async {
      await clearDB();
      await insertDB(articles);
      return await articlesFromDB;
    });
  }
}