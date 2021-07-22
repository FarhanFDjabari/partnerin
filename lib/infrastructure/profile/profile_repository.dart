import 'dart:io';

import 'package:dio/dio.dart';
import 'package:partnerin/model/media/media_upload_response.dart';
import 'package:partnerin/model/profile/change_password_request.dart';
import 'package:partnerin/model/profile/change_password_response.dart';
import 'package:partnerin/model/profile/user_request.dart';
import 'package:partnerin/model/profile/user_response.dart';

import '../../constants.dart';

class ProfileRepository {
  Dio _dio = Dio();

  Future<UserResponse> getUserInfo(String token) async {
    try {
      Response _response = await _dio.get(
        Constants.BASE_URL + '/api/v1/user',
        options: Options(
          headers: {'Authorization': "Bearer $token"},
        ),
      );
      return UserResponse.fromJson(_response.data);
    } on DioError catch (error) {
      print(error.response);
      return UserResponse.fromJson(error.response!.data);
    }
  }

  Future<UserResponse> updateProfile(
      String token, UserRequest userRequest) async {
    try {
      Response _response = await _dio.put(
        Constants.BASE_URL + '/api/v1/user',
        data: userRequest.toJson(),
        options: Options(
          headers: {'Authorization': "Bearer $token"},
        ),
      );
      return UserResponse.fromJson(_response.data);
    } on DioError catch (error) {
      return UserResponse.fromJson(error.response!.data);
    }
  }

  Future<MediaUploadResponse> uploadProfilePicture(
      String token, File file) async {
    try {
      String fileName = file.path.split('/').last;
      FormData formData = FormData.fromMap({
        "file": await MultipartFile.fromFile(
          file.path,
          filename: fileName,
        ),
      });

      Response _response = await _dio.post(
        Constants.BASE_URL + '/api/v1/user/foto-profile',
        data: formData,
        options: Options(
          headers: {
            'Authorization': "Bearer $token",
          },
        ),
      );
      return MediaUploadResponse.fromJson(_response.data);
    } on DioError catch (error) {
      return MediaUploadResponse.fromJson(error.response!.data);
    }
  }

  Future<MediaUploadResponse> uploadPhotoKtp(String token, File file) async {
    try {
      String fileName = file.path.split('/').last;
      FormData formData = FormData.fromMap({
        "file": await MultipartFile.fromFile(
          file.path,
          filename: fileName,
        ),
      });

      Response _response = await _dio.post(
        Constants.BASE_URL + '/api/v1/user/foto-ktp',
        data: formData,
        options: Options(
          headers: {
            'Authorization': "Bearer $token",
          },
        ),
      );
      return MediaUploadResponse.fromJson(_response.data);
    } on DioError catch (error) {
      return MediaUploadResponse.fromJson(error.response!.data);
    }
  }

  Future<ChangePasswordResponse> changePassword(
      String token, ChangePasswordRequest changePasswordRequest) async {
    try {
      Response _response = await _dio.post(
        Constants.BASE_URL + '/api/v1/user/change-password',
        data: changePasswordRequest.toJson(),
      );
      return ChangePasswordResponse.fromJson(_response.data);
    } on DioError catch (error) {
      return ChangePasswordResponse.fromJson(error.response!.data);
    }
  }
}
