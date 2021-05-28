import 'package:dartz/dartz.dart';
import 'package:mobx/mobx.dart';

import 'errors/wealthsummary_failure.dart';
import '../controllers/repositories/i_wealthsummary_repository.dart';
import '../models/wealthsummary_model.dart';

part 'wealthsummary_store.g.dart';

class WealthSummaryStore = _WealthSummaryStoreBase with _$WealthSummaryStore;

abstract class _WealthSummaryStoreBase with Store {
  final IWealthSummaryRepository wealthSummaryRepository;
  _WealthSummaryStoreBase(this.wealthSummaryRepository);

  @observable
  bool loading = false;

  @observable
  Option<WealthSummaryFailure>? failure;

  @observable
  List<WealthSummaryModel> lstWealthSummary = [];

  @action
  void addAgendamentoSolicitado(WealthSummaryModel wealthSummary) {
    lstWealthSummary.add(wealthSummary);
  }

  @action
  Future<List<WealthSummaryModel>> getListWealthSummary() async {
    final lstAllReturn = <WealthSummaryModel>[];
    loading = true;
    failure = none();

    final eitherResponse = await wealthSummaryRepository.fetchWealthSummary();

    eitherResponse.fold(
      (error) {
        failure = optionOf(error);
        loading = false;
      },
      (listResult) {
        loading = false;
        lstAllReturn.addAll(listResult);
      },
    );

    return lstAllReturn;
  }
}
