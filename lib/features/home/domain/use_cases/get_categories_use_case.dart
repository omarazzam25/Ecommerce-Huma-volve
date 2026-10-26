import 'package:dartz/dartz.dart';
import 'package:ecommerce_app_huma_volve/features/home/domain/repository/home_repository.dart';

import '../../../../core/error/failures.dart';
import '../entites/category_entity.dart';

class GetCategoriesUseCase {
  HomeRepository homeRepository;
  GetCategoriesUseCase({required this.homeRepository});
  Future<Either<Failures,List<CategoryEntity>>> call(){
    return homeRepository.getCategories();
  }
}

