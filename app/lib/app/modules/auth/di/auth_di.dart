import 'package:flutter_modular/flutter_modular.dart';

import '../pages/forgot_password/forgot_password_page.dart';
import '../pages/sign_in/sign_in_page.dart';
import '../pages/sign_up/sign_up_page.dart';
import '../routes/auth_routes.dart';
import '../stores/forgot_password_store.dart';
import '../stores/sign_in_store.dart';
import '../stores/sign_up_store.dart';

class AuthDI {
  static List<Bind> get binds => [
    Bind.lazySingleton((i) => SignInStore(i())),
    Bind.lazySingleton((i) => SignUpStore(i())),
    Bind.lazySingleton((i) => ForgotPasswordStore(i())),
  ];

  static List<ModularRoute> get routes => [
    ChildRoute(AuthRoutes.signIn, child: (context, args) => const SignInPage()),
    ChildRoute(AuthRoutes.signUp, child: (context, args) => const SignUpPage()),
    ChildRoute(AuthRoutes.forgotPassword, child: (context, args) => const ForgotPasswordPage()),
  ];
}