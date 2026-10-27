import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';
import '../entites/products_entity.dart';
import '../repository/home_repository.dart';

class GetProductsByCategoryUseCase {
  final HomeRepository repository;

  GetProductsByCategoryUseCase({
    required this.repository,
  });

  Future<Either<Failures, List<ProductsEntity>>> call(
      int categoryId, {
        required int limit,
        required int offset,
      }) {
    return repository.getProductsByCategory(
      categoryId,
      limit: limit,
      offset: offset,
    );
  }
}