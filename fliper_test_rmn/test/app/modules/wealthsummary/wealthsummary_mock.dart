import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:fliper_test_rmn/app/modules/wealthsummary/controllers/errors/wealthsummary_failure.dart';
import 'package:fliper_test_rmn/app/modules/wealthsummary/controllers/repositories/i_wealthsummary_repository.dart';
import 'package:fliper_test_rmn/app/modules/wealthsummary/models/result_query_model.dart';
import 'package:fliper_test_rmn/app/modules/wealthsummary/models/wealthsummary_model.dart';
import 'package:flutter/services.dart';

class WealthSummaryMock implements IWealthSummaryRepository {
  @override
  Future<Either<WealthSummaryFailure, List<WealthSummaryModel>>>
      fetchWealthSummary() async {
    try {
      var mockJson;

      await rootBundle
          .loadString("assets/json/wealthsummary_mock.json")
          .then((value) {
        mockJson = json.decode(value);
      });

      var lstResult = ResultQueryModel.fromJson(mockJson).queryResult;

      return Right(lstResult!);
    } catch (e) {
      return Left(WealthSummaryGenericFailure());
    }
  }
}
