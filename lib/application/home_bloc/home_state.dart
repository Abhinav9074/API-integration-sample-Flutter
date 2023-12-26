import 'package:mini_project2/domain/models/user_model.dart';

abstract class HomeState{}

class HomeInitialState extends HomeState{}

class HomeProductsLoadingState extends HomeState{}

class HomeProductsLoadedState extends HomeState{
  final List<UserModel> allProducts;

  HomeProductsLoadedState({required this.allProducts});
}

class HomeProductsLoadingFailedState extends HomeState{
  final String errorMessage;

  HomeProductsLoadingFailedState({required this.errorMessage});
  
}