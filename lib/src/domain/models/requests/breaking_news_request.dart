import '../../../utils/constants/string.dart';

class BreakingNewsRequest {
  final String apiKey;
  final String country;
  final String category;
  final int page;
  final int pageSize;

  BreakingNewsRequest({
    this.apiKey = defaultApiKey,
    this.category = 'general',
    this.country = 'us',
    this.page = 1,
    this.pageSize = defaultPageSize,
  });
}
