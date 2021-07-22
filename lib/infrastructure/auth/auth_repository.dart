import 'package:dio/dio.dart';
import 'package:partnerin/constants.dart';
import 'package:partnerin/model/auth/login_request.dart';
import 'package:partnerin/model/auth/login_response.dart';
import 'package:partnerin/model/auth/logout_request.dart';
import 'package:partnerin/model/auth/logout_response.dart';
import 'package:partnerin/model/auth/register_request.dart';
import 'package:partnerin/model/auth/register_response.dart';

class AuthRepository {
  Dio _dio = Dio();

  Future<LoginResponse> signInUserWithEmailAndPassword(
      {required LoginRequest loginRequest}) async {
    try {
      Response _response = await _dio.post(Constants.BASE_URL + '/api/v1/login',
          data: loginRequest.toJson());
      LoginResponse _loginResponse = LoginResponse.fromJson(_response.data);
      return _loginResponse;
    } on DioError catch (error) {
      LoginResponse _errorLoginResponse =
          LoginResponse.fromJson(error.response?.data);
      return _errorLoginResponse;
    }
  }

  Future<RegisterResponse> createNewUser(
      {required RegisterRequest registerRequest}) async {
    try {
      Response _response = await _dio.post(
          Constants.BASE_URL + '/api/v1/register',
          data: registerRequest.toJson());
      final _result = _response.data;

      return RegisterResponse.fromJson(_result);
    } on DioError catch (error) {
      return RegisterResponse.fromJson(error.response?.data);
    }
  }

  Future<LogoutResponse> logout({required LogoutRequest logoutRequest}) async {
    try {
      Response _response = await _dio.post(
        Constants.BASE_URL + '/api/v1/user/logout',
        options: Options(
          headers: {
            'Authorization': "Bearer ${logoutRequest.token}",
          },
        ),
      );
      return LogoutResponse.fromJson(_response.data);
    } on DioError catch (error) {
      return LogoutResponse.fromJson(error.response!.data);
    }
  }
}
