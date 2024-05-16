import 'package:fileeditor/core/models/UserFilePermission.dart';
import 'package:fileeditor/core/models/UserModel.dart';
import 'package:fileeditor/core/utils/AppRouter.dart';
import 'package:flutter/material.dart';

late UserModel currUserModel;
List<UserFilePermission> userfilesPermissions = [];
void main() async {
  
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: AppRouter.router,
      debugShowCheckedModeBanner: false,
    );
  }
}
