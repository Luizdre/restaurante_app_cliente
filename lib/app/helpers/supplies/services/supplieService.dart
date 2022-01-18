// ignore_for_file: file_names
import 'package:dio/dio.dart';
import 'package:restaurant_client/app/helpers/const/url.dart';
import 'package:restaurant_client/app/helpers/supplies/model/supplieModel.dart';

class SupplieService {
  final Dio dio = Dio();
  final String supplieUrl = '$BASE_URL/supplie';
  SupplieModel supplie = SupplieModel();

  Future<List<SupplieModel>> getSupplie() async {
    List<SupplieModel> supplieList = [];
    Response response = await dio.get('$supplieUrl/listSupplies');

    List supplie = response.data;
    // ignore: avoid_function_literals_in_foreach_calls
    supplie.forEach((element) {
      supplieList.add(SupplieModel(id: element['_id'], name: element['name']));
    });
    supplieList
        .sort((a, b) => a.name!.toLowerCase().compareTo(b.name!.toLowerCase()));
    return supplieList;
  }

  Future postSupplie(String name) async {
    Response response = await dio.post('$supplieUrl/createSupplie',
        data: {'name': name}).catchError((error) {
      return error;
    });
    return response.data;
  }

  Future putSupplie(SupplieModel supplie) async {
    Response response = await dio.patch('$supplieUrl/alterSupplie',
        data: {'id': supplie.id, 'name': supplie.name});
    return response.data;
  }

  Future deleteSupplie(SupplieModel supplie) async {
    Response response =
        await dio.delete('$supplieUrl/deleteSupplie', data: {'id': supplie.id});
    return response.data;
  }
}
