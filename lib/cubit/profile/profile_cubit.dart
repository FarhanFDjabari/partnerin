import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:partnerin/infrastructure/profile/profile_repository.dart';
import 'package:partnerin/model/profile/change_password_request.dart';
import 'package:partnerin/model/profile/user_request.dart';
import 'package:partnerin/model/profile/user_response.dart';

part 'profile_state.dart';

class ProfileCubit extends Cubit<ProfileState> {
  ProfileCubit() : super(ProfileInitial());
  ProfileRepository _profileRepository = ProfileRepository();

  void getUser(String token) async {
    emit(ProfileLoading());
    try {
      final result = await _profileRepository.getUserInfo(token);
      print(result.result!.toJson());
      if (result.status == "success") {
        emit(ProfileLoadSuccess(result.result!));
      } else {
        emit(ProfileLoadError(result.result.toString()));
      }
    } catch (error) {
      emit(ProfileLoadError("$error"));
    }
  }

  void updateUser(String token, UserRequest userRequest) async {
    emit(ProfileLoading());
    try {
      final result = await _profileRepository.updateProfile(token, userRequest);
      if (result.status == "success") {
        emit(ProfileLoadSuccess(result.result!));
      } else {
        emit(ProfileUpdateError("Update profil error: \n${result.result!}"));
      }
    } catch (error) {
      emit(ProfileUpdateError("$error"));
    }
  }

  void uploadProfilePhoto(String token, File file) async {
    emit(ProfileLoading());
    try {
      final result = await _profileRepository.uploadProfilePicture(token, file);
      if (result.status == "success") {
        emit(ProfilePhotoUpdateSuccess());
      } else {
        emit(ProfileUpdateError(result.result!));
      }
    } catch (error) {
      emit(ProfileUpdateError("$error"));
    }
  }

  void uploadPhotoKtp(String token, File file) async {
    emit(ProfileLoading());
    try {
      final result = await _profileRepository.uploadPhotoKtp(token, file);
      if (result.status == "success") {
        emit(ProfilePhotoUpdateSuccess());
      } else {
        emit(ProfileUpdateError(result.result!));
      }
    } catch (error) {
      emit(ProfileUpdateError("$error"));
    }
  }

  void changePassword(
      String token, ChangePasswordRequest changePasswordRequest) async {
    emit(ProfileLoading());
    try {
      final result =
          await _profileRepository.changePassword(token, changePasswordRequest);
      if (result.status == "success") {
        emit(ChangePasswordSuccess());
      } else {
        emit(ProfileUpdateError("Change password error: \n${result.result!}"));
      }
    } catch (error) {
      emit(ProfileUpdateError("$error"));
    }
  }
}
