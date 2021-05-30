import 'package:fliper_test_rmn/app/app_module.dart';
import 'package:fliper_test_rmn/app/modules/wealthsummary/controllers/repositories/i_wealthsummary_repository.dart';
import 'package:fliper_test_rmn/app/modules/wealthsummary/controllers/wealthsummary_store.dart';
import 'package:fliper_test_rmn/app/modules/wealthsummary/models/wealthsummary_model.dart';
import 'package:fliper_test_rmn/app/modules/wealthsummary/views/cards/summary_card.dart';
import 'package:fliper_test_rmn/app/modules/wealthsummary/views/wealthsummary_page.dart';
import 'package:fliper_test_rmn/app/modules/wealthsummary/wealthsummary_module.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_modular_test/flutter_modular_test.dart';
import 'package:flutter_test/flutter_test.dart';

import 'wealthsummary_mock.dart';

Widget makeTestableWidget({required Widget child}) {
  return MediaQuery(
    data: const MediaQueryData(),
    child: MaterialApp(
      // localizationsDelegates: [
      //   GlobalMaterialLocalizations.delegate,
      //   GlobalWidgetsLocalizations.delegate,
      // ],
      home: child,
    ),
  );
}

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

  testWidgets('WealthSummary - initModule', (WidgetTester tester) async {
    initModule(AppModule());
  });

  testWidgets('WealthSummary - Has title', (WidgetTester tester) async {
    await tester.pumpWidget(buildTestableWidget(const WealthSummaryPage()));

    await tester.runAsync(() => store!.getListWealthSummary());
    await tester.pump();

    expect(find.text('Fliper - Test Flutter [RMN]'), findsOneWidget);
  });

  testWidgets('WealthSummary - Verify Card', (WidgetTester tester) async {
    var listResult = <WealthSummaryModel>[];
    await tester.pumpWidget(buildTestableWidget(const WealthSummaryPage()));

    await tester.runAsync(() async {
      listResult = await store!.getListWealthSummary();
      store!.addAllItemsToList(listResult);
    });
    await tester.pump();

    expect(store!.lstWealthSummary.first, equals(isNotNull));

    final agendamentoCard = makeTestableWidget(
      child: SummaryCard(store!.lstWealthSummary.first, null),
    );
    await tester.pumpWidget(agendamentoCard);

    expect(find.byType(SummaryCard), findsOneWidget);
  });

  testWidgets('WealthSummary - Verify Texts', (WidgetTester tester) async {
    var listResult = <WealthSummaryModel>[];
    await tester.pumpWidget(buildTestableWidget(const WealthSummaryPage()));

    await tester.runAsync(() async {
      listResult = await store!.getListWealthSummary();
      store!.addAllItemsToList(listResult);
    });
    await tester.pump();

    expect(store!.lstWealthSummary.first, equals(isNotNull));

    final agendamentoCard = makeTestableWidget(
      child: SummaryCard(store!.lstWealthSummary.first, null),
    );
    await tester.pumpWidget(agendamentoCard);

    expect(find.byType(SummaryCard), findsOneWidget);

    expect(find.text('Seu resumo'), findsOneWidget);
    expect(find.text('Valor investido'), findsOneWidget);
    expect(find.text('Rentabilidade/mês'), findsOneWidget);
    expect(find.text('CDI'), findsOneWidget);
    expect(find.text('Ganho/mês'), findsOneWidget);
    expect(find.text('VER MAIS'), findsOneWidget);
    expect(find.byType(Text), findsNWidgets(10));
  });

  testWidgets('WealthSummary - Verify Buttons', (WidgetTester tester) async {
    var listResult = <WealthSummaryModel>[];
    await tester.pumpWidget(buildTestableWidget(const WealthSummaryPage()));

    await tester.runAsync(() async {
      listResult = await store!.getListWealthSummary();
      store!.addAllItemsToList(listResult);
    });
    await tester.pump();

    expect(store!.lstWealthSummary.first, equals(isNotNull));

    final agendamentoCard = makeTestableWidget(
      child: SummaryCard(store!.lstWealthSummary.first, null),
    );
    await tester.pumpWidget(agendamentoCard);

    expect(find.byType(SummaryCard), findsOneWidget);

    expect(find.byType(OutlinedButton), findsOneWidget);
  });
}
