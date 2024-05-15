import 'package:dio/dio.dart';
import 'package:fileeditor/core/models/FileModel.dart';

class FileService {
  Dio dio = Dio();

  Future<List<FileModel>> getAllFiles() async {
    List<FileModel> files = [];
    try {
      Response response = await dio
          .get("http://localhost:8080/Real-Time-Collaborative-Editing/files");
      List<dynamic> jsonList = response.data;
      files = jsonList.map((json) => FileModel.fromJson(json)).toList();
      return files;
    } catch (e) {
      throw Exception("Error: $e");
    }
  }

  Future<void> createFile(FileModel fileModel) async {
    try {
      await dio.post(
          "http://localhost:8080/Real-Time-Collaborative-Editing/files",
          data: fileModel.toJson());
    } catch (e) {
      throw Exception("Error: $e");
    }
  }

  Future<void> openFile(int port) async {
    try {
      //open server process
      await dio.get(
          "http://localhost:8080/Real-Time-Collaborative-Editing/start-server/port=$port");
    } catch (e) {
      throw Exception("Error: $e");
    }
  }

  Future<void> runUser(int port, int userID, String diff, int pos) async {
    try {
      //open server process
      await dio.get(
          "http://localhost:8080/Real-Time-Collaborative-Editing/start-client/port=$port&userID=$userID&added=$diff&pos=$pos");
    } catch (e) {
      throw Exception("Error: $e");
    }
  }

  Future<void> renameFile(int fileID, String newName) async {
    try {
      await dio.get(
          "http://localhost:8080/Real-Time-Collaborative-Editing/files/updateName/id=$fileID&newname=$newName");
    } catch (e) {
      throw Exception("Error: $e");
    }
  }

  Future<void> deleteFile(int fileID) async {
    try {
      await dio.delete(
          "http://localhost:8080/Real-Time-Collaborative-Editing/files/id=$fileID");
    } catch (e) {
      throw Exception("Error: $e");
    }
  }

  Future<int> generateFileID() async {
    int id = 0;
    try {
      List<FileModel> files = await getAllFiles();
      for (var f in files) {
        if (f.fileID! > id) {
          id = f.fileID!;
        }
      }
      return id + 1;
    } catch (e) {
      throw Exception("Error: $e");
    }
  }
}
