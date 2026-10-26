part of 'home_cubit.dart';

@immutable
sealed class HomeState {}

final class HomeInitial extends HomeState {}

final class ProductsLoadingState extends HomeState {}

final class ProductsSuccessState extends HomeState {}

final class ProductsFieldState extends HomeState {}

final class CategoryLoadingState extends HomeState {}

final class CategorySuccessState extends HomeState {}

final class CategoryFieldState extends HomeState {}


