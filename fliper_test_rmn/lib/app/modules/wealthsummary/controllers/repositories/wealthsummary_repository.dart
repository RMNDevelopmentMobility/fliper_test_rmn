import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:fliper_test_rmn/app/modules/wealthsummary/controllers/errors/wealthsummary_failure.dart';
import 'package:fliper_test_rmn/app/modules/wealthsummary/controllers/repositories/i_wealthsummary_repository.dart';
import 'package:fliper_test_rmn/app/modules/wealthsummary/models/result_query_model.dart';
import 'package:fliper_test_rmn/app/modules/wealthsummary/models/wealthsummary_model.dart';
import 'package:fliper_test_rmn/app/shared/constants/app_constants.dart';
import 'package:fliper_test_rmn/app/shared/http/interceptors/custom_hasura_interceptors.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:hasura_connect/hasura_connect.dart';

class WealthSummaryRepository implements IWealthSummaryRepository {
  @override
  Future<Either<WealthSummaryFailure, List<WealthSummaryModel>>>
      fetchWealthSummary() async {
    try {
      final url = BASE_URL + WEALTHSUMMARY_ENDPOINT;
      final customInterceptor = CustomHasuraInterceptors();

      HasuraConnect hasuraConnect =
          HasuraConnect(url, interceptors: [customInterceptor]);

      String docQuery = """
                            query WSummaryQuery {
                              wealthSummary {
                                id
                                cdi
                                gain
                                hasHistory
                                profitability
                                total
                              }
                          }
                        """;

      var response = await hasuraConnect.query(docQuery);

      var lstResult = ResultQueryModel.fromJson(response).queryResult;

      return Right(lstResult!);
    } on HasuraError catch (e) {
      if (kDebugMode) {
        debugPrint("### fetchWealthSummary - on HasuraError catch: $e");
      }

      return Left(WealthSummaryServerErrorFailure(
        message: e.message,
        // statusCode: e.response!.statusCode,
      ));
    } catch (e) {
      if (kDebugMode) debugPrint("### fetchWealthSummary - catch: $e");

      return Left(AgendamentosGenericFailure());
    }
  }
}
