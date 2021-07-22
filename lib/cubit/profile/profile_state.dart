part of 'profile_cubit.dart';

@immutable
abstract class ProfileState {}

class ProfileInitial extends ProfileState {}

class ProfileLoading extends ProfileState {}

class ChangePasswordSuccess extends ProfileState {}

class ProfileLoadSuccess extends ProfileState {
  final UserResult user;
  ProfileLoadSuccess(this.user);
}

class ProfileUpdateSuccess extends ProfileState {
  final UserResult user;
  ProfileUpdateSuccess(this.user);
}

class ProfilePhotoUpdateSuccess extends ProfileState {}

class ProfileLoadError extends ProfileState {
  final String errorMessage;
  ProfileLoadError(this.errorMessage);
}

class ProfileUpdateError extends ProfileState {
  final String errorMessage;
  ProfileUpdateError(this.errorMessage);
}
