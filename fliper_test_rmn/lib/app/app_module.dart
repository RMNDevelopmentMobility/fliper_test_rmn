import 'package:flutter_modular/flutter_modular.dart';

// import 'modules/home/home_module.dart';
import 'modules/wealthsummary/controllers/repositories/i_wealthsummary_repository.dart';
import 'modules/wealthsummary/controllers/wealthsummary_store.dart';
import 'modules/wealthsummary/wealthsummary_module.dart';

class AppModule extends Module {
  @override
  final List<Bind> binds = [
    Bind((i) => WealthSummaryStore(i.get<IWealthSummaryRepository>())),
  ];

  @override
  final List<ModularRoute> routes = [
    ModuleRoute(Modular.initialRoute, module: WealthSummaryModule()),
  ];
}
