import 'package:mock_product_mobile/data/vos/category_vos/category_vo.dart';
import 'package:mock_product_mobile/data/vos/product_vos/product_vo.dart';

abstract class StaticDataModel {
  Future<List<CategoryVO>?> getAllCategoriesList();

  Future<List<ProductVO>?> getProductListByCategory({required String slug});
}
