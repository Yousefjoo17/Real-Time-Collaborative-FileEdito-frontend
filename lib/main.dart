import 'package:fileeditor/core/models/UserModel.dart';
import 'package:fileeditor/core/utils/AppRouter.dart';
import 'package:flutter/material.dart';

late UserModel currUserModel;
void main() {
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
