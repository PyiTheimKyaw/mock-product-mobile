import 'package:mock_product_mobile/blocs/base_bloc.dart';
import 'package:mock_product_mobile/data/models/data_model_impls/static_data_model_impl.dart';
import 'package:mock_product_mobile/data/models/data_models/static_data_model.dart';
import 'package:mock_product_mobile/data/vos/category_vos/category_vo.dart';

class CategoryPageBloc extends BaseBloc {
  List<CategoryVO>? categories;
  final StaticDataModel _staticDataModel = StaticDataModelImpl();

  CategoryPageBloc() {
    getCategories();
  }

  Future<List<CategoryVO>?> getCategories() {
    return _staticDataModel.getAllCategoriesList().then((catList) {
      categories = catList;
      notifySafely();
      return categories;
    });
  }
}
