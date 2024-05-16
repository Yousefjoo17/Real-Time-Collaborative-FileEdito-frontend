import 'package:dio/dio.dart';
import 'package:fileeditor/core/models/UserFilePermission.dart';
import 'package:fileeditor/main.dart';

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

  Future<List<UserFilePermission>> getAllPermissions(int userID) async {
    List<UserFilePermission> permissions = [];
    try {
      Response response = await Dio().get(
          "http://localhost:8080/Real-Time-Collaborative-Editing/UserFilepermissions");
      List<dynamic> data = response.data;
      for (var item in data) {
        permissions.add(UserFilePermission.fromJson(item));
      }
      return permissions;
    } on Exception catch (e) {
      print(e);
      return [];
    }
  }

  bool isOwner(int fileID, int userID) {
    
    for (var element in userfilesPermissions) {
      if (element.userId == userID &&
          element.fileId == fileID &&
          element.permisson == 0) {
        return true;
      }
    }
    return false;
  }

  bool isEditor(int fileID, int userID) {
    for (var element in userfilesPermissions) {
      if (element.userId == userID &&
          element.fileId == fileID &&
          element.permisson == 1) {
        return true;
      }
    }
    return false;
  }

  bool isViewer(int fileID, int userID) {
    for (var element in userfilesPermissions) {
      if (element.userId == userID &&
          element.fileId == fileID &&
          element.permisson == 2) {
        return true;
      }
    }
    return false;
  }
}
