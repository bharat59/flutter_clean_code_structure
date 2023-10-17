import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:ionicons/ionicons.dart';

import '../../domain/models/responses/breaking_news_response.dart';
import '../../utils/extensions/scroll_controller_extension.dart';
import '../cubits/remote_articles_cubit.dart';
import '../widgets/article_widget.dart';

class BreakingNewsView extends HookWidget {
  const BreakingNewsView({super.key});

  @override
  Widget build(BuildContext context) {
    final remoteArticleCubit = BlocProvider.of<RemoteArticlesCubit>(context);
    final scrollController = useScrollController();

    useEffect(() {
      scrollController.onScrollEndsListener(() {
        remoteArticleCubit.getBreakingNewsArticles();
      });
      return scrollController.dispose;
    }, const []);

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Daily News',
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: BlocBuilder<RemoteArticlesCubit, RemoteArticlesState>(
        builder: (_, state) {
          switch (state.runtimeType) {
            case RemoteArticlesSuccess:
              print("LOG | Success | UI====>");
              return _buildArticles(
                scrollController,
                state.articles,
                state.noMoreData,
              );
            case RemoteArticlesLoading:
              return const Center(child: CircularProgressIndicator());
            case RemoteArticlesFailed:
              return const Center(child: Icon(Ionicons.refresh));
            default:
              return const SizedBox();
          }
        },
      ),
    );
  }

  Widget _buildArticles(
    ScrollController scrollController,
    List<Article> articles,
    bool noMoreData,
  ) {
    return CustomScrollView(
      controller: scrollController,
      slivers: [
        SliverList(
          delegate: SliverChildBuilderDelegate(
            (context, index) => ArticleWidget(article: articles[index]),
            childCount: articles.length,
          ),
        ),
        if (!noMoreData)
          const SliverToBoxAdapter(
            child: Padding(
              padding: EdgeInsets.only(top: 14, bottom: 32),
              child: CircularProgressIndicator(),
            ),
          )
      ],
    );
  }
}
