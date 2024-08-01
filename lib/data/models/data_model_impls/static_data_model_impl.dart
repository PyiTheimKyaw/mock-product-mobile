import 'package:mock_product_mobile/data/models/data_models/static_data_model.dart';
import 'package:mock_product_mobile/data/vos/category_vos/category_vo.dart';
import 'package:mock_product_mobile/data/vos/product_vos/product_vo.dart';
import 'package:mock_product_mobile/network/data_agents/retrofit_static_data_agent.dart';
import 'package:mock_product_mobile/network/data_agents_impls/retrofit_static_data_agent_impl.dart';

class StaticDataModelImpl extends StaticDataModel {
  static StaticDataModelImpl? instance;

  factory StaticDataModelImpl() {
    instance ??= StaticDataModelImpl._internal();
    return instance!;
  }

  StaticDataModelImpl._internal();

  final RetrofitStaticDataAgent _staticDataAgent =
      RetrofitStaticDataAgentImpl();

  @override
  Future<List<CategoryVO>?> getAllCategoriesList() {
    return _staticDataAgent.getAllCategories();
  }

  @override
  Future<List<ProductVO>?> getProductListByCategory({required String slug}) {
    return _staticDataAgent.getProductListByCategory(slug: slug);
  }
}
