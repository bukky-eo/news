import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Country {
  final String name;
  final String id;
  Country({required this.name, required this.id});
  // void toggle() {
  //   isDone = !isDone;
  // }

}

List<Country> country = [
  Country(name: 'London', id: ""),
  Country(name: 'London', id: ""),
  Country(name: 'London', id: ""),
  Country(name: 'London', id: ""),
  Country(name: 'London', id: ""),
  Country(name: 'London', id: ""),
  Country(name: 'London', id: ""),
  Country(name: 'London', id: ""),
  Country(name: 'London', id: ""),
  Country(name: 'London', id: ""),
  Country(name: 'London', id: ""),
  Country(name: 'London', id: ""),
  Country(name: 'London', id: ""),
  Country(name: 'London', id: ""),
  Country(name: 'London', id: ""),
  Country(name: 'London', id: ""),
  Country(name: 'London', id: ""),
  Country(name: 'London', id: ""),
  Country(name: 'London', id: ""),
];

const newsUrl = 'https://newsapi.org/v2';
const apiKey = 'b0e615eb9124484ebb9c8072842ec2a0';

// class CountryData {
//   Future getCountryData(String id) async {
//     // creating a map to store crypto currency name and prices
//     Map<String, String> countriess = {};
//
//     for (List<String> countries in country) {
//       String requestURL = '$newsUrl/$countries/$id?apiKey=$apiKey';
//       http.Response response = await http.get(Uri.parse(requestURL));
//
//       if (response.statusCode == 200) {
//         var countryId = jsonDecode(response.body)['id'];
//         countriess[countries] = countryId;
//       } else {
//         print(response.statusCode);
//       }
//     }
//     return countriess;
//   }
// }
