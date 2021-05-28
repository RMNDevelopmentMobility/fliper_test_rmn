import 'package:flutter_modular_test/flutter_modular_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fliper_test_rmn/app/modules/wealthsummary/wealthsummary_module.dart';

void main() {
  setUpAll(() {
    initModule(WealthSummaryModule());
  });
}
