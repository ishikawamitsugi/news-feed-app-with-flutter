import 'package:flutter/material.dart';
import 'package:news_feed/models/model/news_model.dart';
import 'package:news_feed/view/style/style.dart';

class ArticleTileDesc extends StatelessWidget {
  final Article article;
  ArticleTileDesc({this.article});

  @override
  Widget build(BuildContext context) {

    // マテリアルデザインを取得
    final textTheme = Theme.of(context).textTheme;
    var displayDesc = "";
    if (article.description != null) {
      displayDesc = article.description;
    }
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(article.title.toString(), style: textTheme.subtitle1.copyWith(
          fontWeight: FontWeight.bold,
        ),),
        SizedBox(height: 2.0,),
        Text(article.publishDate.toString(), style: textTheme.overline.copyWith(
            fontStyle: FontStyle.italic
        ),),
        SizedBox(height: 2.0,),
        Text(displayDesc, style: textTheme.bodyText1.copyWith(
          fontFamily: RegularFont
        ),),
      ],
    );
  }
}
