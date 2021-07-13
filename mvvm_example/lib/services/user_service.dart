import 'package:dio/dio.dart';
import 'package:mvvm_example/models/user_model.dart';

class UserService {
  Future<List<UserModel>> fetchUsers() async {
    try {
      Response response =
          await Dio().get('https://jsonplaceholder.typicode.com/users');
      if (response.statusCode == 200) {
        var getUsersData = response.data as List;
        var listUsers = getUsersData.map((i) => UserModel.fromJson(i)).toList();
        return listUsers;
      } else {
        throw Exception('failed');
      }
    } catch (e) {
      print(e);
    return [];
    }
  }
}
