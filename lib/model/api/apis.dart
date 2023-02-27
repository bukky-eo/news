import 'dart:convert';
import 'news_model.dart';
// import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class ApiService {
  final Uri url;
  ApiService({required this.url});

  Future<List<NewsDescription>> getData() async {
    http.Response response = await http.get(url);
    if (response.statusCode == 200) {
      Map<String, dynamic> json = jsonDecode(response.body);
      List<dynamic> body = json['articles'];
      List<NewsDescription> articles =
          body.map((dynamic item) => NewsDescription.fromJson(item)).toList();
      return articles;
    } else {
      throw ("Can't get the Article ");
    }
  }
}
