part of 'files_management_cubit.dart';

@immutable
sealed class FilesManagementState {}

final class FilesManagementInitial extends FilesManagementState {}

final class FilesManagementLoading extends FilesManagementState {}

final class FilesManagementSuccess extends FilesManagementState {
  final List<FileModel> files;
  FilesManagementSuccess({required this.files});
}

final class FilesManagementFailure extends FilesManagementState {
  final String errMessage;
  FilesManagementFailure({required this.errMessage});
}
