import 'source.dart';

// class NewsDescription {
//   Source source;
//   String author;
//   String title;
//   String description;
//   String url;
//   String urlToImage;
//   String publishedAt;
//   String content;
//
// //! CONSTRUCTOR TO INITIALIZE CLASS MEMBERS.
//   NewsDescription(
//       {required this.source,
//       required this.author,
//       required this.title,
//       required this.description,
//       required this.url,
//       required this.urlToImage,
//       required this.publishedAt,
//       required this.content});
//
// //! CREATE / MAP - INTERFACE / ARTICLE PATTERN FROM JSON.
//   factory NewsDescription.fromJson(Map<String, dynamic> json) {
//     return NewsDescription(
//       source: json["source"] == null
//           ? Source.fromJson({})
//           : Source.fromJson(json["source"]),
//       author: json["author"] ?? "Unknown Author",
//       title: json["title"] ?? "My News",
//       description: json["description"] ?? "",
//       url: json["url"] ?? "",
//       urlToImage: json["urlToImage"] ?? "",
//       publishedAt: json["publishedAt"] ?? "",
//       content: json["content"] ?? "",
//     );
//   }
// }
class Article {
  String title;
  String description;
  String url;
  String urlToImage;
  String publishedAt;
  String content;
  Source source;
  String author;
  Article(
      {required this.source,
      required this.author,
      required this.title,
      required this.description,
      required this.url,
      required this.urlToImage,
      required this.publishedAt,
      required this.content});

  Article.fromJson(Map<String, dynamic> json)
      : author = json['author'] ?? "Unknown Author",
        source = json["source"] == null
            ? Source.fromJson({})
            : Source.fromJson(json["source"]),
        title = json['title'] ?? "My News",
        description = json['description'] ?? "",
        url = json['url'] ?? "",
        urlToImage = json['urlToImage'] ?? "",
        publishedAt = json['publishedAt'] ?? "",
        content = json['content'] ?? "";
}
