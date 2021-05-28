// import 'package:dio/dio.dart';
import 'package:hasura_connect/hasura_connect.dart';
import 'package:fliper_test_rmn/app/shared/constants/app_constants.dart';

class CustomHasuraInterceptors extends InterceptorBase {
  @override
  Future<Request?> onRequest(Request request) async {
    try {
      request.headers.addAll({
        "Content-Type": "application/json; charset=utf-8",
        "x-hasura-admin-secret": HASURA_ADMIN_SECRET,
      });
      return request;
    } catch (e) {
      return null;
    }
  }
}
