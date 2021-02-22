import 'package:flutter/material.dart';
import 'package:news_feed/data/search_type.dart';
import 'package:news_feed/view_models/head_line_view_model.dart';
import 'package:provider/provider.dart';

class HeadLinePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Future(() {
      // 値の通知はうけるがリビルドはしない
      final viewModel = context.read<HeadLineViewModel>();
      if(!viewModel.isLoading && viewModel.articles.isEmpty) {
        // Articlesを取得してViewModelの中に格納する
        viewModel.getHeadLineNews(searchType: SearchType.HEAD_LINE);
      }
    });

    return SafeArea(
      child: Scaffold(
        body: Container(
          child: Center(
            child:  Text('HeadLineNews')
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
    print ("HeadLinePage.onRefresh");
    final viewModel = context.read<HeadLineViewModel>();
    await viewModel.getHeadLineNews(searchType: SearchType.HEAD_LINE);
  }
}
