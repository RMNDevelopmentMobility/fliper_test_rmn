class WealthSummaryModel {
  int id;
  double cdi;
  double gain;
  bool hasHistory;
  double profitability;
  int total;

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
      cdi: json['cdi'],
      gain: json['gain'],
      hasHistory: json['hasHistory'],
      profitability: json['profitability'],
      total: json['total'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['cdi'] = this.cdi;
    data['gain'] = this.gain;
    data['hasHistory'] = this.hasHistory;
    data['profitability'] = this.profitability;
    data['total'] = this.total;
    return data;
  }
}
