import 'package:bloc/bloc.dart';
import 'package:ecommerce_app_huma_volve/core/constants/api_endpoints.dart';
import 'package:ecommerce_app_huma_volve/core/network/api_clint.dart';
import 'package:ecommerce_app_huma_volve/features/home/model/category_model.dart';
import 'package:ecommerce_app_huma_volve/features/home/model/products_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:meta/meta.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeInitial());

  final ApiClint apiClint = ApiClint();

  List<ProductsModel> products = [];

  Future<void> getProducst() async {
    emit(ProductsLoadingState());

    try {
      final response = await apiClint.dio.get(ApiEndpoints.productsEndPoint);
      print('Response Status Code: ${response.statusCode}');
      print('Response Data: ${response.data}');

      if (response.statusCode == 200) {
        products = (response.data as List)
            .map((e) => ProductsModel.fromJson(e))
            .toList();
        emit(ProductsSuccessState());
        print('Products Count: ${products.length}');
      } else {
        print('Request failed: ${response.statusCode}');
        emit(ProductsFieldState());
      }
    } catch (e) {
      print('Request failed: $e');
      emit(ProductsFieldState());
    }
  }

  Future<void> getProductsByCategory(int categoryId) async {
    emit(ProductsLoadingState());

    try {
      final response = await apiClint.dio.get(
        ApiEndpoints.categoryProductsEndPoint(categoryId),
      );

      if (response.statusCode == 200) {
        products = (response.data as List)
            .map((e) => ProductsModel.fromJson(e))
            .toList();

        emit(ProductsSuccessState());
      } else {
        emit(ProductsFieldState());
      }
    } catch (e) {
      debugPrint('Error fetching category products: $e');
      emit(ProductsFieldState());
    }
  }

  List<CategoryModel> categories = [];

  Future<void> getCategories() async {
    emit(CategoryLoadingState());
    try {
      final response = await apiClint.dio.get(ApiEndpoints.categoriesEndPoint);

      if (response.statusCode == 200) {
        categories = (response.data as List)
            .map((e) => CategoryModel.fromJson(e))
            .toList();

        emit(ProductsSuccessState());
      } else {
        emit(ProductsFieldState());
      }
    } catch (e) {
      debugPrint('Categories error: $e');
      emit(ProductsFieldState());
    }
  }
}
