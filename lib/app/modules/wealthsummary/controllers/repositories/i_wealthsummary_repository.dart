import 'package:dartz/dartz.dart';

import '../../controllers/errors/wealthsummary_failure.dart';
import '../../models/wealthsummary_model.dart';

abstract class IWealthSummaryRepository {
  Future<Either<WealthSummaryFailure, List<WealthSummaryModel>>>
      fetchWealthSummary();
}
