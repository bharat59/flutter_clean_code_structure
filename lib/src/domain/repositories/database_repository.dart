import '../models/responses/breaking_news_response.dart';

abstract class DatabaseRepository {
  Future<List<Article>> getSavedArticles();

  Future<void> saveArticle(Article article);

  Future<void> removeArticle(Article article);
}