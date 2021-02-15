import 'package:flutter/material.dart';
import 'package:news_feed/style/style.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
            child: Text('米国株が急進', style: TextStyle(fontFamily: BoldFont),)
            ))
      );
  }
}

