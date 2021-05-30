import '../models/wealthsummary_model.dart';

class ResultQueryModel {
  List<WealthSummaryModel>? queryResult;

  ResultQueryModel({this.queryResult});

  ResultQueryModel.fromJson(Map<String, dynamic> json) {
    if (json['data']['wealthSummary'] != null) {
      queryResult = <WealthSummaryModel>[];

      json['data']['wealthSummary'].forEach((item) {
        queryResult!.add(new WealthSummaryModel.fromJson(item));
      });
    }
  }
}
