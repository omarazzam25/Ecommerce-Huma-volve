import '../../domain/entites/products_entity.dart';
import 'category_model.dart';

class ProductsModel {
  final int? id;
  final String? title;
  final String? slug;
  final int? price;
  final String? description;
  final CategoryModel? category;
  final List<String>? images;
  final String? creationAt;
  final String? updatedAt;

  const ProductsModel({
    this.id,
    this.title,
    this.slug,
    this.price,
    this.description,
    this.category,
    this.images,
    this.creationAt,
    this.updatedAt,
  });

  factory ProductsModel.fromJson(Map<String, dynamic> json) {
    return ProductsModel(
      id: json['id'] as int?,
      title: json['title'] as String?,
      slug: json['slug'] as String?,
      price: json['price'] as int?,
      description: json['description'] as String?,
      category: json['category'] != null
          ? CategoryModel.fromJson(
        Map<String, dynamic>.from(json['category']),
      )
          : null,
      images: (json['images'] as List<dynamic>?)
          ?.map((image) => image.toString())
          .toList() ?? [],
      creationAt: json['creationAt'] as String?,
      updatedAt: json['updatedAt'] as String?,
    );
  }

  ProductsEntity toEntity() {
    return ProductsEntity(
      id: id,
      title: title,
      slug: slug,
      price: price,
      description: description,
      category: category?.toEntity(),
      images: images,
      creationAt: creationAt,
      updatedAt: updatedAt,
    );
  }
}