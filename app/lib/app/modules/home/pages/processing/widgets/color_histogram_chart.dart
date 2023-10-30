
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import '../../../../../../shared/colors/app_colors.dart';

class ColorHistogramChart extends StatelessWidget {
  final List<int> colorHistogram;

  const ColorHistogramChart({
    super.key,
    required this.colorHistogram,
  });

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 2,
      child: SfCartesianChart(
        title: ChartTitle(text: 'Histograma de cores'),
        plotAreaBackgroundColor: Colors.white,
        series: <ChartSeries<int, int>>[
          ColumnSeries(
            color: const Color(AppColors.black),
            dataSource: colorHistogram,
            xValueMapper: (v, x) => x,
            yValueMapper: (v, x) => v,
          ),
        ],
      ),
    );
  }
}
