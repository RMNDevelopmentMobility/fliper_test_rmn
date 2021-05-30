import 'package:dartz/dartz.dart';
import 'package:fliper_test_rmn/app/modules/wealthsummary/controllers/errors/wealthsummary_failure.dart';
import 'package:fliper_test_rmn/app/modules/wealthsummary/models/wealthsummary_model.dart';

abstract class IWealthSummaryRepository {
  Future<Either<WealthSummaryFailure, List<WealthSummaryModel>>>
      fetchWealthSummary();
}
