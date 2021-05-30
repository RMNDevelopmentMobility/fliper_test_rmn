import 'package:fliper_test_rmn/app/shared/colors/app_colors.dart';
import 'package:flutter/material.dart';

class DialogUtils {
  static final DialogUtils _instance = DialogUtils.internal();

  factory DialogUtils() {
    return _instance;
  }

  DialogUtils.internal();

  bool hasTwoButtons = false;

  Future<T> openAlertBox<T>(
    BuildContext context, {
    required Widget imgTitle,
    required String title,
    required String message,
    String? okBtnText,
    String? cancelBtnText,
    Function()? okBtnFunction,
    Function()? cancelBtnFunction,
  }) async {
    hasTwoButtons = (cancelBtnFunction != null) && (okBtnFunction != null);

    return await showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          var txtStyleMessage = const TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.normal,
            fontFamily: 'KyrialSansPro',
          );
          if (message.length > 100) {
            txtStyleMessage = const TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.normal,
              fontFamily: 'KyrialSansPro',
            );
          }
          return AlertDialog(
            shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(14.0))),
            contentPadding: const EdgeInsets.fromLTRB(5, 23, 5, 0),
            content: SizedBox(
              width: MediaQuery.of(context).size.width - 50,
              height: 245.0,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  imgTitle,
                  Container(
                    height: 20.5,
                  ),
                  Text(
                    title,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.normal,
                      fontFamily: 'KyrialSansPro',
                    ),
                  ),
                  Container(
                    height: 11,
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
                    child: Text(
                      message,
                      overflow: TextOverflow.visible,
                      textAlign: TextAlign.center,
                      style: txtStyleMessage,
                    ),
                  ),
                  Expanded(
                    child: Container(),
                  ),
                  const Divider(
                    color: AppColors.popupGray,
                    height: 2.0,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Visibility(
                        visible: hasTwoButtons,
                        child: Expanded(
                          child: InkWell(
                            onTap: cancelBtnFunction,
                            child: SizedBox(
                              width: hasTwoButtons
                                  ? (MediaQuery.of(context).size.width - 50) / 2
                                  : 0,
                              height: 48,
                              child: Padding(
                                padding: const EdgeInsets.only(top: 15),
                                child: Text(
                                  (cancelBtnText != null)
                                      ? cancelBtnText
                                      : "...",
                                  textAlign: TextAlign.center,
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(
                                    color: AppColors.textGray,
                                    fontSize: hasTwoButtons ? 14 : 18,
                                    fontWeight: FontWeight.normal,
                                    fontFamily: 'KyrialSansProSemiBold',
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Visibility(
                        visible: hasTwoButtons,
                        child: Container(
                          height: 48.0,
                          width: 0.5,
                          color: AppColors.textGray,
                          margin: const EdgeInsets.only(left: 1.0, right: 1.0),
                        ),
                      ),
                      Expanded(
                        child: InkWell(
                          onTap: okBtnFunction,
                          child: SizedBox(
                            width: hasTwoButtons
                                ? (MediaQuery.of(context).size.width - 50) / 2
                                : MediaQuery.of(context).size.width - 50,
                            height: 48,
                            child: Padding(
                              padding: const EdgeInsets.only(top: 15),
                              child: Text(
                                (okBtnText != null) ? okBtnText : "...",
                                textAlign: TextAlign.center,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                  color: AppColors.mainBlue,
                                  fontSize: hasTwoButtons ? 14 : 18,
                                  fontWeight: FontWeight.normal,
                                  fontFamily: 'KyrialSansProSemiBold',
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          );
        });
  }

  Future openAlertBoxNoConnection(
    BuildContext context,
    Function() btnFunction,
  ) {
    return openAlertBox(
      context,
      imgTitle: const Icon(
        Icons.wifi_off,
        color: AppColors.mainBlue,
        size: 60.0,
      ),
      title: "Falha na conexão",
      message:
          "Ops! Parece que você está sem acesso à internet. Verifique e tente novamente.",
      okBtnText: "Tentar de novo",
      cancelBtnText: null,
      okBtnFunction: btnFunction,
      cancelBtnFunction: null,
    );
  }

  Future openAlertBoxExternalErro(
    BuildContext context,
    String messageExternalErro,
    Function() okBtnFunctionError,
    Function()? cancelBtnFunctionError,
  ) {
    return openAlertBox(
      context,
      imgTitle: const Icon(
        Icons.error,
        color: AppColors.mainBlue,
        size: 60.0,
      ),
      title: "Desculpe",
      message: messageExternalErro,
      okBtnText:
          (cancelBtnFunctionError != null) ? "Tentar novamente" : "Fechar",
      cancelBtnText: "Cancelar",
      okBtnFunction: okBtnFunctionError,
      cancelBtnFunction: cancelBtnFunctionError,
    );
  }
}
