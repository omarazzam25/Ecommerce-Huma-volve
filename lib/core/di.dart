import 'package:get_it/get_it.dart';

import '../features/home/data/repository/home_repository.dart';
import '../features/home/presentation/home_cubit/home_cubit.dart';
import 'network/api_clint.dart';

import '../features/home/data/data_source/home_remote_data_source.dart';

import '../features/home/domain/repository/home_repository.dart';
import '../features/home/domain/use_cases/get_categories_use_case.dart';
import '../features/home/domain/use_cases/get_products_use_case.dart';
import '../features/home/domain/use_cases/get_products_by_category_use_case.dart';

final getIt = GetIt.instance;

void setupDependencies() {

  getIt.registerLazySingleton<ApiClint>(
        () => ApiClint(),
  );


  getIt.registerLazySingleton<HomeRemoteDataSource>(
        () => HomeRemoteDataSourceImpl(
      apiClint: getIt<ApiClint>(),
    ),
  );


  getIt.registerLazySingleton<HomeRepository>(
        () => HomeRepositoryImpl(
      remoteDataSource: getIt<HomeRemoteDataSource>(),
    ),
  );


  getIt.registerLazySingleton<GetProductsUseCase>(
        () => GetProductsUseCase(
          homeRepository: getIt<HomeRepository>(),
    ),
  );

  getIt.registerLazySingleton<GetCategoriesUseCase>(
        () => GetCategoriesUseCase(
          homeRepository: getIt<HomeRepository>(),
    ),
  );

  getIt.registerLazySingleton<GetProductsByCategoryUseCase>(
        () => GetProductsByCategoryUseCase(
          homeRepository: getIt<HomeRepository>(),
    ),
  );


  getIt.registerFactory<HomeCubit>(
        () => HomeCubit(
      getProductsUseCase: getIt<GetProductsUseCase>(),
      getCategoriesUseCase: getIt<GetCategoriesUseCase>(),
      getProductsByCategoryUseCase:
      getIt<GetProductsByCategoryUseCase>(),
    ),
  );
}