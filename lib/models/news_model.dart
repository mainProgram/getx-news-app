import 'dart:convert';

News articleFromJson(String str) => News.fromJson(json.decode(str));

String articleToJson(News data) => json.encode(data.toJson());

class News {
  String name;
  String author;
  String title;
  String description;
  String url;
  String urlToImage;
  DateTime publishedAt;
  String content;

  News({
    required this.name,
    required this.author,
    required this.title,
    required this.description,
    required this.url,
    required this.urlToImage,
    required this.publishedAt,
    required this.content,
  });

  factory News.fromJson(Map<String, dynamic> json) => News(
    name: json["source"]["name"] ?? "",
    author: json["author"] ?? "",
    title: json["title"] ?? "",
    description: json["description"] ?? "",
    url: json["url"] ?? "",
    urlToImage: json["urlToImage"] ?? "https://p1.hiclipart.com/preview/658/470/455/krzp-dock-icons-v-1-2-empty-grey-empty-text-png-clipart.jpg",
    publishedAt: DateTime.parse(json["publishedAt"]),
    content: json["content"] ?? "",
  );

  Map<String, dynamic> toJson() => {
    "name": name,
    "author": author,
    "title": title,
    "description": description,
    "url": url,
    "urlToImage": urlToImage,
    "publishedAt": publishedAt.toIso8601String(),
    "content": content,
  };
}
