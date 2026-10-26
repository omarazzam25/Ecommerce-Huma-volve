import 'package:dartz/dartz.dart';
import 'package:ecommerce_app_huma_volve/features/home/domain/entites/category_entity.dart';

import '../../../../core/error/failures.dart';
import '../entites/products_entity.dart';

abstract class HomeRepository {

  Future<Either<Failures,List<CategoryEntity>>> getCategories();

  Future<Either<Failures,List<ProductsEntity>>> getProductsByCategory(int categoryId);

  Future<Either<Failures,List<ProductsEntity>>> getProducts();
}