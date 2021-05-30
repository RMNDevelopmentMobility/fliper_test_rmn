import 'package:fliper_test_rmn/app/modules/wealthsummary/controllers/repositories/i_wealthsummary_repository.dart';
import 'package:fliper_test_rmn/app/modules/wealthsummary/controllers/wealthsummary_store.dart';
import 'package:fliper_test_rmn/app/modules/wealthsummary/models/wealthsummary_model.dart';
import 'package:fliper_test_rmn/app/modules/wealthsummary/wealthsummary_module.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_modular_test/flutter_modular_test.dart';
import 'package:flutter_test/flutter_test.dart';

import 'wealthsummary_mock.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  initModule(WealthSummaryModule(), replaceBinds: [
    Bind((i) => WealthSummaryStore(i.get())),
    Bind<IWealthSummaryRepository>((i) => WealthSummaryMock()),
  ]);
  WealthSummaryStore? store;

  setUpAll(() {
    store = Modular.get();
  });

  group('WealthSummaryStore Test', () {
    test("InstanceOf Test", () {
      expect(store, isInstanceOf<WealthSummaryStore?>());
    });

    test("Get ListWealthSummary", () async {
      store!.lstWealthSummary = await store!.getListWealthSummary();

      expect(store!.lstWealthSummary.length, equals(1));
      expect(store!.lstWealthSummary[0].id, equals(2));
    });

    test("Clear WealthSummaryList", () async {
      store!.lstWealthSummary = await store!.getListWealthSummary();
      expect(store!.lstWealthSummary.length, equals(1));

      store!.clearWealthSummaryList();
      expect(store!.lstWealthSummary.length, equals(0));
    });

    test("Add AllItemsToList", () async {
      var listResult = <WealthSummaryModel>[];

      listResult = await store!.getListWealthSummary();
      expect(listResult.length, equals(1));

      store!.addAllItemsToList(listResult);
      expect(store!.lstWealthSummary.length, equals(1));
      expect(store!.lstWealthSummary[0].id, equals(2));
      expect(store!.lstWealthSummary[0].cdi, equals(3.45679));
      expect(store!.lstWealthSummary[0].gain, equals(1833.23));
      expect(store!.lstWealthSummary[0].hasHistory, equals(true));
      expect(store!.lstWealthSummary[0].profitability, equals(2.76789));
      expect(store!.lstWealthSummary[0].total, equals(3200876));
    });
  });
}
