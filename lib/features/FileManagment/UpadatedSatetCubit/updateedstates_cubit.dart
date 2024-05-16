import 'package:bloc/bloc.dart';
import 'package:fileeditor/core/models/UpdatedFileModel.dart';
import 'package:fileeditor/core/services/updatedFileService.dart';
import 'package:meta/meta.dart';

part 'updateedstates_state.dart';

class UpdateedstatesCubit extends Cubit<UpdateedstatesState> {
  UpdateedstatesCubit() : super(UpdateedstatesInitial());

  Future<void> updateFileState() async {
    UpdatedFileModel updatedFileModel = await UpdatedFileService().getUpdate();
    updatedFileModel.content = "Z";
    emit(UpdatedFileState(fileContent: updatedFileModel.content!));
    await Future.delayed(Duration(seconds: 1));
  }
}
