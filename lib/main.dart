import 'package:flutter/material.dart';
import 'package:news_feed/di/providers.dart';
import 'package:news_feed/view/screens/home_screen.dart';
import 'package:news_feed/view/style/style.dart';
import 'package:provider/provider.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart' as DotEnv;

void main() async {
  await DotEnv.load(fileName: ".env");
  return runApp(MultiProvider(
    providers: globalProvider,
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
