class WealthSummaryFailure implements Exception {}

class WealthSummaryServerErrorFailure extends WealthSummaryFailure {
  // final String error;
  final String message;
  final int? statusCode;

  WealthSummaryServerErrorFailure({required this.message, this.statusCode});
}

class WealthSummaryNotFoundFailure extends WealthSummaryFailure {}

class WealthSummaryGenericFailure extends WealthSummaryFailure {}
