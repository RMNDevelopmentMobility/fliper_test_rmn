import 'dart:io';

import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:connectivity/connectivity.dart';

import '/app/shared/colors/app_colors.dart';
import '/app/shared/utils/dialog_utils.dart';

import '../controllers/errors/wealthsummary_failure.dart';
import '../controllers/wealthsummary_store.dart';
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
        } else if (exceptionFail is WealthSummaryGenericFailure) {
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
      store.clearWealthSummaryList();
      store.addAllItemsToList(dataResult);
    }
  }

  void btnCancel() {
    Modular.to.pop();
  }

  void btnRetry() {
    Modular.to.pop();
    loadData();
  }

  Future<bool> btnExit() {
    exit(0);
  }

  Future<bool> _onBackPressed() async {
    return await DialogUtils().openAlertBox(
      context,
      imgTitle: const Icon(
        Icons.exit_to_app,
        color: AppColors.mainBlue,
        size: 60.0,
      ),
      title: "Sair do aplicativo",
      message: "Deseja realmente sair do aplicativo?",
      okBtnText: "Sim",
      cancelBtnText: "Cancelar",
      okBtnFunction: btnExit,
      cancelBtnFunction: btnCancel,
    );
  }

  @override
  Widget build(BuildContext context) {
    final double paddingTop = MediaQuery.of(context).size.height / 10;

    return Scaffold(
      appBar: AppBar(
        title: Text('Fliper Flutter Test [RMN]'),
        actions: [
          Transform.translate(
            offset: const Offset(10.0, 0),
            child: TextButton(
              style: ButtonStyle(
                  padding: MaterialStateProperty.all(
                const EdgeInsets.all(0.0),
              )),
              onPressed: _onBackPressed,
              child: const Icon(
                Icons.exit_to_app,
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
      backgroundColor: AppColors.screenBackground,
      body: SingleChildScrollView(
        padding: EdgeInsets.fromLTRB(15, paddingTop, 15, 0),
        physics: const ScrollPhysics(),
        child: Observer(builder: (_) {
          if (store.loading) {
            return Center(
                child: CircularProgressIndicator(
              color: AppColors.mainBlue,
            ));
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
                    children: [
                      SummaryCard(store.lstWealthSummary[index], loadData),
                    ],
                  );
                },
              );
            }
          }
        }),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: Icon(Icons.add),
      ),
    );
  }
}
