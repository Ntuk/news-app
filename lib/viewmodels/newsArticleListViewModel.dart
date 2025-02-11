

import 'package:flutter/material.dart';
import 'package:news_app/models/newsArticle.dart';
import 'package:news_app/services/webservice.dart';
import 'package:news_app/viewmodels/newsArticleViewModel.dart';

enum LoadingStatus {
  completed, 
  searching, 
  empty 
}

class NewsArticleListViewModel extends ChangeNotifier {

  var loadingStatus = LoadingStatus.searching;

  List<NewsArticleViewModel> articles = List<NewsArticleViewModel>(); 

  Future<void> search(String keyword) async {
    this.loadingStatus = LoadingStatus.searching; 
    notifyListeners();
    List<NewsArticle> newsArticles = await Webservice().fetchHeadlinesByKeyword(keyword);
    this.articles = newsArticles.map((article) => NewsArticleViewModel(article: article)).toList();
    this.loadingStatus = this.articles.isEmpty ? LoadingStatus.empty : LoadingStatus.completed; 
    notifyListeners();
  }
  
  Future<void> populateTopHeadlines() async {
    this.loadingStatus = LoadingStatus.searching; 
    notifyListeners(); 
    List<NewsArticle> newsArticles = await Webservice().fetchTopHeadlines();
    this.articles = newsArticles.map((article) => NewsArticleViewModel(article: article)).toList();
    this.loadingStatus = this.articles.isEmpty ? LoadingStatus.empty : LoadingStatus.completed; 
    notifyListeners(); 
  }

}