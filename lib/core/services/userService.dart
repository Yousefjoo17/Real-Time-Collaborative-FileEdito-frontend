import 'package:dio/dio.dart';
import 'package:fileeditor/core/models/UserModel.dart';

class UserService {
  Dio dio = Dio();

  Future<List<UserModel>> getAllUsers() async {
    List<UserModel> users = [];
    try {
      Response response = await dio.get("http://localhost:8080/Real-Time-Collaborative-Editing/users");
      List<dynamic> jsonList = response.data; 
      users = jsonList.map((json) => UserModel.fromJson(json)).toList(); 
      return users;
    } catch (e) {
      throw Exception("Error: $e");
    }
  }

  Future<void> createUser(UserModel user) async {
    try {
      await dio.post("http://localhost:8080/Real-Time-Collaborative-Editing/users", data: user.toJson());
    } catch (e) {
      throw Exception("Error: $e");
    }
  }

  bool isUsernameExists(List<UserModel> users, UserModel newUser) {
  for (var user in users) {
    if (user.username == newUser.username) {
      return true;
    }
  }
  return false;
}

bool isUserExist(List<UserModel> users, UserModel newUser) {
  for (var user in users) {
    if (user.username == newUser.username && user.password==newUser.password) {
      return true;
    }
  }
  return false;
}
}
