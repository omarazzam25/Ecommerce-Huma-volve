class ApiEndpoints {

  static final String loginEndPoint = "auth/login";
  static final String signupEndPoint = "users";
  static final String productsEndPoint = "products";
  static final String categoriesEndPoint = "categories";
  static String categoryProductsEndPoint(int categoryId) {
    return '/categories/$categoryId/products';
  }
}