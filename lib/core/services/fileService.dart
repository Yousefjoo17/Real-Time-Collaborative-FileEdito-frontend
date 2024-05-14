import 'package:dio/dio.dart';
import 'package:fileeditor/core/models/FileModel.dart';

class FileService {
   Dio dio = Dio();

  Future<List<FileModel>> getAllFiles() async {
    List<FileModel> files = [];
    try {
      Response response = await dio.get("http://localhost:8080/Real-Time-Collaborative-Editing/files");
      List<dynamic> jsonList = response.data; 
      files = jsonList.map((json) => FileModel.fromJson(json)).toList(); 
      return files;
    } catch (e) {
      throw Exception("Error: $e");
    }
  }

  Future<void> createFile(FileModel fileModel) async {
    try {
      await dio.post("http://localhost:8080/Real-Time-Collaborative-Editing/files", data: fileModel.toJson());
    } catch (e) {
      throw Exception("Error: $e");
    }
  }
}