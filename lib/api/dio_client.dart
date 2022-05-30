import 'package:dio/dio.dart';
import 'package:infinity_hr/api/api_urls.dart';
import 'package:infinity_hr/utils/commona_utils.dart';

class DioClient {
  static Dio? dio = null;

  static Dio? getDioClient() {
    if (dio == null) {
      dio = Dio();
      dio!.options.baseUrl = ApiUrls.BASE_URL;
      dio!.options.connectTimeout = CommonUtils.CONNECTION_TIME_OUT_IN_MILL_SEC;
      dio!.options.receiveTimeout = CommonUtils.RECEIVE_TIME_OUT_IN_MILL_SEC;
    }
    return dio;
  }
}
