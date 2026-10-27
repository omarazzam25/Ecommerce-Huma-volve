import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

import '../../../../core/error/failures.dart';
import '../../domain/entites/category_entity.dart';
import '../../domain/entites/products_entity.dart';
import '../../domain/repository/home_repository.dart';
import '../data_source/home_remote_data_source.dart';

class HomeRepositoryImpl implements HomeRepository {
  final HomeRemoteDataSource remoteDataSource;

  HomeRepositoryImpl({
    required this.remoteDataSource,
  });
  @override
  Future<Either<Failures, List<ProductsEntity>>> getProducts({
    required int limit,
    required int offset,
  }) async {
    try {
      final products = await remoteDataSource.getProducts(
        limit: limit,
        offset: offset,
      );

      return Right(
        products.map((product) => product.toEntity()).toList(),
      );
    } on DioException catch (error) {
      return Left(ServerFailure.fromDioError(error));
    } catch (error) {
      return Left(ServerFailure('Unexpected error: $error'));
    }
  }

  @override
  Future<Either<Failures, List<ProductsEntity>>> getProductsByCategory(
      int categoryId, {
        required int limit,
        required int offset,
      }) async {
    try {
      final products = await remoteDataSource.getProductsByCategory(
        categoryId,
        limit: limit,
        offset: offset,
      );

      return Right(
        products.map((product) => product.toEntity()).toList(),
      );
    } on DioException catch (error) {
      return Left(ServerFailure.fromDioError(error));
    } catch (error) {
      return Left(ServerFailure('Unexpected error: $error'));
    }
  }

  @override
  Future<Either<Failures, List<CategoryEntity>>> getCategories() async {
    try {
      final categories = await remoteDataSource.getCategories();

      final categoriesEntities = categories
          .map((category) => category.toEntity())
          .toList();

      return Right(categoriesEntities);
    } on DioException catch (error) {
      return Left(ServerFailure.fromDioError(error));
    } catch (error) {
      return Left(
        ServerFailure('Unexpected error: $error'),
      );
    }
  }

  @override
  Future<Either<Failures, ProductsEntity>> getProductById(
      int productId,
      ) async {
    try {
      final product = await remoteDataSource.getProductById(productId);

      return Right(product.toEntity());
    } on DioException catch (e) {
      return Left(ServerFailure.fromDioError(e));
    } catch (e) {
      return Left(ServerFailure('Unexpected error: $e'));
    }
  }
}