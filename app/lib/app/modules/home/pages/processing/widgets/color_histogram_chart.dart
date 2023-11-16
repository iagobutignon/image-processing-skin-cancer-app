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
    return Container(
      clipBehavior: Clip.hardEdge,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
      ),
      child: Stack(
        children: [
          TripleBuilder<ColorHistogramChartStore, List<int>>(
            store: store,
            builder: (context, triple) {        
              return AspectRatio(
                aspectRatio: 2.5,
                child: SfCartesianChart(
                  primaryXAxis: NumericAxis(
                    minimum: 0,
                    maximum: 260,
                  ),
                  primaryYAxis: NumericAxis(),
                  plotAreaBackgroundColor: const Color(AppColors.grey).withAlpha(50),
                  series: <ChartSeries<int, int>>[
                    ColumnSeries<int, int>(
                      color: const Color(AppColors.black),
                      dataSource: triple.state,
                      xValueMapper: (int v, int x) => x,
                      yValueMapper: (int v, int x) => v,
                    ),
                  ],
                ),
              );
            }
          ),
          Positioned(
            top: 10,
            right: 10,
            child: Container(
              padding: const EdgeInsets.only(left: 15),
              decoration: BoxDecoration(
                color: Colors.white.withAlpha(175),
                borderRadius: const BorderRadius.only(bottomLeft: Radius.circular(18)),
              ),
              child: Text(
                'Histograma de cores',
                style: TextStyle(
                  color: const Color(AppColors.black).withAlpha(200),
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
