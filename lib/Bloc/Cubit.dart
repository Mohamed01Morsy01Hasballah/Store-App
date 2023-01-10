import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:store_app/Bloc/States.dart';
import 'package:store_app/Network/DioHelper.dart';
import 'package:store_app/model/ProductModel.dart';

class StoreCubit extends Cubit<StoreStates>{
  StoreCubit():super(initialState());
  static StoreCubit get(context)=>BlocProvider.of(context);
  ProductModel? product;
  List<dynamic> products=[];
  void GetProduct(){
    emit(GetProductLoadingState());
    DioHelper.getData(
        url: 'products'
    ).then((value) {
      emit(GetProductSucessState());
      value.data.forEach((element)
      {
        product=ProductModel.fromJson(element);
        products.add(product);
      });
    }).catchError((Error){
      emit(GetProductErrorState());
      print('get product ${Error.toString()}');
    });
  }
  CategoryModel? category;
  List<dynamic> Numcategory=[];
  void GetCategory(){
    DioHelper.getData(
        url: 'categories'
    ).then((value) {
      emit(GetCategorySucessState());
      value.data.forEach((element)
      {
        category=CategoryModel.fromJson(element);
        Numcategory.add(category);
        print(category!.image);
        print(category!.name);
      });
    }).catchError((Error){
      emit(GetCategoryErrorState());
      print('get product ${Error.toString()}');
    });
  }

}