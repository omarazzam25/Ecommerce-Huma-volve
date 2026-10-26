import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';
import '../entites/products_entity.dart';
import '../repository/home_repository.dart';

class GetProductsByCategoryUseCase {
  final HomeRepository homeRepository;

  GetProductsByCategoryUseCase({required this.homeRepository});

  Future<Either<Failures, List<ProductsEntity>>> call(
      int categoryId,
      ) {
    return homeRepository.getProductsByCategory(categoryId);
  }
}