import 'package:flutter/material.dart';

import '/app/shared/colors/app_colors.dart';

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
            color: AppColors.textGray,
            fontSize: 16,
          ),
          overflow: TextOverflow.ellipsis,
          maxLines: 1,
        ),
        Spacer(),
        Text(
          textValue,
          style: TextStyle(
            color: AppColors.mainBlue,
            fontSize: 18,
            fontWeight: FontWeight.w900,
          ),
        ),
      ],
    );
  }
}
