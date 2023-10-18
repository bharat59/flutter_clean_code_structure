import 'package:equatable/equatable.dart';
import 'package:floor/floor.dart';

import '../../../utils/constants/string.dart';

class BreakingNewsResponse extends Equatable {
  final String status;
  final int totalResults;
  final List<Article> articles;

  BreakingNewsResponse({
    required this.status,
    required this.totalResults,
    required this.articles,
  });

  factory BreakingNewsResponse.fromJson(Map<String, dynamic> json) {
    var articleList = json['articles'] as List;
    List<Article> articles =
        articleList.map((i) => Article.fromJson(i)).toList();

    return BreakingNewsResponse(
      status: json['status'],
      totalResults: json['totalResults'],
      articles: articles,
    );
  }

  @override
  bool? get stringify => true;

  @override
  List<Object?> get props => [status, totalResults, articles];
}

@Entity(tableName: articlesTableName)
class Article {
  @PrimaryKey(autoGenerate: true)
  final int? id;
  Source source;
  String author;
  String title;
  String description;
  String url;
  String urlToImage;
  String publishedAt;
  String content;

  Article({
    this.id,
    required this.source,
    required this.author,
    required this.title,
    required this.description,
    required this.url,
    required this.urlToImage,
    required this.publishedAt,
    required this.content,
  });

  factory Article.fromJson(Map<String, dynamic> json) {
    return Article(
      id: json['id'],
      source: Source.fromJson(json['source']),
      author: json['author'] ?? "",
      title: json['title'] ?? "",
      description: json['description'] ?? "",
      url: json['url'] ?? "",
      urlToImage: json['urlToImage'] ?? "",
      publishedAt: json['publishedAt'] ?? "",
      content: json['content'] ?? "",
    );
  }
}

class Source {
  String? id;
  String? name;

  Source({
    this.id,
    this.name,
  });

  factory Source.fromJson(Map<String, dynamic> json) {
    return Source(
      id: json['id'],
      name: json['name'],
    );
  }
}
