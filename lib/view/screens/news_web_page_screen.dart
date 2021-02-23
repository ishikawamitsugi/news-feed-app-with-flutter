import 'package:flutter/material.dart';
import 'package:news_feed/models/model/news_model.dart';
import 'package:webview_flutter/webview_flutter.dart';

class NewsWebPageScreen extends StatelessWidget {
  final Article article;
  NewsWebPageScreen({this.article});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme.headline1;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          article.title,
        ),
      ),
      body: WebView(
        initialUrl: article.url,
        javascriptMode: JavascriptMode.unrestricted,
      )
    );
  }
}
