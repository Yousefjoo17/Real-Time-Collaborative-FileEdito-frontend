import 'package:fileeditor/core/models/UserFilePermission.dart';
import 'package:fileeditor/core/models/UserModel.dart';
import 'package:fileeditor/core/utils/AppRouter.dart';
import 'package:fileeditor/features/FileManagment/UpadatedSatetCubit/updateedstates_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

late UserModel currUserModel;
List<UserFilePermission> userfilesPermissions = [];
String newContent = "";
void main() async {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          UpdateedstatesCubit(), // Replace YourBloc with your actual bloc class
      child: MaterialApp.router(
        routerConfig: AppRouter.router,
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
