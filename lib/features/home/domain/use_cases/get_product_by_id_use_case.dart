import '../../../../core/error/failures.dart';
import '../entites/products_entity.dart';
import '../repository/home_repository.dart';
import 'package:dartz/dartz.dart';

class GetProductByIdUseCase {
  final HomeRepository repository;

  GetProductByIdUseCase({
    required this.repository,
  });

  Future<Either<Failures, ProductsEntity>> call(int productId) {
    return repository.getProductById(productId);
  }
}