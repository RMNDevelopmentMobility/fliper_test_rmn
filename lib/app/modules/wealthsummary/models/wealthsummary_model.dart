class WealthSummaryModel {
  int id;
  double cdi;
  double gain;
  bool hasHistory;
  double profitability;
  double total;

  WealthSummaryModel(
      {required this.id,
      required this.cdi,
      required this.gain,
      required this.hasHistory,
      required this.profitability,
      required this.total});

  factory WealthSummaryModel.fromJson(Map<String, dynamic> json) {
    return WealthSummaryModel(
      id: json['id'],
      cdi: double.parse(json['cdi'].toString()),
      gain: double.parse(json['gain'].toString()),
      hasHistory: json['hasHistory'],
      profitability: double.parse(json['profitability'].toString()),
      total: double.parse(json['total'].toString()),
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['cdi'] = this.cdi;
    data['gain'] = this.gain;
    data['hasHistory'] = this.hasHistory;
    data['profitability'] = this.profitability;
    data['total'] = this.total.toDouble();
    return data;
  }
}
