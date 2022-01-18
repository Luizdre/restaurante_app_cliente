// ignore_for_file: file_names
import 'package:dio/dio.dart';
import 'package:restaurant_client/app/helpers/const/url.dart';
import 'package:restaurant_client/app/helpers/users/model/userModel.dart';

class UserService {
  final Dio dio = Dio();
  final String userUrl = '$BASE_URL/user';
  UserModel user = UserModel();

  Future registerUser(UserModel user) async {
    Response response = await dio.post('$userUrl/register', data: {
      'name': user.name,
      'email': user.email,
      'password': user.password
    });
    return response.data;
  }

  Future authUser(UserModel user) async {
    Response response = await dio.post('$userUrl/authenticate',
        data: {'email': user.email, 'password': user.password});
    return response.data;
  }

  Future deleteUser(UserModel user) async {
    Response response =
        await dio.delete('$userUrl/deleteUser', data: {'id': user.id});
    return response.data;
  }
}
