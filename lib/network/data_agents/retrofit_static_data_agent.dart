import 'package:mock_product_mobile/data/vos/category_vos/category_vo.dart';

abstract class RetrofitStaticDataAgent {
  Future<List<CategoryVO>?> getAllCategories();
}
