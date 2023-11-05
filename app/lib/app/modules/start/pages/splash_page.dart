import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../stores/splash_store.dart';

class SplashPage extends StatefulWidget {
  final String title;

  const SplashPage({
    super.key,
    this.title = 'Splash Page',
  });

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  late final SplashStore store;

  @override
  void initState() {
    super.initState();
    store = Modular.get<SplashStore>();
  }

  @override
  void dispose() {
    Modular.dispose<SplashStore>();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
        child: Center(
          child: Text('Aguarde...'),
        ),
      ),
    );
  }
}
