import 'package:dio/dio.dart';
import 'package:fileeditor/core/models/UpdatedFileModel.dart';

class UpdatedFileService {
  Dio dio = Dio();

  Future<void> doUpdate(UpdatedFileModel updatedFileModel) async {
    await dio.post(
        "http://localhost:8080/Real-Time-Collaborative-Editing/updates/do",
        data: updatedFileModel.toJson());
  }

  Future<UpdatedFileModel> getUpdate() async {
    Response response = await dio.get(
        "http://localhost:8080/Real-Time-Collaborative-Editing/updates/get");
    return UpdatedFileModel.fromJson(response.data);
  }
}
