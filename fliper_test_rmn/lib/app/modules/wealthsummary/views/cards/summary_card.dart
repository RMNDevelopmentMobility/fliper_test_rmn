import 'package:fliper_test_rmn/app/modules/wealthsummary/models/wealthsummary_model.dart';
import 'package:fliper_test_rmn/app/modules/wealthsummary/views/cards/summary_row_card.dart';
import 'package:fliper_test_rmn/app/shared/colors/app_colors.dart';
import 'package:fliper_test_rmn/app/shared/utils/formatter_utils.dart';
import 'package:flutter/material.dart';

class SummaryCard extends StatelessWidget {
  const SummaryCard(this._wealthSummaryModel);

  final WealthSummaryModel _wealthSummaryModel;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Card(
        elevation: 3,
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
        child: Container(
          margin: const EdgeInsets.fromLTRB(24, 24, 24, 14),
          child: Column(
            children: <Widget>[
              Container(
                margin: const EdgeInsets.fromLTRB(0, 0, 0, 35),
                child: Row(
                  children: <Widget>[
                    Text(
                      'Seu resumo',
                      style: TextStyle(
                        color: AppColors.darkBlue,
                        fontSize: 25,
                        fontWeight: FontWeight.w900,
                      ),
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                    ),
                    Spacer(),
                    PopupMenuButton(
                      icon: Icon(Icons.more_vert, color: AppColors.popupMenu),
                      tooltip: 'Mostrar menu',
                      itemBuilder: (BuildContext context) {
                        return [
                          PopupMenuItem(child: Text('Recarregar')),
                        ];
                      },
                    ),
                  ],
                ),
              ),
              Container(
                margin: const EdgeInsets.fromLTRB(0, 0, 0, 35),
                child: Column(
                  children: <Widget>[
                    Container(
                      margin: const EdgeInsets.fromLTRB(0, 0, 0, 7),
                      child: Text(
                        'Valor investido',
                        style: TextStyle(
                          fontSize: 16,
                          color: AppColors.text,
                        ),
                      ),
                    ),
                    Text(
                      FormatterUtils().formatDoubleToReal(
                          _wealthSummaryModel.total.toDouble()),
                      style: TextStyle(
                        fontSize: 22,
                        color: AppColors.darkBlue,
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                margin: const EdgeInsets.fromLTRB(0, 0, 0, 10),
                child: SummaryRowCard(
                  textTitle: 'Rentabilidade/mês',
                  textValue: FormatterUtils().formatDoubleToPercent(
                      _wealthSummaryModel.profitability, 3),
                ),
              ),
              Container(
                margin: const EdgeInsets.fromLTRB(0, 0, 0, 10),
                child: SummaryRowCard(
                  textTitle: 'CDI',
                  textValue: FormatterUtils()
                      .formatDoubleToPercent(_wealthSummaryModel.cdi, 2),
                ),
              ),
              Container(
                margin: const EdgeInsets.fromLTRB(0, 0, 0, 25),
                child: SummaryRowCard(
                  textTitle: 'Ganho/mês',
                  textValue: FormatterUtils()
                      .formatDoubleToReal(_wealthSummaryModel.gain),
                ),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Divider(
                    height: 0.5,
                    thickness: 1.5,
                    indent: 0,
                    endIndent: 0,
                  ),
                ],
              ),
              if (_wealthSummaryModel.hasHistory)
                Container(
                  margin: const EdgeInsets.fromLTRB(0, 20, 0, 0),
                  alignment: Alignment.centerRight,
                  child: SizedBox(
                    width: MediaQuery.of(context).size.width * 0.25,
                    child: OutlinedButton(
                      child: Text(
                        'VER MAIS',
                        style: TextStyle(
                          fontSize: 16,
                          color: AppColors.darkBlue,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      style: OutlinedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(25.0),
                        ),
                        padding: const EdgeInsets.fromLTRB(13, 6, 13, 6),
                        side: BorderSide(
                          width: 1,
                          color: AppColors.darkBlue,
                        ),
                      ),
                      onPressed: () {},
                    ),
                  ),
                )
            ],
          ),
        ),
      ),
    );
  }
}
