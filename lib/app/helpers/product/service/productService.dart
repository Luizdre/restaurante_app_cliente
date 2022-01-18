// ignore_for_file: file_names
import 'package:dio/dio.dart';
import 'package:restaurant_client/app/helpers/const/url.dart';
import 'package:restaurant_client/app/helpers/product/model/productModel.dart';

class ProductService {
  final Dio dio = Dio();
  final String productUrl = '$BASE_URL/product';

  Future<List<ProductModel>> getProducts() async {
    Response response = await dio.get('$productUrl/listProducts');

    List transfer = response.data;
    List<ProductModel> products = [];
    // ignore: avoid_function_literals_in_foreach_calls
    transfer.forEach((element) {
      products.add(ProductModel(
          id: element['_id'],
          name: element['name'],
          price: double.tryParse(element['price'].toString()),
          supplies: element['supplies']));
    });
    products
        .sort((a, b) => a.name!.toLowerCase().compareTo(b.name!.toLowerCase()));
    return products;
  }

  Future postProduct(ProductModel product) async {
    Response response = await dio.post('$productUrl/createProduct', data: {
      'name': product.name,
      'price': product.price,
      'supplies': product.supplies
    });
    return response.data;
  }

  Future putProduct(ProductModel product) async {
    Response response = await dio.put('$productUrl/updateProduct', data: {
      'id': product.id,
      'name': product.name,
      'price': product.price,
      'supplies': product.supplies
    });

    return response.data;
  }

  Future deleteProduct(ProductModel product) async {
    Response response =
        await dio.delete('$productUrl/deleteProduct', data: {'id': product.id});
    return response.data;
  }
}
