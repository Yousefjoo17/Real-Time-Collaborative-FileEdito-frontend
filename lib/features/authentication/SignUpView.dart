import 'package:fileeditor/core/utils/AppRouter.dart';
import 'package:fileeditor/core/helpers/CustomShowSnackBar.dart';
import 'package:fileeditor/core/models/UserModel.dart';
import 'package:fileeditor/core/utils/AssetsData.dart';
import 'package:fileeditor/core/services/userService.dart';
import 'package:fileeditor/core/widgets/Custom_button.dart';
import 'package:fileeditor/core/widgets/Custom_text_field.dart';
import 'package:fileeditor/main.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SignUpView extends StatefulWidget {
  const SignUpView({super.key});

  @override
  State<SignUpView> createState() => _SignUpViewState();
}

class _SignUpViewState extends State<SignUpView> {
  UserModel userModel = UserModel();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 60),
            Image.asset(AssetsData.logoPath1),
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
                    text: "Sign Up",
                    ontap: () async {
                      List<UserModel> users = await UserService().getAllUsers();
                      bool found =
                          UserService().isUsernameExists(users, userModel);
                      if (found) {
                        showmySnackBar(context, "user is already found");
                      } else {
                        await UserService().createUser(userModel);

                        currUserModel = userModel;
                        currUserModel.userID = users.length + 1;
                        showmySnackBar(context,
                            "regsiterd successdully ${userModel.username}");
                        GoRouter.of(context).push(AppRouter.khomeView);
                      }
                    },
                    color: Colors.purple,
                  ),
                  const SizedBox(height: 12),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text("Already have an account? "),
                      GestureDetector(
                        child: const Text(
                          "Sign in",
                          style: TextStyle(color: Colors.purple),
                          textAlign: TextAlign.center,
                        ),
                        onTap: () {
                          GoRouter.of(context).push(AppRouter.ksigninView);
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
