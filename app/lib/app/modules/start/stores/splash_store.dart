import 'package:flutter_triple/flutter_triple.dart';

import '../../../app_routes.dart';
import '../states/splash_state.dart';

class SplashStore extends Store<SplashState> {
  SplashStore() : super(SplashState());

  @override
  void initStore() {
    AppRoutes().navigateHome();
    
    super.initStore();
  }
}