import 'package:fliper_test_rmn/app/modules/wealthsummary/controllers/repositories/i_wealthsummary_repository.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'controllers/repositories/wealthsummary_repository.dart';
import 'controllers/wealthsummary_store.dart';
import 'views/wealthsummary_page.dart';

class WealthSummaryModule extends Module {
  @override
  final List<Bind> binds = [
    Bind((i) => WealthSummaryStore(i.get())),
    Bind<IWealthSummaryRepository>((i) => WealthSummaryRepository()),
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute('/', child: (_, args) => WealthSummaryPage()),
  ];
}
