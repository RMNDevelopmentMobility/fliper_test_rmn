class WealthSummaryFailure implements Exception {}

class WealthSummaryServerErrorFailure extends WealthSummaryFailure {
  // final String error;
  final String message;
  final int? statusCode;

  // ignore: sort_constructors_first
  WealthSummaryServerErrorFailure({required this.message, this.statusCode});
}

class AgendamentosNotFoundFailure extends WealthSummaryFailure {}

class AgendamentosGenericFailure extends WealthSummaryFailure {}
