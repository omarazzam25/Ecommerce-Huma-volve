import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';
import '../entites/products_entity.dart';
import '../repository/home_repository.dart';

class GetProductsUseCase {
  final HomeRepository repository;

  GetProductsUseCase({
    required this.repository,
  });

  Future<Either<Failures, List<ProductsEntity>>> call({
    required int limit,
    required int offset,
  }) {
    return repository.getProducts(
      limit: limit,
      offset: offset,
    );
  }
}