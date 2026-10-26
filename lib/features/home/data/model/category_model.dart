import '../../domain/entites/category_entity.dart';

class CategoryModel {
  final int? id;
  final String? name;


  const CategoryModel({
    this.id,
    this.name,

  });

  factory CategoryModel.fromJson(Map<String, dynamic> json) {
    return CategoryModel(
      id: json['id'] as int?,
      name: json['name'] as String?,

    );
  }

  CategoryEntity toEntity() {
    return CategoryEntity(
      id: id,
      name: name,

    );
  }
}