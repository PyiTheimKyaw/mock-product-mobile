import 'package:dio/dio.dart';
import 'package:mock_product_mobile/data/vos/category_vos/category_vo.dart';
import 'package:mock_product_mobile/network/api/api_constants.dart';
import 'package:retrofit/http.dart';

part 'product_api.g.dart';

// Api configuration for the whole app using retrofit and dio
@RestApi(baseUrl: ApiConstants.kLiveUrl)
abstract class ProductApi {
  factory ProductApi(Dio dio) = _ProductApi;

  @GET(ApiConstants.kEndPointGetCategories)
  Future<List<CategoryVO>?> getAllCategories();
}
