import 'package:mock_product_mobile/data/vos/category_vos/category_vo.dart';

abstract class StaticDataModel{
  Future<List<CategoryVO>?> getAllCategoriesList();
}