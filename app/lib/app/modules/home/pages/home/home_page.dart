import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import '../../../../../shared/themes/app_theme.dart';
import '../../stores/home_store.dart';
import '../widgets/large_button.dart';

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
        actions: [
          PopupMenuButton(
            itemBuilder: (context) {
              return const [
                PopupMenuItem(
                  child: Text('Sair'),
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
      drawer: const Drawer(),
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
