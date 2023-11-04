import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_triple/flutter_triple.dart';

import '../../../../../shared/themes/app_theme.dart';
import '../../states/processing_state.dart';
import '../../stores/processing_store.dart';
import 'widgets/color_histogram_chart.dart';
import '../widgets/large_button.dart';
import 'widgets/processing_image.dart';

class ProcessingPage extends StatefulWidget {
  final String title;
  final Uint8List picture;

  const ProcessingPage({
    super.key,
    required this.picture,
    this.title = 'Pré-processamento',
  });

  @override
  State<ProcessingPage> createState() => _ProcessingPageState();
}

class _ProcessingPageState extends State<ProcessingPage> {
  late final ProcessingStore store;

  @override
  void initState() {
    super.initState();
    store = Modular.get<ProcessingStore>();
    store.setImage(widget.picture);
  }

  @override
  void dispose() {
    Modular.dispose<ProcessingStore>();
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
          IconButton(
            onPressed: store.refresh,
            icon: const Icon(Icons.refresh),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8),
        child: TripleBuilder<ProcessingStore, ProcessingState>(
          store: store,
          builder: (context, triple) {
            if (triple.isLoading) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            return Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Expanded(
                  child: GridView(
                    physics: const AlwaysScrollableScrollPhysics(parent: BouncingScrollPhysics()),
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      childAspectRatio: 1,
                      crossAxisSpacing: 8,
                      mainAxisSpacing: 8,
                    ),
                    children: [
                      if (triple.state.baseImg != null)
                        ProcessingImage(
                          label: 'Original',
                          image: triple.state.baseImg!,
                        ),
                      if (triple.state.grayScaleImg != null)
                        ProcessingImage(
                          label: 'Escala de Cinza',
                          image: triple.state.grayScaleImg!,
                        ),
                      if (triple.state.sobelmg != null)
                        ProcessingImage(
                          label: 'Sobel',
                          image: triple.state.sobelmg!,
                        ),
                      if (triple.state.contourImg != null)
                        ProcessingImage(
                          label: 'Contour',
                          image: triple.state.contourImg!,
                        ),
                    ],
                  ),
                ),
                if (triple.state.colorHistogram != null && triple.state.colorHistogram!.isNotEmpty)
                  ColorHistogramChart(
                    colorHistogram: triple.state.colorHistogram!,
                  ),
                LargeButton(
                  label: 'Analisar',
                  onPressed: store.pushAnalysis,
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
