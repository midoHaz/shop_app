import 'package:dio/dio.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

class DioHelper {
  static late Dio dio;

  static init() {
    dio = Dio(BaseOptions(
        baseUrl: 'https://student.valuxapps.com/api/',
        receiveDataWhenStatusError: true,
        headers: {'Content-Type': 'application/json'}));
        dio.interceptors.add(PrettyDioLogger());

  }

  static Future<Response> getData(
      {required String url,
      required Map<String, dynamic> query,
      String lang = 'ar',
      String? token}) async {
    dio.options.headers = {'lang': lang, 'Authorization': token};
    return await dio.get(url, queryParameters: query);
  }

  static Future<Response> postData(
      {required String url,
      Map<String, dynamic>? query,
      required Map<String, dynamic> data,
      String lang = 'ar',
      String? token}) async {
    dio.options.headers = {'lang': lang, 'Authorization': token};
    return await dio.post(url, queryParameters: query, data: data);
  }
}
