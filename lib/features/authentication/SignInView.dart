import 'package:fileeditor/core/AppRouter.dart';
import 'package:fileeditor/core/helpers/CustomShowSnackBar.dart';
import 'package:fileeditor/core/models/UserModel.dart';
import 'package:fileeditor/core/services/AssetsData.dart';
import 'package:fileeditor/core/services/userService.dart';
import 'package:fileeditor/core/widgets/Custom_button.dart';
import 'package:fileeditor/core/widgets/Custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SignInView extends StatefulWidget {
  const SignInView({super.key});

  @override
  State<SignInView> createState() => _SignInViewState();
}

class _SignInViewState extends State<SignInView> {
  UserModel userModel = UserModel();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 60),
            Image.asset(AssetsData.logoPath2),
            const SizedBox(height: 12),
            SizedBox(
              width: MediaQuery.of(context).size.width / 2.5,
              child: Column(
                children: [
                  const Text(
                    "Let's collaborate and share our ideas with others!",
                    style: TextStyle(
                      fontFamily: "Pacifico-Regular",
                      fontSize: 25,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 12),
                  CustomTextField(
                    hinttext: "username",
                    onchanged: (p0) {
                      userModel.username = p0;
                    },
                  ),
                  const SizedBox(height: 12),
                  CustomTextField(
                    hinttext: "password",
                    obscureText: true,
                    onchanged: (p0) {
                      userModel.password = p0;
                    },
                  ),
                  const SizedBox(height: 20),
                  CustomButton(
                    text: "Sign in",
                    ontap: () async {
                      List<UserModel> users = await UserService().getAllUsers();
                      bool found = UserService().isUserExist(users, userModel);
                      if (found) {
                        showmySnackBar(context, "welcome");
                        GoRouter.of(context).push(AppRouter.khomeView);
                      } else {
                        showmySnackBar(context,
                            "username or password is incorrect");
                      }
                    },
                    color: Colors.purple,
                  ),
                  const SizedBox(height: 12),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text("Don't have an account? "),
                      GestureDetector(
                        child: const Text(
                          "Sign Up",
                          style: TextStyle(color: Colors.purple),
                          textAlign: TextAlign.center,
                        ),
                        onTap: () {
                          GoRouter.of(context).push(AppRouter.ksignupView);
                        },
                      )
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
