import 'category_entity.dart';

class ProductsEntity {
  final int? id;
  final String? title;
  final String? slug;
  final int? price;
  final String? description;
  final CategoryEntity? category;
  final List<String>? images;
  final String? creationAt;
  final String? updatedAt;

  const ProductsEntity({
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
}