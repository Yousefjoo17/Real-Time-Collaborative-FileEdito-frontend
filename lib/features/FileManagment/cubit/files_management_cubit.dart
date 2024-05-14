import 'package:bloc/bloc.dart';
import 'package:fileeditor/core/models/FileModel.dart';
import 'package:fileeditor/core/services/fileService.dart';
import 'package:meta/meta.dart';

part 'files_management_state.dart';

class FilesManagementCubit extends Cubit<FilesManagementState> {
  FilesManagementCubit() : super(FilesManagementInitial());
  FileService fileService = FileService();
  Future<void> getAllFiles() async {
    emit(FilesManagementLoading());
    try {
      List<FileModel> files = await fileService.getAllFiles();
      emit(FilesManagementSuccess(files: files));
    } on Exception catch (e) {
      emit(FilesManagementFailure(errMessage: "Failure $e"));
    }
  }
}
