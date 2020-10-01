import 'package:flutter/material.dart';
import 'package:noticias/src/models/news_models.dart';
import 'package:http/http.dart' as http;

final _URL_NEWS = 'https://newsapi.org/v2';
final _API_KEY = '0820910358f64081b2bc9518c6853675';

class NewsService with ChangeNotifier {
  List<Article> headlines = [];

  NewsService() {
    this.getTopHeadlines();
  }

  getTopHeadlines() async {
    final url = '$_URL_NEWS/top-headlines?country=us&apiKey=$_API_KEY';
    final resp = await http.get(url);

    final newsResponse = newsResponseFromJson(resp.body);
    this.headlines.addAll(newsResponse.articles);
    notifyListeners();
  }
}
