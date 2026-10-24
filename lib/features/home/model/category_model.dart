class CategoryModel {
  CategoryModel({
    this.id,
    this.name,


  });

  CategoryModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];

  }

  int? id;
  String? name;


}