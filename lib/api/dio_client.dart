import 'package:dio/dio.dart';
import 'package:infinity_hr/api/api_urls.dart';
import 'package:infinity_hr/utils/common_utils.dart';

class DioClient {
  static Dio? dio;

  static Dio? getDioClient() {
    if (dio == null) {
      dio = Dio();
      dio!.options.baseUrl = ApiUrls.baseUrl;
      dio!.options.connectTimeout = CommonUtils.CONNECTION_TIME_OUT_IN_MILL_SEC;
      dio!.options.receiveTimeout = CommonUtils.RECEIVE_TIME_OUT_IN_MILL_SEC;
    }
    return dio;
  }
}
