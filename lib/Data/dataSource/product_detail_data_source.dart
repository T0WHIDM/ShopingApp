import 'package:dio/dio.dart';
import 'package:flutter_shop_sample/Data/model/product_image.dart';
import 'package:flutter_shop_sample/di/di.dart';
import 'package:flutter_shop_sample/utility/api_exeption.dart';

abstract class IProductDetailDataSource {
  Future<List<ProductImage>> getGallery();
}

class ProductDetailDataSource extends IProductDetailDataSource {
  final Dio _dio = locator.get();

  @override
  Future<List<ProductImage>> getGallery() async {
    Map<String, String> qParames = {'filter': 'product_id = "78n4wqor3hhnkju"'};

    try {
      var respones = await _dio.get(
        'collections/gallery/records',
        queryParameters: qParames,
      );

      return respones.data['items']
          .map<ProductImage>(
            (jsonObject) => ProductImage.fromMapJson(jsonObject),
          )
          .toList();
    } on DioException catch (ex) {
      throw ApiExeption(ex.response?.statusCode, ex.response?.data['message']);
    } catch (ex) {
      throw ApiExeption(0, 'unkown error');
    }
  }
}
