import 'package:flutter/material.dart';
import 'package:news_feed/components/article_tile_desc.dart';
import 'package:news_feed/components/image_from_url.dart';
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
              child: Padding(
                padding: EdgeInsets.all(4.0),
                child: Container(
                  width: 120,
                  height:100,
                  child: ImageFromUrl(
                    imageUrl: article.urlToImage,
                  ),
                ),
              ),
            ),
            Expanded(
              flex: 2,
              child: Padding(
                  padding: EdgeInsets.all((8.0)),
                  child: ArticleTileDesc(
                    article: article,
                  )),
            ),
          ],
        ),
      ),
    );
  }
}
