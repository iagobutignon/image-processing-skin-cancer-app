import 'package:flutter_triple/flutter_triple.dart';

import '../routes/home_routes.dart';

class SignInStore extends Store<int> {
  SignInStore() : super(0);

  @override
  void initStore() {
    HomeRoutes.pushSignUp();
    super.initStore();
  }

  Future<void> pushSignUp() async {
    await HomeRoutes.pushSignUp();
  }
}