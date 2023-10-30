import 'package:flutter_triple/flutter_triple.dart';

import '../routes/home_routes.dart';
import '../states/home_state.dart';

class HomeStore extends Store<HomeState> {
  HomeStore() : super(HomeState());

  void logoff() {
    HomeRoutes.navigateSignIn();
  }

  Future<void> changePassword() async {
    HomeRoutes.pushChangePassword();
  }

  Future<void> startAnalysis() async {
    HomeRoutes.pushCamera();
  }
}
