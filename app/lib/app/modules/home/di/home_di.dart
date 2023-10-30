import 'package:flutter_modular/flutter_modular.dart';

import '../pages/analysis/analysis_page.dart';
import '../pages/camera/camera_page.dart';
import '../pages/change_password/change_password_page.dart';
import '../pages/edit_image/edit_image_page.dart';
import '../pages/forgot_password/forgot_password_page.dart';
import '../pages/home/home_page.dart';
import '../pages/processing/processing_page.dart';
import '../pages/sign_in/sign_in_page.dart';
import '../pages/sign_up/sign_up_page.dart';
import '../routes/home_routes.dart';
import '../services/http_service.dart';
import '../services/image_processing_service.dart';
import '../services/interfaces/ihttp_service.dart';
import '../services/interfaces/iimage_processing_service.dart';
import '../stores/analysis_store.dart';
import '../stores/camera_store.dart';
import '../stores/change_password_store.dart';
import '../stores/edit_image_store.dart';
import '../stores/forgot_password_store.dart';
import '../stores/home_store.dart';
import '../stores/processing_store.dart';
import '../stores/sign_in_store.dart';
import '../stores/sign_up_store.dart';

class HomeDI {
  static List<Bind> get binds => [
    Bind.lazySingleton<IHttpService>((i) => HttpService()),
    Bind.lazySingleton<IImageProcessingService>((i) => ImageProcessingService(i())),
    Bind.lazySingleton((i) => SignInStore()),
    Bind.lazySingleton((i) => SignUpStore()),
    Bind.lazySingleton((i) => ForgotPasswordStore()),
    Bind.lazySingleton((i) => ChangePasswordStore()),
    Bind.lazySingleton((i) => HomeStore()),
    Bind.lazySingleton((i) => CameraStore()),
    Bind.lazySingleton((i) => EditImageStore()),
    Bind.lazySingleton((i) => ProcessingStore()),
    Bind.lazySingleton((i) => AnalysisStore())
  ];

  static List<ModularRoute> get routes => [
    ChildRoute(HomeRoutes.signIn, child: (context, args) => const SignInPage()),
    ChildRoute(HomeRoutes.signUp, child: (context, args) => const SignUpPage()),
    ChildRoute(HomeRoutes.forgotPassword, child: (context, args) => const ForgotPasswordPage()),
    ChildRoute(HomeRoutes.changePassword, child: (context, args) => const ChangePasswordPage()),
    ChildRoute(HomeRoutes.home, child: (_, args) => const HomePage()),
    ChildRoute(HomeRoutes.camera, child: (_, args) => const CameraPage()),
    ChildRoute(HomeRoutes.editImage, child: (_, args) => EditImagePage(picture: args.data)),
    ChildRoute(HomeRoutes.processing, child: (context, args) => ProcessingPage(picture: args.data)),
    ChildRoute(HomeRoutes.analysis, child: (context, args) => const AnalysisPage()),
  ];
}