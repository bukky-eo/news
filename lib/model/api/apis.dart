import 'dart:convert';
import 'news_model.dart';
import 'package:http/http.dart' as http;

class NetworkHelper {
  final Uri url;
  NetworkHelper(this.url);

  Future<dynamic> getData() async {
    http.Response response = await http.get(url);
    if (response.statusCode == 200) {
      String data = response.body;
      return jsonDecode(data);
    } else {
      print(response.statusCode);
      throw Exception('Failed to get weather data');
    }
  }
}

// Future<List<Article>> fetchArticles() async {
//   final response = await http.get(Uri.parse(
//       'https://newsapi.org/v2/top-headlines?country=us&apiKey=YOUR_API_KEY'));
//
//   if (response.statusCode == 200) {
//     final json = jsonDecode(response.body);
//     return (json['articles'] as List)
//         .map((articleJson) => Article.fromJson(articleJson))
//         .toList();
//   } else {
//     throw Exception('Failed to load articles');
//   }
// }
