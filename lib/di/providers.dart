import 'package:news_feed/models/db/dao.dart';
import 'package:news_feed/models/db/database.dart';
import 'package:news_feed/models/networking/api_service.dart';
import 'package:news_feed/models/repository/news_repository.dart';
import 'package:news_feed/view_models/head_line_view_model.dart';
import 'package:news_feed/view_models/news_list_view_model.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

List<SingleChildWidget> globalProvider = [
  ...independentModels,
  ...dependentModels,
  ...viewModels,
];

List<SingleChildWidget> independentModels = [
  Provider<ApiService>(
    create: (context) => ApiService.create(),
    dispose: (context, apiService) => apiService.dispose(),
  ),
  Provider<MyDatabase>(
    create: (context) => MyDatabase(),
    dispose: (context, db) => db.close(),
  )
];

List<SingleChildWidget> dependentModels = [
  ProxyProvider<MyDatabase, NewsDao>(update: (context, db, dao) => NewsDao(db)),
  ProxyProvider2<NewsDao, ApiService, NewsRepository>(
      update: (context, dao, apiService, repository) =>
          NewsRepository(dao: dao, apiService: apiService))
];

List<SingleChildWidget> viewModels = [
  ChangeNotifierProvider<HeadLineViewModel>(
    create: (context) => HeadLineViewModel(
      repository: Provider.of<NewsRepository>(context, listen: false),
    ),
  ),
  // Providerを用いてインスタンスを作成しDIしている
  ChangeNotifierProvider(
    create: (context) => NewsListViewModel(
      repository: Provider.of<NewsRepository>(context, listen: false),
    ),
  )
];
