// To get data from network need to set up endpoint and base url constants
class ApiConstants {
  static const String kLiveUrl = "https://dummyjson.com/products";
  static const String kEndPointGetCategories =
      "https://dummyjson.com/products/categories";
  static const String kEndPointGetProductList =
      "https://dummyjson.com/products/category/{category}";

  static const String kParamCategory = "category";
}
