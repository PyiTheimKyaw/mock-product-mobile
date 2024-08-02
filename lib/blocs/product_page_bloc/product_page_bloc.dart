import 'package:mock_product_mobile/blocs/base_bloc.dart';
import 'package:mock_product_mobile/data/models/data_model_impls/static_data_model_impl.dart';
import 'package:mock_product_mobile/data/models/data_models/static_data_model.dart';
import 'package:mock_product_mobile/data/vos/product_vos/product_vo.dart';

class ProductPageBloc extends BaseBloc {
  List<ProductVO>? productList;
  String? slug;
  final StaticDataModel _staticDataModel = StaticDataModelImpl();

  ProductPageBloc({String? catSlug}) {
    slug = catSlug;
    notifySafely();
    if (slug != null && (slug?.isNotEmpty ?? false)) {
      getProductListByCategory();
    }
  }

  Future<List<ProductVO>?> getProductListByCategory() {
    return _staticDataModel
        .getProductListByCategory(slug: slug ?? "")
        .then((catList) {
      productList = catList;
      notifySafely();
      return productList;
    });
  }
}
