import 'package:floor/floor.dart';

import '../../../../domain/models/responses/breaking_news_response.dart';
import '../../../../utils/constants/string.dart';

@dao
abstract class ArticleDao {
  @Query('SELECT * FROM $articlesTableName')
  Future<List<Article>> getAllArticles();

  @Insert(onConflict: OnConflictStrategy.replace)
  Future<void> insertArticle(Article article);

  @delete
  Future<void> deleteArticle(Article article);
}