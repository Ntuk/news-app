import 'package:flutter/material.dart';
import 'package:news_app/pages/newsListPage.dart';
import 'package:news_app/viewmodels/newsArticleListViewModel.dart';
import 'package:provider/provider.dart';

void main() => runApp(App());
class App extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      title: "News", 
      home: 
      ChangeNotifierProvider(
        create: (_) => NewsArticleListViewModel(), 
        child: NewsListPage()
      )
    );
    
  }

}