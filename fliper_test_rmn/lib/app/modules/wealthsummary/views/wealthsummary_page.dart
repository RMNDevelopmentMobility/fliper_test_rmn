import 'package:connectivity/connectivity.dart';
import 'package:fliper_test_rmn/app/modules/wealthsummary/controllers/errors/wealthsummary_failure.dart';
import 'package:fliper_test_rmn/app/modules/wealthsummary/controllers/wealthsummary_store.dart';
import 'package:fliper_test_rmn/app/shared/utils/dialog_utils.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';

import 'cards/summary_card.dart';

class WealthSummaryPage extends StatefulWidget {
  final String title;
  const WealthSummaryPage({Key? key, this.title = 'WealthsummaryPage'})
      : super(key: key);
  @override
  WealthSummaryPageState createState() => WealthSummaryPageState();
}

class WealthSummaryPageState extends State<WealthSummaryPage> {
  final WealthSummaryStore store = Modular.get();

  final Connectivity _connectivity = Connectivity();

  @override
  void initState() {
    super.initState();

    loadData();

    reaction((_) => store.failure, (failure) {
      store.failure?.map((exceptionFail) async {
        var messageError = 'Erro de comunicação com o servidor';

        if (exceptionFail is WealthSummaryServerErrorFailure) {
          messageError =
              'Erro ao receber a resposta do servidor\n\n${exceptionFail.message}\nStatusCode: ${exceptionFail.statusCode}';
        } else if (exceptionFail is AgendamentosGenericFailure) {
          messageError = 'Erro ao processar a resposta do servidor';
        }

        await DialogUtils().openAlertBoxExternalErro(
          context,
          messageError,
          btnRetry,
          btnCancel,
        );
      });
    });
  }

  void loadData() async {
    ConnectivityResult connResult;
    connResult = await _connectivity.checkConnectivity();

    var dataResult;

    if (connResult == ConnectivityResult.none) {
      await DialogUtils().openAlertBoxNoConnection(context, btnRetry);
    } else {
      dataResult = await store.getListWealthSummary();
      store.lstWealthSummary.addAll(dataResult);
    }
  }

  void btnCancel() {
    Modular.to.pop();
  }

  void btnRetry() {
    Modular.to.pop();
    loadData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Counter'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.fromLTRB(15, 5, 15, 0),
        physics: const ScrollPhysics(),
        child: Observer(builder: (_) {
          if (store.loading) {
            return Center(child: CircularProgressIndicator());
          } else {
            if (store.lstWealthSummary.isEmpty) {
              return Container();
            } else {
              return ListView.builder(
                physics: const NeverScrollableScrollPhysics(),
                itemCount: store.lstWealthSummary.length,
                shrinkWrap: true,
                itemBuilder: (_, int index) {
                  return Column(
                    children: [SummaryCard(store.lstWealthSummary[index])],
                  );
                },
              );
            }
          }
        }),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // store.increment();
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
