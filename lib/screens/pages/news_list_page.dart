import 'package:flutter/material.dart';

class NewsListPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.refresh),
          tooltip: '更新',
          onPressed: () => onRefresh(context)
          ),
        body: Padding(
          padding: EdgeInsets.all(8.0),
          child:Column(
              children: [
                // TODO
                // SerchBar(),
                // CategoryChips(),
                Expanded(
                  child: Center(
                    child: CircularProgressIndicator(),
                  )
                ),
              ],
            )
        )),
    );
  }

  // TODO
  onRefresh (BuildContext context) {
  }
}
