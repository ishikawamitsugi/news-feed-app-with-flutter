import 'package:flutter/material.dart';
import 'package:news_feed/components/image_from_url.dart';
import 'package:news_feed/components/page_transformer.dart';
import 'package:news_feed/models/model/news_model.dart';

class HeadLineItem extends StatelessWidget {
  final Article article;
  final PageVisibility pageVisibility;
  final ValueChanged onArticleClicked;

  HeadLineItem({this.article, this.pageVisibility, this.onArticleClicked});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Card(
      // カードの下に落ちる影
      elevation: 4.0,
      child: InkWell(
        onTap: () => this.onArticleClicked(this.article),
        child: Stack(
          children: [
            ImageFromUrl(imageUrl: article.urlToImage,),
            Positioned(
              right: 32,
              left: 32,
              bottom: 56.0,
              child: Text(
                article.title,
                style:
                    textTheme.subtitle1.copyWith(fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
