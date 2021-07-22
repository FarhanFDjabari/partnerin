import 'package:dio/dio.dart';
import 'package:partnerin/model/home/business_response.dart';
import 'package:partnerin/model/home/detail_business_response.dart';

import '../../constants.dart';

class BusinessRepository {
  Dio _dio = Dio();

  Future<BusinessResponse> getAllBusiness({required String token}) async {
    try {
      Response _response = await _dio.get(
        Constants.BASE_URL + '/api/v1/business',
        options: Options(
          headers: {
            'Authorization': "Bearer $token",
          },
        ),
      );
      BusinessResponse _businessResponse =
          BusinessResponse.fromJson(_response.data);
      return _businessResponse;
    } on DioError catch (error) {
      return BusinessResponse.fromJson(error.response!.data);
    }
  }

  Future<DetailBusinessResponse> getBusinessById(
      String token, String id) async {
    try {
      Response _response =
          await _dio.get(Constants.BASE_URL + '/api/v1/business/$id',
              options: Options(
                headers: {
                  'Authorization': "Bearer $token",
                },
              ));
      return DetailBusinessResponse.fromJson(_response.data);
    } on DioError catch (error) {
      return DetailBusinessResponse.fromJson(error.response!.data);
    }
  }

  Future<BusinessResponse> getAllBusinessByCategory(
      {required String token, required String category}) async {
    try {
      Response _response =
          await _dio.get(Constants.BASE_URL + '/api/v1/business',
              options: Options(
                headers: {
                  'Authorization': "Bearer $token",
                },
              ),
              queryParameters: {
            'category': category,
          });
      BusinessResponse _businessResponse =
          BusinessResponse.fromJson(_response.data);
      return _businessResponse;
    } on DioError catch (error) {
      return BusinessResponse.fromJson(error.response!.data);
    }
  }

  Future<BusinessResponse> getAllBusinessByTitle(
      {required String token, required String title}) async {
    try {
      Response _response =
          await _dio.get(Constants.BASE_URL + '/api/v1/business',
              options: Options(
                headers: {'Authorization': "Bearer $token"},
              ),
              queryParameters: {
            'title': title,
          });
      return BusinessResponse.fromJson(_response.data);
    } on DioError catch (error) {
      return BusinessResponse.fromJson(error.response!.data);
    }
  }

  Future<BusinessResponse> getAllBusinessByTitleCategory(
      {required String token,
      required String title,
      required String category}) async {
    try {
      Response _response =
          await _dio.get(Constants.BASE_URL + '/api/v1/business',
              options: Options(
                contentType: 'application/json',
                headers: {'Authorization': "Bearer $token"},
              ),
              queryParameters: {
            'title': title,
            'category': category,
          });
      return BusinessResponse.fromJson(_response.data);
    } on DioError catch (error) {
      return BusinessResponse.fromJson(error.response!.data);
    }
  }
}
