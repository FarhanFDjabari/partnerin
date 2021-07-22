part of 'business_cubit.dart';

@immutable
abstract class BusinessState {}

class BusinessInitial extends BusinessState {}

class BusinessLoading extends BusinessState {}

class DetailBusinessLoadSuccess extends BusinessState {
  final DetailBusinessResult businessResult;
  DetailBusinessLoadSuccess(this.businessResult);
}

class BusinessLoadSuccess extends BusinessState {
  final List<BusinessData> businessData;
  BusinessLoadSuccess(this.businessData);
}

class BusinessLoadError extends BusinessState {
  final String errorMessage;
  BusinessLoadError(this.errorMessage);
}

class DetailBusinessLoadError extends BusinessState {
  final String errorMessage;
  DetailBusinessLoadError(this.errorMessage);
}
