import 'package:equatable/equatable.dart';

class BreakingNewsResponse extends Equatable {
  String status;
  int totalResults;
  List<Article> articles;

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

class Article {
  ArticleSource source;
  String author;
  String title;
  String description;
  String url;
  String urlToImage;
  String publishedAt;
  String content;

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

  factory Article.fromJson(Map<String, dynamic> json) {
    return Article(
      source: ArticleSource.fromJson(json['source']),
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

class ArticleSource {
  String? id;
  String? name;

  ArticleSource({
    this.id,
    this.name,
  });

  factory ArticleSource.fromJson(Map<String, dynamic> json) {
    return ArticleSource(
      id: json['id'],
      name: json['name'],
    );
  }
}
