part of 'updateedstates_cubit.dart';

@immutable
sealed class UpdateedstatesState {}

final class UpdateedstatesInitial extends UpdateedstatesState {}

final class UpdatedFileState extends UpdateedstatesState {
  final String fileContent;
  UpdatedFileState({required this.fileContent});
}
