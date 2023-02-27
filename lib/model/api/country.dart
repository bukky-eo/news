import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'news_model.dart';

// class Country {
//   final String name;
//   final String id;
//
//   Country({
//     required this.name,
//     required this.id,
//   });
//
//   static List<Country> country = [
//     Country(name: 'USA', id: 'us'),
//     Country(name: 'Nigeria', id: 'ng'),
//     Country(name: 'England', id: 'en'),
//     Country(name: 'USA', id: 'us'),
//     Country(name: 'USA', id: 'us'),
//     Country(name: 'USA', id: 'us'),
//     Country(name: 'USA', id: 'us'),
//     Country(name: 'USA', id: 'us'),
//     Country(name: 'USA', id: 'us'),
//     Country(name: 'USA', id: 'us'),
//     Country(name: 'USA', id: 'us'),
//     Country(name: 'USA', id: 'us'),
//     Country(name: 'USA', id: 'us'),
//     Country(name: 'USA', id: 'us'),
//     Country(name: 'USA', id: 'us'),
//     Country(name: 'USA', id: 'us'),
//   ];
// }

Map<String, String> countryId = {
  'USA': "us",
  'Nigeria': "ng",
  'UAE': "ae",
  'Austria': "at",
  'Argentina': "ar",
  'Belgium': "be",
  'Bulgaria': "bg",
  'Brazil': "br",
  'Switzerland': "ch",
  'Colombia': "co",
  'Czechia': "cz",
  'Cuba': "cu",
  'Canada': "ca",
  'China': "cn",
  'Germany': "de",
  'Egypt': "eg",
  'UK': "gb",
  'Greece': "gr",
  'Hong Kong': "hk",
  'Hungary': "hu",
  'Indonesia': "id",
  'Ireland': "ie",
  'Israel': "il",
  'India': "in",
  'Italy': "it",
  'Japan': "jp",
  'Korea': "kr",
  'Latvia': "lv",
  'Mexico': "mx",
  'Malaysia': "my",
  'Norway': "no",
  'Netherlands': "nl",
  'New Zealand': "nz",
  'Philippines': "ph",
  'Portugal': "pt",
  'Poland': "pl",
  'Romania': "ro",
  'Serbia': "rs",
  'Russia': "ru",
  'Saudi Arabia': "sa",
  'Sweden': "se",
  'Singapore': "sg",
  'Slovenia': "si",
  'Slovakia': "sk",
  'Thailand': "th",
  'Turkiye': "tr",
  'Taiwan': "tw",
  'Ukraine': "ua",
  'Venezuela': "ve",
  '': "za",
};

const newsUrl = 'https://newsapi.org/v2';
const apiKey = 'b0e615eb9124484ebb9c8072842ec2a0';

class CountryData {
  Future getCountryData(String id) async {
    // creating a map to store crypto currency name and prices
    // Map<String, String> countries = {};
    for (String country in countryId.values) {
      String requestURL = '$newsUrl/$country/$id?apiKey=$apiKey';
      http.Response response = await http.get(Uri.parse(requestURL));
      if (response.statusCode == 200) {
        Map<String, dynamic> json = jsonDecode(response.body);
        List<dynamic> body = json['articles'];
        List<NewsDescription> articles =
            body.map((dynamic item) => NewsDescription.fromJson(item)).toList();
        return articles;
      } else {
        throw (response.statusCode);
      }
    }
    // return countries;
  }
}
