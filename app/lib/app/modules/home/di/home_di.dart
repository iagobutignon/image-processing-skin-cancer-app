import 'package:flutter_modular/flutter_modular.dart';

import '../pages/camera/camera_page.dart';
import '../pages/edit_image/edit_image_page.dart';
import '../pages/home/home_page.dart';
import '../routes/home_routes.dart';
import '../services/http_service.dart';
import '../services/image_processing_service.dart';
import '../services/interfaces/ihttp_service.dart';
import '../services/interfaces/iimage_processing_service.dart';
import '../stores/camera_store.dart';
import '../stores/edit_image_store.dart';
import '../stores/home_store.dart';

class HomeDI {
  static List<Bind> get binds => [
     Bind.lazySingleton<IHttpService>((i) => HttpService()),
     Bind.lazySingleton<IImageProcessingService>((i) => ImageProcessingService(i())),
     Bind.lazySingleton((i) => HomeStore(i())),
     Bind.lazySingleton((i) => CameraStore()),
     Bind.lazySingleton((i) => EditImageStore())
  ];

  static List<ModularRoute> get routes => [
    ChildRoute(HomeRoutes.home, child: (_, args) => const HomePage()),
    ChildRoute(HomeRoutes.camera, child: (_, args) => const CameraPage()),
    ChildRoute(HomeRoutes.editImage, child: (_, args) => EditImagePage(picture: args.data)),
  ];
}