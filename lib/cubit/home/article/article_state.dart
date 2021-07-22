part of 'article_cubit.dart';

@immutable
abstract class ArticleState {}

class ArticleInitial extends ArticleState {}

class ArticleLoading extends ArticleState {}

class ArticleLoadSuccess extends ArticleState {
  final ArticleResult articleResult;
  ArticleLoadSuccess(this.articleResult);
}

class ArticleLoadError extends ArticleState {
  final String errorMessage;
  ArticleLoadError(this.errorMessage);
}
