import 'package:intl/intl.dart';

class FormatterUtils {
  String putMaskInCPF(String inputCPF) {
    String formattedCPF;
    if (inputCPF.length == 11) {
      formattedCPF = "${inputCPF.substring(0, 3)}.";
      formattedCPF += "${inputCPF.substring(3, 6)}.";
      formattedCPF += "${inputCPF.substring(6, 9)}-";
      formattedCPF += inputCPF.substring(9, 11);
      return formattedCPF;
    } else {
      return inputCPF;
    }
  }

  String formatDoubleToReal(double value) =>
      NumberFormat.currency(locale: "pt_BR", symbol: "R\$", name: "Real")
          .format(value);

  String formatDoubleToPercent(double value, int quantityDecimals) {
    final String strIntPart = value.toString().split('.').first;
    final String strDecimalPart = value.toString().split('.').last;
    final lenToCut = (quantityDecimals > strDecimalPart.length)
        ? strDecimalPart.length
        : quantityDecimals;
    return '$strIntPart,${strDecimalPart.substring(0, lenToCut)}%';
  }
}
