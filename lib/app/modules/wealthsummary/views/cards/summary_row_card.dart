import 'package:fliper_test_rmn/app/shared/colors/app_colors.dart';
import 'package:flutter/material.dart';

class SummaryRowCard extends StatelessWidget {
  const SummaryRowCard({
    required this.textTitle,
    required this.textValue,
  });

  final String textTitle;
  final String textValue;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text(
          textTitle,
          style: TextStyle(
            color: AppColors.text,
            fontSize: 16,
          ),
          overflow: TextOverflow.ellipsis,
          maxLines: 1,
        ),
        Spacer(),
        Text(
          textValue,
          style: TextStyle(
            color: AppColors.darkBlue,
            fontSize: 18,
            fontWeight: FontWeight.w900,
          ),
        ),
      ],
    );
  }
}
