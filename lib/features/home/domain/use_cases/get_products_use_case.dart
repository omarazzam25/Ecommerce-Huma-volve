import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';
import '../entites/products_entity.dart';
import '../repository/home_repository.dart';

class GetProductsUseCase {
  final HomeRepository homeRepository;

  GetProductsUseCase({required this.homeRepository});

  Future<Either<Failures, List<ProductsEntity>>> call() {
    return homeRepository.getProducts();
  }
}