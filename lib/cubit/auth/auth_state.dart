part of 'auth_cubit.dart';

@immutable
abstract class AuthState {}

class AuthInitial extends AuthState {}

class AuthLoading extends AuthState {}

class AuthLoginSuccess extends AuthState {
  final LoginResult? loginResult;
  AuthLoginSuccess(this.loginResult);
}

class AuthError extends AuthState {
  final String errorMessage;
  AuthError(this.errorMessage);
}

class AuthLocalSaved extends AuthState {
  final String token;
  final int role;
  AuthLocalSaved(this.token, this.role);
}

class AuthLocalLoadSuccess extends AuthState {
  final String token;
  final int role;
  AuthLocalLoadSuccess(this.token, this.role);
}

class AuthRegisterSuccess extends AuthState {
  final RegisterResult registerResult;
  AuthRegisterSuccess(this.registerResult);
}

class AuthOwnerStatusLoadSuccess extends AuthState {
  final bool isVerified;
  AuthOwnerStatusLoadSuccess(this.isVerified);
}

class AuthOwnerStatusLoadError extends AuthState {
  final String errorMessage;
  AuthOwnerStatusLoadError(this.errorMessage);
}

class AuthLogoutSuccess extends AuthState {
  final bool isLogout;
  AuthLogoutSuccess(this.isLogout);
}
