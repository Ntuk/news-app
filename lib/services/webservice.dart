import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:news_app/models/newsArticle.dart';
import 'package:news_app/utils/constants.dart';

class Webservice {

  Future<List<NewsArticle>> fetchHeadlinesByKeyboard(String keyword) async {

    final response = await http.get(Constants.headlinesFor(keyword));

    if(response.statusCode == 200) {
      final result = jsonDecode(response.body);
      Iterable list = result["articles"];
      return list.map((json) => NewsArticle.fromJSON(json)).toList();
    } else {
      throw Exception("Failed to fetch the news");
    }
  }

  Future<List<NewsArticle>> fetchTopHeadlines() async {

    final response = await http.get(Constants.TOP_HEADLINES_URL);
    
    if (response.statusCode == 200) {
      final result = jsonDecode(response.body);
      Iterable list = result["articles"];
      return list.map((article) => NewsArticle.fromJSON(article)).toList();

    } else {
      throw Exception("Failed to fetch the news");
    }
  }

}
