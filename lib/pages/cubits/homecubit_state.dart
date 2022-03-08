part of 'homecubit_cubit.dart';

// Classes that define the diferents states of the cubit

@immutable
abstract class HomeCubitState {}

class HomeCubitInitial extends HomeCubitState {}

class HomeCubitLoadingState extends HomeCubitState {}

class HomeCubitLoadedState extends HomeCubitState {
  List<Product> products;

  HomeCubitLoadedState(this.products);
}

// This define HTTP server side Error
class HomeCubitErrorState extends HomeCubitState {
  // Exception error;

  // HomeCubitErrorState(this.error);
}
