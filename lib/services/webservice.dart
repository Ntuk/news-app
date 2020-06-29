import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:news_app/models/newsArticle.dart';

class Webservice {

  Future<List<NewsArticle>> fetchTopHeadlines() async {
    String url =
        "https://newsapi.org/v2/top-headlines?country=us&apiKey=626a11ec75e64531a31b6789f90d51ca";

    final response = await http.get(url);
    
    if (response.statusCode == 200) {
      final result = jsonDecode(response.body);
      Iterable list = result["articles"];
      return list.map((article) => NewsArticle.fromJSON(article)).toList();

    } else {
      throw Exception("Failed to fetch the news");
    }
  }
}
