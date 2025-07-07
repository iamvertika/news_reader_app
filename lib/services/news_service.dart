import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/news_article.dart';

Future<List<NewsArticle>> fetchNews() async {
  final apiKey = '423d4c4de83f4f339182f576ed370552'; // Your NewsAPI key
  final url =
      'https://newsapi.org/v2/top-headlines?country=us&apiKey=$apiKey';

  final response = await http.get(Uri.parse(url));

  if (response.statusCode == 200) {
    final Map<String, dynamic> jsonData = json.decode(response.body);
    final List articles = jsonData['articles'];

    return articles
        .map((articleJson) => NewsArticle.fromJson(articleJson))
        .toList();
  } else {
    throw Exception('Failed to load news');
  }
}
