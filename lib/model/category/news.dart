import 'package:flutter/material.dart';

import '../api/apis.dart';
import '../api/news_model.dart';

const newsUrl = 'https://newsapi.org/v2';
const category = 'top-headlines';
const country = 'ng';
const apiKey = 'b0e615eb9124484ebb9c8072842ec2a0';

class News {
  final newsUrl = 'https://newsapi.org/v2';
  final category = 'top-headlines';
  final country = 'ng';
  final apiKey = 'b0e615eb9124484ebb9c8072842ec2a0';

  //   if (response.statusCode == 200) {
  //     final json = jsonDecode(response.body);
  //     return (json['articles'] as List)
  //         .map((articleJson) => Article.fromJson(articleJson))
  //         .toList();
  //   } else {
  //     throw Exception('Failed to load articles');
  //   }
  // }
}
