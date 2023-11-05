import 'package:flutter_triple/flutter_triple.dart';

import '../routes/home_routes.dart';
import '../services/interfaces/iauth_service.dart';
import '../states/home_state.dart';

class HomeStore extends Store<HomeState> {
  final IAuthService _authService;

  HomeStore(this._authService) : super(HomeState());

  Future<void> signOut() async {
    await _authService.signOut();

    HomeRoutes.navigateSignIn();
  }

  Future<void> changePassword() async {
    HomeRoutes.pushChangePassword();
  }

  Future<void> startAnalysis() async {
    HomeRoutes.pushCamera();
  }
}
