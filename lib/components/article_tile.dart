import 'package:flutter/material.dart';
import 'package:news_feed/models/model/news_model.dart';

class ArticleTile extends StatelessWidget {
  final Article article;

  final ValueChanged onArticleClicked;

  ArticleTile({this.article, this.onArticleClicked});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 8.0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: InkWell(
        onTap: () => onArticleClicked(article),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              flex: 1,
              child: Container(),
            ),
            Expanded(
              flex: 3,
              child: Column(
                children: [
                  Text(article.title.toString()),
                  Text(article.publishDate.toString()),
                  Text(article.description.toString()),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
