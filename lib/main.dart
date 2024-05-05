import 'package:fileeditor/core/AppRouter.dart';
import 'package:flutter/material.dart';

late String content;
void main() {
  content = "";
  /*
  UserModel userModel;
  userModel = await UserService().getFirstUserInfo();
  print(userModel.vendorAddress);
  print(userModel.vendorId);
  print(userModel.vendorName);
  print(userModel.vendorPhoneNumber);
  */
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
