import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_triple/flutter_triple.dart';

import '../../../../../core/themes/app_theme.dart';
import '../../../shared/widgets/large_button.dart';
import '../../states/processing_state.dart';
import '../../stores/processing_store.dart';
import 'widgets/color_histogram_chart.dart';
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
      ),
      body: Padding(
        padding: const EdgeInsets.all(8),
        child: TripleBuilder<ProcessingStore, ProcessingState>(
          store: store,
          builder: (context, triple) {
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
                      ProcessingImage(
                        label: 'Original',
                        id: triple.state.id,
                        image: triple.state.baseImg,
                        callback: store.base,
                      ),
                      ProcessingImage(
                        label: 'Escala de Cinza',
                        id: triple.state.id,
                        image: triple.state.baseImg,
                        callback: store.toGrayscale,
                      ),
                      if (triple.state.grayScaleImg != null)
                        ProcessingImage(
                          label: 'Detail',
                          id: triple.state.id,
                          image: triple.state.grayScaleImg,
                          callback: store.toDetail,
                        ),
                      if (triple.state.detailedImg != null)
                        ProcessingImage(
                          label: 'Contraste',
                          id: triple.state.id,
                          image: triple.state.detailedImg,
                          callback: store.toContrast,
                        ),
                      if (triple.state.contrastedImg != null)
                        ProcessingImage(
                          label: 'Sobel',
                          id: triple.state.id,
                          image: triple.state.contrastedImg,
                          callback: store.toSobel,
                        ),
                      if (triple.state.contrastedImg != null)
                        ProcessingImage(
                          label: 'Contour',
                          id: triple.state.id,
                          image: triple.state.contrastedImg,
                          callback: store.toContour,
                        ),
                    ],
                  ),
                ),
                ColorHistogramChart(
                  id: triple.state.id,
                  image: triple.state.baseImg,
                  callback: store.getColorHistogram,
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