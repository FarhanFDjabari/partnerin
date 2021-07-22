import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:partnerin/infrastructure/home/articles_repository.dart';
import 'package:partnerin/model/home/article_response.dart';

part 'article_state.dart';

class ArticleCubit extends Cubit<ArticleState> {
  ArticleCubit() : super(ArticleInitial());
  ArticlesRepository _article = ArticlesRepository();

  void getAllArticles(String token) async {
    emit(ArticleLoading());
    try {
      final result = await _article.getAllArticle(token);
      if (result.status == 'success') {
        emit(ArticleLoadSuccess(result.result!));
      } else {
        emit(ArticleLoadError('Load article error: \n${result.result}'));
      }
    } catch (error) {
      emit(ArticleLoadError('Load article error: \n$error'));
    }
  }
}
