import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_triple/flutter_triple.dart';
import '../../states/home_state.dart';
import '../../stores/home_store.dart';
import '../widgets/color_histogram_chart.dart';

class HomePage extends StatefulWidget {
  final String title;

  const HomePage({
    Key? key,
    this.title = 'Home',
  }) : super(key: key);

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
        title: const Text('Home'),
        actions: [
          IconButton(
            icon: const Icon(Icons.camera_alt),
            onPressed: store.registerPicture,
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: TripleBuilder<HomeStore, HomeState>(
          store: store,
          builder: (context, triple) {
            if (triple.isLoading) {
              return const CircularProgressIndicator();
            }
            return Expanded(
              child: Column(
                children: [
                  Expanded(
                    child: GridView(
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        childAspectRatio: 1 / 1,
                        crossAxisSpacing: 5,
                        mainAxisSpacing: 5,
                      ),
                      children: [
                        if (triple.state.baseImg != null)
                          Image.memory(triple.state.baseImg!),
                        if (triple.state.grayScaleImg != null)
                          Image.memory(triple.state.grayScaleImg!),
                        if (triple.state.sobelmg != null)
                          Image.memory(triple.state.sobelmg!),
                        if (triple.state.contourImg != null)
                          Image.memory(triple.state.contourImg!),
                      ],
                    ),
                  ),
                  if (triple.state.colorHistogram != null &&
                      triple.state.colorHistogram!.isNotEmpty)
                    ColorHistogramChart(
                      colorHistogram: triple.state.colorHistogram!,
                    ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
