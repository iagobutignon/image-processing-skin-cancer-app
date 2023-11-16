import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../../../../core/assets/app_images.dart';
import '../../../../../core/themes/app_theme.dart';
import '../../../shared/widgets/large_button.dart';
import '../../stores/home_store.dart';
import 'widgets/break_line.dart';
import 'home_drawer.dart';
import 'widgets/page_image.dart';
import 'widgets/page_text.dart';
import 'widgets/page_title.dart';
import 'widgets/section_title.dart';

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
        leading: Builder(builder: (context) {
          return IconButton(
            icon: const Icon(Icons.info_outline),
            onPressed: () {
              Scaffold.of(context).openDrawer();
            },
          );
        }),
        actions: [
          PopupMenuButton(
            onSelected: (value) {
              switch (value) {
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
      drawer: const HomeDrawer(),
      body: Padding(
        padding: const EdgeInsets.all(8),
        child: Column(
          children: [
            Expanded(
              child: ListView(
                shrinkWrap: true,
                physics: const AlwaysScrollableScrollPhysics(parent: BouncingScrollPhysics()),
                children: [
                  const PageTitle(title: 'O que é melanoma'),
                  const BreakLine(),
                  PageText(text: store.state.whatIsMelanoma),
                  const BreakLine(),
                  PageText(text: store.state.abcdeText),
                  const BreakLine(),
                  const SectionTitle(title: 'ABCDE do melanoma'),
                  const PageImage(asset: AppImages.abcdeImage),
                ],
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
