import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../../../../core/colors/app_colors.dart';
import '../../../../../core/themes/app_theme.dart';
import '../../../shared/widgets/large_button.dart';
import '../../stores/analysis_store.dart';
import 'widgets/arc_chart.dart';

class AnalysisPage extends StatefulWidget {
  final String title;

  const AnalysisPage({
    super.key,
    this.title = 'Resultado da análise',
  });

  @override
  State<AnalysisPage> createState() => _AnalysisPageState();
}

class _AnalysisPageState extends State<AnalysisPage> {
  late final AnalysisStore store;

  @override
  void initState() {
    super.initState();
    store = Modular.get<AnalysisStore>();
  }

  @override
  void dispose() {
    Modular.dispose<AnalysisStore>();
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
        child: Column(
          children: [
            const Spacer(),
            const Text(
              'ATENÇÃO!\n',
              style: TextStyle(
                fontSize: 22,
                color: Color(AppColors.red),
              ),
            ),
            Text(
              store.state.analysisText,
              textAlign: TextAlign.center,
            ),
            const Text(
              'O resultado abaixo deve ser desconsiderado!',
              style: TextStyle(
                fontSize: 17,
                color: Color(AppColors.red),
              ),
            ),
            const ArcChart(
              label: 'Probabilidade de melanoma',
              value: 0.57,
            ),
            const Spacer(),
            LargeButton(
              label: 'Concluir',
              onPressed: store.done,
            ),
          ],
        ),
      ),
    );
  }
}
