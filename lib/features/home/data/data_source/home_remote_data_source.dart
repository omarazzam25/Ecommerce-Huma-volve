

import '../../../../core/constants/api_endpoints.dart';
import '../../../../core/network/api_clint.dart';
import '../model/category_model.dart';
import '../model/products_model.dart';


abstract class HomeRemoteDataSource {
  Future<List<ProductsModel>> getProducts();

  Future<List<ProductsModel>> getProductsByCategory(int categoryId);

  Future<List<CategoryModel>> getCategories();
}

class HomeRemoteDataSourceImpl implements HomeRemoteDataSource {
  final ApiClint apiClint;

  HomeRemoteDataSourceImpl({required this.apiClint});

  @override
  Future<List<ProductsModel>> getProducts() async {
    final response = await apiClint.dio.get(
      ApiEndpoints.productsEndPoint,
    );

    return (response.data as List)
        .map((json) => ProductsModel.fromJson(json))
        .toList();
  }

  @override
  Future<List<ProductsModel>> getProductsByCategory(
      int categoryId,
      ) async {
    final response = await apiClint.dio.get(
      ApiEndpoints.categoryProductsEndPoint(categoryId),
    );

    return (response.data as List)
        .map((json) => ProductsModel.fromJson(json))
        .toList();
  }

  @override
  Future<List<CategoryModel>> getCategories() async {
    final response = await apiClint.dio.get(
      ApiEndpoints.categoriesEndPoint,
    );

    return (response.data as List)
        .map((json) => CategoryModel.fromJson(json))
        .toList();
  }
}