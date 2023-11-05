import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_triple/flutter_triple.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import '../../../../../../core/colors/app_colors.dart';
import '../../../stores/color_histogram_chart_store.dart';

class ColorHistogramChart extends StatefulWidget {
  final String? id;
  final String? image;
  final Future<List<int>> Function(String, String) callback;

  const ColorHistogramChart({
    super.key,
    required this.id,
    required this.image,
    required this.callback,
  });

  @override
  State<ColorHistogramChart> createState() => _ColorHistogramChartState();
}

class _ColorHistogramChartState extends State<ColorHistogramChart> {
  late final ColorHistogramChartStore store;

  @override
  void initState() {
    super.initState();
    store = Modular.get<ColorHistogramChartStore>();
    store.processImage(id: widget.id, image: widget.image, f: widget.callback);
  }

  @override
  void dispose() {
    Modular.dispose<ColorHistogramChartStore>();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return TripleBuilder<ColorHistogramChartStore, List<int>>(
      store: store,
      builder: (context, triple) {
        // if (triple.isLoading) {
        //   return const Center(child: CircularProgressIndicator());
        // }
        
        return AspectRatio(
          aspectRatio: 2,
          child: SfCartesianChart(
            title: ChartTitle(text: 'Histograma de cores'),
            plotAreaBackgroundColor: Colors.white,
            series: <ChartSeries<int, int>>[
              ColumnSeries(
                color: const Color(AppColors.black),
                dataSource: triple.state,
                xValueMapper: (v, x) => x,
                yValueMapper: (v, x) => v,
              ),
            ],
          ),
        );
      }
    );
  }
}
