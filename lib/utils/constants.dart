

class Constants {

  // ignore: non_constant_identifier_names
  static String TOP_HEADLINES_URL = "https://newsapi.org/v2/top-headlines?sources=bbc-news&apiKey=626a11ec75e64531a31b6789f90d51ca";
  static String headlinesFor(String keyword) {
    return "https://newsapi.org/v2/everything?q=$keyword&apiKey=626a11ec75e64531a31b6789f90d51ca";
  }

}
