import 'package:dio/dio.dart';
import 'package:mock_product_mobile/data/vos/category_vos/category_vo.dart';
import 'package:mock_product_mobile/data/vos/product_vos/product_vo.dart';
import 'package:mock_product_mobile/network/api/api_constants.dart';
import 'package:mock_product_mobile/network/api/product_api.dart';
import 'package:mock_product_mobile/network/data_agents/retrofit_static_data_agent.dart';

class RetrofitStaticDataAgentImpl extends RetrofitStaticDataAgent {
  static RetrofitStaticDataAgentImpl? instance;

  factory RetrofitStaticDataAgentImpl() {
    instance ??= RetrofitStaticDataAgentImpl._internal();
    return instance!;
  }

  late ProductApi mApi;

  RetrofitStaticDataAgentImpl._internal() {
    final dio = createDao();
    mApi = ProductApi(dio);
  }

  static Dio createDao() {
    Dio dio = Dio(
      BaseOptions(
        baseUrl: ApiConstants.kLiveUrl,
        headers: {
          "Accept": "application/json",
        },
        receiveTimeout: const Duration(seconds: 15),
        connectTimeout: const Duration(seconds: 15),
        sendTimeout: const Duration(seconds: 15),
      ),
    );
    dio.options.contentType = "application/x-www-form-urlencoded";
    return dio;
  }

  @override
  Future<List<CategoryVO>?> getAllCategories() {
    return mApi.getAllCategories();
  }

  @override
  Future<List<ProductVO>?> getProductListByCategory({required String slug}) {
    return mApi.getProductListByCategory(slug).then((response) {
      return response.products;
    });
  }
}
