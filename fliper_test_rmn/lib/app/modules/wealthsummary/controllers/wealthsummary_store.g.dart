// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'wealthsummary_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$WealthSummaryStore on _WealthSummaryStoreBase, Store {
  final _$loadingAtom = Atom(name: '_WealthSummaryStoreBase.loading');

  @override
  bool get loading {
    _$loadingAtom.reportRead();
    return super.loading;
  }

  @override
  set loading(bool value) {
    _$loadingAtom.reportWrite(value, super.loading, () {
      super.loading = value;
    });
  }

  final _$failureAtom = Atom(name: '_WealthSummaryStoreBase.failure');

  @override
  Option<WealthSummaryFailure>? get failure {
    _$failureAtom.reportRead();
    return super.failure;
  }

  @override
  set failure(Option<WealthSummaryFailure>? value) {
    _$failureAtom.reportWrite(value, super.failure, () {
      super.failure = value;
    });
  }

  final _$lstWealthSummaryAtom =
      Atom(name: '_WealthSummaryStoreBase.lstWealthSummary');

  @override
  List<WealthSummaryModel> get lstWealthSummary {
    _$lstWealthSummaryAtom.reportRead();
    return super.lstWealthSummary;
  }

  @override
  set lstWealthSummary(List<WealthSummaryModel> value) {
    _$lstWealthSummaryAtom.reportWrite(value, super.lstWealthSummary, () {
      super.lstWealthSummary = value;
    });
  }

  final _$getListWealthSummaryAsyncAction =
      AsyncAction('_WealthSummaryStoreBase.getListWealthSummary');

  @override
  Future<List<WealthSummaryModel>> getListWealthSummary() {
    return _$getListWealthSummaryAsyncAction
        .run(() => super.getListWealthSummary());
  }

  final _$_WealthSummaryStoreBaseActionController =
      ActionController(name: '_WealthSummaryStoreBase');

  @override
  void addAgendamentoSolicitado(WealthSummaryModel wealthSummary) {
    final _$actionInfo = _$_WealthSummaryStoreBaseActionController.startAction(
        name: '_WealthSummaryStoreBase.addAgendamentoSolicitado');
    try {
      return super.addAgendamentoSolicitado(wealthSummary);
    } finally {
      _$_WealthSummaryStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
loading: ${loading},
failure: ${failure},
lstWealthSummary: ${lstWealthSummary}
    ''';
  }
}
