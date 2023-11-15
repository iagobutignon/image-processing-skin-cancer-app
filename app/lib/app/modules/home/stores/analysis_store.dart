import 'package:flutter_triple/flutter_triple.dart';

import '../routes/home_routes.dart';
import '../states/analysis_state.dart';
class AnalysisStore extends Store<AnalysisState> {
  AnalysisStore() : super(AnalysisState());

  Future<void> done() async {
    HomeRoutes().navigateHome();
  }
}