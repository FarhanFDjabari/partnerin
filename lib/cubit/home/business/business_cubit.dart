import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:partnerin/infrastructure/home/business_repository.dart';
import 'package:partnerin/model/home/business_response.dart';
import 'package:partnerin/model/home/detail_business_response.dart';

part 'business_state.dart';

class BusinessCubit extends Cubit<BusinessState> {
  BusinessCubit() : super(BusinessInitial());
  BusinessRepository _businessRepository = BusinessRepository();

  void getAllBusiness(String token) async {
    emit(BusinessLoading());
    try {
      final result = await _businessRepository.getAllBusiness(token: token);
      if (result.status == 'success') {
        emit(BusinessLoadSuccess(result.result!.data!));
      } else {
        emit(BusinessLoadError("Fetch business failed: \n${result.result}"));
      }
    } catch (error) {
      emit(BusinessLoadError("Fetch business error: \n$error"));
    }
  }

  void getBusinessByCategory(String token, String category) async {
    emit(BusinessLoading());
    try {
      final result = await _businessRepository.getAllBusinessByCategory(
          token: token, category: category);
      if (result.status == 'success') {
        emit(BusinessLoadSuccess(result.result!.data!));
      } else {
        emit(BusinessLoadError("Fetch business failed: \n${result.result}"));
      }
    } catch (error) {
      emit(BusinessLoadError("Fetch business failed: \n$error"));
    }
  }

  void getBusinessById(String token, String id) async {
    emit(BusinessLoading());
    try {
      final result = await _businessRepository.getBusinessById(token, id);
      if (result.status == "success") {
        emit(DetailBusinessLoadSuccess(result.result!));
      } else {
        emit(DetailBusinessLoadError(
            "Load business error: \n${result.result!}"));
      }
    } catch (error) {
      emit(DetailBusinessLoadError("$error"));
    }
  }

  void getBusinessByTitle(String token, String title) async {
    emit(BusinessLoading());
    try {
      final result = await _businessRepository.getAllBusinessByTitle(
          token: token, title: title);
      if (result.status == 'success') {
        emit(BusinessLoadSuccess(result.result!.data!));
      } else {
        emit(BusinessLoadError("Fetch business failed: \n${result.result}"));
      }
    } catch (error) {
      emit(BusinessLoadError("Fetch business failed: \n$error"));
    }
  }

  void getBusinessByTitleCateogory(
      String token, String title, String category) async {
    emit(BusinessLoading());
    try {
      final result = await _businessRepository.getAllBusinessByTitleCategory(
          token: token, title: title, category: category);
      if (result.status == 'success') {
        emit(BusinessLoadSuccess(result.result!.data!));
      } else {
        emit(BusinessLoadError("Fetch business failed: \n${result.result}"));
      }
    } catch (error) {
      emit(BusinessLoadError("Fetch business failed: \n$error"));
    }
  }
}
