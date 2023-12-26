import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mini_project2/application/home_bloc/home_state.dart';
import 'package:mini_project2/domain/api/api_calling/api_functions.dart';
import 'package:mini_project2/domain/models/user_model.dart';

class HomeCubit extends Cubit<HomeState>{
  HomeCubit() : super(HomeInitialState()){
    emit(HomeProductsLoadingState());
    fetchProducts();
  }

  void fetchProducts()async{
    try{
      // print(await fetchAllProducts());
      List<UserModel> allProducts = await fetchAllData();
      emit(HomeProductsLoadedState(allProducts: allProducts));
    }catch(e){
      emit(HomeProductsLoadingFailedState(errorMessage: e.toString()));
    }

  }
}