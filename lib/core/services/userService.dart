import 'package:dio/dio.dart';
import 'package:fileeditor/core/models/UserModel.dart';

class UserService {
  Dio dio = Dio();
  Future<UserModel> getFirstUserInfo() async {
    try {
      Response response = await dio.get("http://localhost:8080/cloudvendor/");
      UserModel userModel = UserModel.fromJson(response.data[0]);
      return userModel;
    } on Exception catch (e) {
      throw ("Erorr $e");
    }
  }
}
