import 'package:bloc/bloc.dart';
import 'package:get_storage/get_storage.dart';
import 'package:meta/meta.dart';
import 'package:partnerin/infrastructure/auth/auth_repository.dart';
import 'package:partnerin/model/auth/login_request.dart';
import 'package:partnerin/model/auth/login_response.dart';
import 'package:partnerin/model/auth/logout_request.dart';
import 'package:partnerin/model/auth/register_request.dart';
import 'package:partnerin/model/auth/register_response.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(AuthInitial());
  AuthRepository authRepository = AuthRepository();

  void login(LoginRequest loginRequest) async {
    emit(AuthLoading());
    try {
      final result = await authRepository.signInUserWithEmailAndPassword(
          loginRequest: loginRequest);
      if (result.status == 'success')
        emit(AuthLoginSuccess(result.result));
      else
        emit(AuthError('Login error: \nemail or password incorrect'));
    } catch (error) {
      emit(AuthError('Login error: \n$error'));
    }
  }

  void register(RegisterRequest registerRequest) async {
    emit(AuthLoading());
    try {
      final result =
          await authRepository.createNewUser(registerRequest: registerRequest);
      if (result.status == 'success')
        emit(AuthRegisterSuccess(result.result!));
      else {
        emit(AuthError('Register error: \n${result.status}'));
      }
    } catch (error) {
      emit(AuthError('Register error: \n$error'));
    }
  }

  void ownerRegister() async {}

  void saveToLocal(LoginResult loginResult) async {
    emit(AuthLoading());
    try {
      await GetStorage().write('token', loginResult.token);
      await GetStorage().write('role', loginResult.user!.role);
      emit(AuthLocalSaved(loginResult.token!, loginResult.user!.role!));
    } catch (error) {
      emit(AuthError("error save to local: \n${error.toString()}"));
    }
  }

  void saveRegisToLocal(RegisterResult registerResult) async {
    emit(AuthLoading());
    try {
      await GetStorage().write('token', registerResult.token);
      await GetStorage().write('role', registerResult.user!.role);
      await GetStorage()
          .write('verified', registerResult.user!.emailVerifiedAt == null);
      emit(AuthLocalSaved(registerResult.token!, registerResult.user!.role!));
    } catch (error) {
      emit(AuthError("error save to local: \n${error.toString()}"));
    }
  }

  void loadFromLocal() async {
    emit(AuthLoading());
    try {
      final _data = await GetStorage().read('token');
      final _data2 = await GetStorage().read('role');
      emit(AuthLocalLoadSuccess(_data, _data2));
    } catch (error) {
      emit(AuthError('Local data not found: \n${error.toString()}'));
    }
  }

  void loadOwnerRegisStatus() async {
    emit(AuthLoading());
    try {
      final _data = await GetStorage().read('verified');
      emit(AuthOwnerStatusLoadSuccess(_data));
    } catch (error) {
      emit(AuthOwnerStatusLoadError(
          'Local data not found: \n${error.toString()}'));
    }
  }

  void logout(LogoutRequest logoutRequest) async {
    emit(AuthLoading());
    try {
      final _data = await authRepository.logout(logoutRequest: logoutRequest);
      if (_data.status == 'success') {
        await GetStorage().erase();
        emit(AuthLogoutSuccess(_data.result!));
      } else {
        emit(AuthError('Logout error: \n${_data.result}'));
      }
    } catch (error) {
      emit(AuthError('Logout error: \n${error.toString()}'));
    }
  }
}
