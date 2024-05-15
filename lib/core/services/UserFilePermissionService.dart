import 'package:dio/dio.dart';
import 'package:fileeditor/core/models/UserFilePermission.dart';

class UserFilePermissionService {
  Dio dio = Dio();
  Future<void> createUserFilePermission(
      UserFilePermission userFilePermission) async {
    try {
      await dio.post(
          "http://localhost:8080/Real-Time-Collaborative-Editing/UserFilepermissions",
          data: userFilePermission.toJson());
    } catch (e) {
      throw Exception("Error: $e");
    }
  }
}
