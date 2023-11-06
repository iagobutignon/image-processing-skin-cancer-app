import 'package:flutter_triple/flutter_triple.dart';

import '../../shared/widgets/options_dialog.dart';
import '../routes/home_routes.dart';
import '../../shared/services/interfaces/iauth_service.dart';
import '../services/interfaces/iimage_service.dart';
import '../states/home_state.dart';

class HomeStore extends Store<HomeState> {
  final IAuthService _authService;
  final IImageService _imageService;

  HomeStore(this._authService, this._imageService) : super(HomeState());

  Future<void> signOut() async {
    await _authService.signOut();

    HomeRoutes().navigateAuth();
  }

  Future<void> changePassword() async {
    HomeRoutes().pushChangePassword();
  }

  Future<void> startAnalysis() async {
    final option = await OptionsDialog.show(
      title: 'Selecionar',
      message: 'Abrir a câmera, ou selecionar uma foto na galeria?',
      options: [
        'Camera',
        'Galeria',
      ],
    );

    switch (option) {
      case 0:
        HomeRoutes().pushCamera();
        break;
      case 1:
        final image = await _imageService.getImageFromGallery();
        if (image == null) {
          return;
        }
        HomeRoutes().pushEditImage(image);
        break;
    }
  }
}
