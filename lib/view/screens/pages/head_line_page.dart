import 'package:flutter/material.dart';
import 'package:news_feed/components/head_line_item.dart';
import 'package:news_feed/components/page_transformer.dart';
import 'package:news_feed/data/search_type.dart';
import 'package:news_feed/models/model/news_model.dart';
import 'package:news_feed/view_models/head_line_view_model.dart';
import 'package:provider/provider.dart';

class HeadLinePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Future(() {
      // 値の通知はうけるがリビルドはしない
      final viewModel = context.read<HeadLineViewModel>();
      if (!viewModel.isLoading && viewModel.articles.isEmpty) {
        // Articlesを取得してViewModelの中に格納する
        viewModel.getHeadLineNews(searchType: SearchType.HEAD_LINE);
      }
    });

    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: EdgeInsets.only(right:5.0),
          child: Consumer<HeadLineViewModel>(
            builder: (context, viewModel, child) {
              return PageTransformer(
                  pageViewBuilder: (context, pageVisibilityResolver) {
                return PageView.builder(
                  controller: PageController(
                    viewportFraction: 0.9,
                    initialPage: 0,
                  ),
                  scrollDirection: Axis.horizontal,
                  itemCount: viewModel.articles.length,
                  itemBuilder: (context, index) {
                    final article = viewModel.articles[index];
                    final pageVisibility =
                        pageVisibilityResolver.resolvePageVisibility(index);
                    final visibleFraction = pageVisibility.visibleFraction;
                    return HeadLineItem(
                      article: article,
                      pageVisibility: pageVisibility,
                      onArticleClicked: (article) =>
                          _openArticleWebPage(context, article),
                    );
                  },
                );
              });
            },
          ),
        ),
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.refresh),
          onPressed: () => onRefresh(context),
        ),
      ),
    );
  }

  onRefresh(BuildContext context) async {
    print("HeadLinePage.onRefresh");
    final viewModel = context.read<HeadLineViewModel>();
    await viewModel.getHeadLineNews(searchType: SearchType.HEAD_LINE);
  }

  _openArticleWebPage(BuildContext context, Article article) {
    print("headline");
  }
}
