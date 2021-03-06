import 'package:flutter/material.dart';
import 'package:news_feed/components/image_from_url.dart';
import 'package:news_feed/components/lazy_load_text.dart';
import 'package:news_feed/components/page_transformer.dart';
import 'package:news_feed/models/model/news_model.dart';

class HeadLineItem extends StatelessWidget {
  final Article article;
  final PageVisibility pageVisibility;
  final ValueChanged onArticleClicked;

  HeadLineItem({this.article, this.pageVisibility, this.onArticleClicked});

  @override
  Widget build(BuildContext context) {
    return Card(
        // カードの下に落ちる影
        elevation: 4.0,
        child: InkWell(
          onTap: () => this.onArticleClicked(this.article),
          child: Stack(
            children: [
              DecoratedBox(
                  // デコレーションは上からかける
                  position: DecorationPosition.foreground,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.bottomCenter,
                      end: Alignment.topCenter,
                      colors: [
                        Colors.black87,
                        Colors.black26,
                      ],
                    ),
                  ),
                  child: ImageFromUrl(
                    imageUrl: article.urlToImage,
                  )),
              Positioned(
                right: 32,
                left: 32,
                bottom: 56.0,
                child: LazyLoadText(
                  text: article.title,
                  pageVisibility: pageVisibility,
                ),
              ),
            ],
          ),
        ),
      );
  }
}
