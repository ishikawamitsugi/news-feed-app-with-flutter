import 'package:flutter/material.dart';
import 'package:news_feed/models/db/database.dart';
import 'package:news_feed/view/screens/home_screen.dart';
import 'package:news_feed/view/style/style.dart';
import 'package:news_feed/view_models/head_line_view_model.dart';
import 'package:news_feed/view_models/news_list_view_model.dart';
import 'package:provider/provider.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart' as DotEnv;

MyDatabase myDatabase;

void main() async {
  // DIなしの場合はトップレベルで宣言して使う。
  myDatabase = MyDatabase();
  await DotEnv.load(fileName: ".env");
  return runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(
        create: (_) => NewsListViewModel(),
      ),
      ChangeNotifierProvider(
        create: (_) => HeadLineViewModel(),
      ),
    ],
    child: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'NewsFeed',
      theme: ThemeData(brightness: Brightness.dark, fontFamily: BoldFont),
      home: HomeScreen(),
    );
  }
}
