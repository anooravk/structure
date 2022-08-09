import 'dart:convert';

// To parse this JSON data, do
//
//     final helperModel = helperModelFromMap(jsonString);

HelperModel helperModelFromMap(String str) => HelperModel.fromMap(json.decode(str));

String helperModelToMap(HelperModel data) => json.encode(data.toMap());

class HelperModel {
  HelperModel({
    required this.status,
    required this.totalResults,
    required this.articles,
  });

  String status;
  int totalResults;
  List<Article>? articles;

  factory HelperModel.fromMap(Map<String, dynamic> json) => HelperModel(
    status: json["status"] == null ? null : json["status"],
    totalResults: json["totalResults"] == null ? null : json["totalResults"],
    articles: json["articles"] == null ? null : List<Article>.from(json["articles"]!.map((x) => Article.fromMap(x))),
  );

  Map<String, dynamic> toMap() => {
    "status": status == null ? null : status,
    "totalResults": totalResults == null ? null : totalResults,
    "articles": articles == null ? null : List<dynamic>.from(articles!.map((x) => x.toMap())),
  };
}

class Article {
  Article({
    required this.source,
    required this.author,
    required this.title,
    required this.description,
    required this.url,
    required this.urlToImage,
    required this.publishedAt,
    required this.content,
  });

  Source? source;
  Author? author;
  String title;
  String description;
  String url;
  String urlToImage;
  DateTime? publishedAt;
  String content;

  factory Article.fromMap(Map<String, dynamic> json) => Article(
    source: json["source"] == null ? null : Source.fromMap(json["source"]),
    author: json["author"] == null ? null : authorValues.map[json["author"]],
    title: json["title"] == null ? null : json["title"],
    description: json["description"] == null ? null : json["description"],
    url: json["url"] == null ? null : json["url"],
    urlToImage: json["urlToImage"] == null ? null : json["urlToImage"],
    publishedAt: json["publishedAt"] == null ? null : DateTime.parse(json["publishedAt"]),
    content: json["content"] == null ? null : json["content"],
  );

  Map<String, dynamic> toMap() => {
    "source": source == null ? null : source!.toMap(),
    "author": author == null ? null : authorValues.reverse[author],
    "title": title == null ? null : title,
    "description": description == null ? null : description,
    "url": url == null ? null : url,
    "urlToImage": urlToImage == null ? null : urlToImage,
    "publishedAt": publishedAt == null ? null : publishedAt!.toIso8601String(),
    "content": content == null ? null : content,
  };
}

enum Author { BBC_NEWS }

final authorValues = EnumValues({
  "BBC News": Author.BBC_NEWS
});

class Source {
  Source({
    required this.id,
    required this.name,
  });

  Id? id;
  Author? name;

  factory Source.fromMap(Map<String, dynamic> json) => Source(
    id: json["id"] == null ? null : idValues.map[json["id"]],
    name: json["name"] == null ? null : authorValues.map[json["name"]],
  );

  Map<String, dynamic> toMap() => {
    "id": id == null ? null : idValues.reverse[id],
    "name": name == null ? null : authorValues.reverse[name],
  };
}

enum Id { BBC_NEWS }

final idValues = EnumValues({
  "bbc-news": Id.BBC_NEWS
});

class EnumValues<T> {
  Map<String, T> map;
  Map<T, String>? reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    if (reverseMap == null) {
      reverseMap = map.map((k, v) => new MapEntry(v, k));
    }
    return reverseMap!;
  }
}
