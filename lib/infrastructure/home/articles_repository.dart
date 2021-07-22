import 'package:dio/dio.dart';
import 'package:partnerin/model/home/article_response.dart';

import '../../constants.dart';

class ArticlesRepository {
  Dio _dio = Dio();

  Future<ArticleResponse> getAllArticle(String token) async {
    try {
      Response _response = await _dio.get(
        Constants.BASE_URL + '/api/v1/articles',
        options: Options(
          headers: {'Authorization': "Bearer $token"},
        ),
      );
      ArticleResponse _articleResponse =
          ArticleResponse.fromJson(_response.data);
      return _articleResponse;
    } on DioError catch (error) {
      return ArticleResponse.fromJson(error.response!.data);
    }
  }
}
