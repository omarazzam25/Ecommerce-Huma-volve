
import 'package:bloc/bloc.dart';
import 'package:flutter/foundation.dart';

import '../../domain/entites/category_entity.dart';
import '../../domain/entites/products_entity.dart';
import '../../domain/use_cases/get_categories_use_case.dart';
import '../../domain/use_cases/get_products_by_category_use_case.dart';
import '../../domain/use_cases/get_products_use_case.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  final GetProductsUseCase getProductsUseCase;
  final GetCategoriesUseCase getCategoriesUseCase;
  final GetProductsByCategoryUseCase getProductsByCategoryUseCase;

  HomeCubit({
    required this.getProductsUseCase,
    required this.getCategoriesUseCase,
    required this.getProductsByCategoryUseCase,
  }) : super(HomeInitial());

  List<ProductsEntity> products = [];
  List<CategoryEntity> categories = [];

  Future<void> getProducts() async {
    emit(ProductsLoadingState());

    final result = await getProductsUseCase.call();

    result.fold(
          (failure) {
        debugPrint(failure.errMessage);
        emit(ProductsFieldState());
      },
          (productsList) {
        products = productsList;
        emit(ProductsSuccessState());
      },
    );
  }

  Future<void> getProductsByCategory(int categoryId) async {
    emit(ProductsLoadingState());

    final result = await getProductsByCategoryUseCase.call(categoryId);

    result.fold(
          (failure) {
        debugPrint(failure.errMessage);
        emit(ProductsFieldState());
      },
          (productsList) {
        products = productsList;
        emit(ProductsSuccessState());
      },
    );
  }

  Future<void> getCategories() async {
    emit(CategoryLoadingState());

    final result = await getCategoriesUseCase.call();

    result.fold(
          (failure) {
        debugPrint(failure.errMessage);
        emit(CategoryFieldState());
      },
          (categoriesList) {
        categories = categoriesList;
        emit(CategorySuccessState());
      },
    );
  }
}
