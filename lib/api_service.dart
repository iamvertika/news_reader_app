import 'dart:convert';
import 'package:http/http.dart' as http;

class ApiService {
  final String apiKey = '423d4c4de83f4f339182f576ed370552';


  Future<List> fetchNews() async {
    final url = Uri.parse(
      'https://newsapi.org/v2/top-headlines?country=in&apiKey=$apiKey',
    );

    final response = await http.get(url);

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      return data['articles'];
    } else {
      throw Exception('Failed to load news');
    }
  }
}
