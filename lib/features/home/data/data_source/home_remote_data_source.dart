

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

import '../../../../core/constants/api_endpoints.dart';
import '../../../../core/error/failures.dart';
import '../../../../core/network/api_clint.dart';
import '../../domain/entites/products_entity.dart';
import '../model/category_model.dart';
import '../model/products_model.dart';


abstract class HomeRemoteDataSource {
  Future<List<ProductsModel>> getProducts(
      {required int limit,
    required int offset,}
      );

  Future<List<ProductsModel>> getProductsByCategory(int categoryId, {
    required int limit,
    required int offset,});

  Future<List<CategoryModel>> getCategories();
}

class HomeRemoteDataSourceImpl implements HomeRemoteDataSource {
  final ApiClint apiClint;

  HomeRemoteDataSourceImpl({required this.apiClint});

  @override
  Future<List<ProductsModel>> getProducts({
    required int limit,
    required int offset,
  }) async {
    final response = await apiClint.dio.get(
      ApiEndpoints.productsEndPoint,
      queryParameters: {
        'limit': limit,
        'offset': offset,
      },
    );

    final List<dynamic> data = response.data as List<dynamic>;

    return data
        .map(
          (json) => ProductsModel.fromJson(
        Map<String, dynamic>.from(json),
      ),
    )
        .toList();
  }




  @override
  Future<List<ProductsModel>> getProductsByCategory(
      int categoryId, {
        required int limit,
        required int offset,
      }) async {
    final response = await apiClint.dio.get(
      ApiEndpoints.categoryProductsEndPoint(categoryId),
      queryParameters: {
        'limit': limit,
        'offset': offset,
      },
    );

    final List<dynamic> data = response.data as List<dynamic>;

    return data
        .map(
          (json) => ProductsModel.fromJson(
        Map<String, dynamic>.from(json),
      ),
    )
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