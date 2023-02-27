import 'package:flutter/material.dart';

import '../api/apis.dart';

const newsUrl = 'https://newsapi.org/v2';
const category = 'top-headlines';
const apiKey = 'b0e615eb9124484ebb9c8072842ec2a0';

class News {
  ApiService service = ApiService(
      url:
          Uri.parse('$newsUrl/$category?country=us&category=business&$apiKey'));
}
