import 'package:flutter_modular/flutter_modular.dart';

import '../pages/analysis/analysis_page.dart';
import '../pages/camera/camera_page.dart';
import '../pages/change_password/change_password_page.dart';
import '../pages/edit_image/edit_image_page.dart';
import '../pages/home/home_page.dart';
import '../pages/processing/processing_page.dart';
import '../routes/home_routes.dart';
import '../services/http_service.dart';
import '../services/image_processing_service.dart';
import '../services/image_service.dart';
import '../services/interfaces/ihttp_service.dart';
import '../services/interfaces/iimage_processing_service.dart';
import '../services/interfaces/iimage_service.dart';
import '../stores/analysis_store.dart';
import '../stores/camera_store.dart';
import '../stores/change_password_store.dart';
import '../stores/color_histogram_chart_store.dart';
import '../stores/edit_image_store.dart';
import '../stores/home_store.dart';
import '../stores/processing_image_store.dart';
import '../stores/processing_store.dart';

class HomeDI {
  static List<Bind> get binds => [
    Bind.lazySingleton<IHttpService>((i) => HttpService()),
    Bind.lazySingleton<IImageProcessingService>((i) => ImageProcessingService(i())),
    Bind.lazySingleton<IImageService>((i) => ImageService()),
    Bind.lazySingleton((i) => ChangePasswordStore(i())),
    Bind.lazySingleton((i) => HomeStore(i(), i())),
    Bind.lazySingleton((i) => CameraStore()),
    Bind.lazySingleton((i) => EditImageStore(i())),
    Bind.lazySingleton((i) => ProcessingStore(i())),
    Bind.lazySingleton((i) => AnalysisStore()),
    Bind.factory((i) => ProcessingImageStore()),
    Bind.factory((i) => ColorHistogramChartStore())
  ];

  static List<ModularRoute> get routes => [
    ChildRoute(HomeRoutes().changePassword, child: (context, args) => const ChangePasswordPage()),
    ChildRoute(HomeRoutes().home, child: (_, args) => const HomePage()),
    ChildRoute(HomeRoutes().camera, child: (_, args) => const CameraPage()),
    ChildRoute(HomeRoutes().editImage, child: (_, args) => EditImagePage(picture: args.data)),
    ChildRoute(HomeRoutes().processing, child: (context, args) => ProcessingPage(picture: args.data)),
    ChildRoute(HomeRoutes().analysis, child: (context, args) => const AnalysisPage()),
  ];
}