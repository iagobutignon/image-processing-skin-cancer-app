import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../../../../core/themes/app_theme.dart';
import '../../../shared/widgets/large_button.dart';
import '../../stores/home_store.dart';

class HomePage extends StatefulWidget {
  final String title;

  const HomePage({
    super.key,
    this.title = 'Início',
  });

  @override
  HomePageState createState() => HomePageState();
}

class HomePageState extends State<HomePage> {
  late final HomeStore store;

  @override
  void initState() {
    super.initState();
    store = Modular.get<HomeStore>();
  }

  @override
  void dispose() {
    Modular.dispose<HomeStore>();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        backgroundColor: AppTheme.mainColor,
        centerTitle: true,
        leading: Builder(
          builder: (context) {
            return IconButton(
              icon: const Icon(Icons.info_outline),
              onPressed: () {
                Scaffold.of(context).openDrawer();
              },
            );
          }
        ),
        actions: [
          PopupMenuButton(
            onSelected: (value) {
              switch(value) {
                case 0:
                  store.signOut();
                  break;
                case 1:
                  store.changePassword();
                  break;
              }
            },
            itemBuilder: (context) {
              return const [
                PopupMenuItem(
                  value: 0,
                  child: Text('Sair'),
                ),
                PopupMenuItem(
                  value: 1,
                  child: Text('Alterar senha'),
                ),
              ];
            },
            child: const Padding(
              padding: EdgeInsets.all(8),
              child: Icon(Icons.person),
            ),
          ),
        ],
      ),
      drawer: Drawer(
        child: Scaffold(
          appBar: AppBar(
            title: const Text('Sobre o app'),
            backgroundColor: AppTheme.mainColor,
            centerTitle: true,
            leading: IconButton(
              icon: const Icon(Icons.close),
              onPressed: () => Navigator.of(context).pop(),
            ),
          ),
          body: const Align(
            alignment: Alignment.bottomRight,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Padding(
                  padding: EdgeInsets.all(10),
                  child: Text('Versão 1.0.0'),
                )
              ],
            ),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8),
        child: Column(
          children: [
            const Expanded(
              child: Center(
                child: Text('Descrição sobre o melanoma'),
              ),
            ),
            LargeButton(
              label: 'Iniciar Análise',
              onPressed: store.startAnalysis,
            ),
          ],
        ),
      ),
    );
  }
}
