
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class ColorHistogramChart extends StatelessWidget {
  final List<int> colorHistogram;

  const ColorHistogramChart({
    super.key,
    required this.colorHistogram,
  });

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 1.3,
      child: SfCartesianChart(
        primaryXAxis: CategoryAxis(
          labelStyle: const TextStyle(),
        ),
        primaryYAxis: CategoryAxis(
          name: "Histograma de Cores",
          labelStyle: const TextStyle(),
        ),
        plotAreaBackgroundColor: Colors.white,
        series: <ChartSeries<int, int>>[
          ColumnSeries(
            dataSource: colorHistogram,
            xValueMapper: (v, x) => x,
            yValueMapper: (v, x) => v,
          ),
        ],
      ),
    );
  }
}
