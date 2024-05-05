import 'package:fileeditor/features/FileManagment/FileView.dart';
import 'package:fileeditor/features/FileManagment/HomeView.dart';
import 'package:fileeditor/features/authentication/SignInView.dart';
import 'package:fileeditor/features/authentication/SignUpView.dart';
import 'package:go_router/go_router.dart';

abstract class AppRouter {
  static const String ksignupView = '/signup';
  static const String ksigninView = '/signin';
  static const String kfileView = "/file";
  static const String khomeView = "/home";

  static final router = GoRouter(
    routes: [
      GoRoute(
        path: '/',
        builder: (context, state) => const SignUpView(),
      ),
      GoRoute(
        path: ksignupView,
        builder: (context, state) => const SignUpView(),
      ),
      GoRoute(
        path: ksigninView,
        builder: (context, state) => const SignInView(),
      ),
      GoRoute(
        path: kfileView,
        builder: (context, state) => const FileView(),
      ),
      GoRoute(
        path: khomeView,
        builder: (context, state) => const HomeView(),
      ),
    ],
  );
}
