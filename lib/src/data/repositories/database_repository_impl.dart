import '../../domain/models/responses/breaking_news_response.dart';
import '../../domain/repositories/database_repository.dart';
import '../datasources/local/app_database.dart';
import '../datasources/local/dao/article_dao.dart';

class DatabaseRepositoryImpl implements DatabaseRepository {
  final AppDatabase _appDatabase;

  DatabaseRepositoryImpl(this._appDatabase);

  @override
  Future<List<Article>> getSavedArticles() {
    return _appDatabase.articleDao.getAllArticles();
  }

  @override
  Future<void> removeArticle(Article article) {
    return _appDatabase.articleDao.deleteArticle(article);
  }

  @override
  Future<void> saveArticle(Article article) {
    return _appDatabase.articleDao.insertArticle(article);
  }

}