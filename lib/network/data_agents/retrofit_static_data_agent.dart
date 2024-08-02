import 'package:mock_product_mobile/data/vos/category_vos/category_vo.dart';
import 'package:mock_product_mobile/data/vos/product_vos/product_vo.dart';

abstract class RetrofitStaticDataAgent {
  Future<List<CategoryVO>?> getAllCategories();
  Future<List<ProductVO>?> getProductListByCategory({required String slug});
}
