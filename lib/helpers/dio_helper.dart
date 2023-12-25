import 'package:demo/helpers/cash.dart';
import 'package:demo/widgets/toast.dart';
import 'package:dio/dio.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DioConfiguration {
  static Dio? _dio;

  static Dio getDio() {
    if (_dio == null) {
      _dio = Dio(
        BaseOptions(
          baseUrl: 'https://helasaf.spider-te8.com/api/',
          receiveDataWhenStatusError: true,
        ),
      );
      _dio!.interceptors.add(
        PrettyDioLogger(
          requestHeader: true,
          requestBody: true,
          responseBody: true,
          responseHeader: true,
          error: true,
          compact: true,
          maxWidth: 90,
        ),
      );
    }
    return _dio!;
  }
}

class DioHelper {
  static final Dio _dio = DioConfiguration.getDio();

  static Future<Response?> getData({
    String? path,
    Map<String, dynamic>? queryParameters,
  }) async {
    try {
      final response = await _dio.get(
        path!,
        queryParameters: queryParameters,
        options: Options(validateStatus: (_) => true, headers: _getHeaders()),
      );
      return response;
    } catch (e) {
      _handleError(e);
      return null;
    }
  }

  static Future<Response?> putData({
    String? path,
    dynamic data,
  }) async {
    try {
      final response = await _dio.put(
        path!,
        data: data,
        options: Options(validateStatus: (_) => true, headers: _getHeaders()),
      );
      return response;
    } catch (e) {
      _handleError(e);
      return null;
    }
  }

  static Future<Response?> postData({
    String? path,
    dynamic data,
    Map<String, dynamic>? params,
  }) async {
    try {
      final response = await _dio.post(
        path!,
        data: data,
        queryParameters: params,
        options: Options(
          contentType: 'application/json',
          headers: _getHeaders(),
          followRedirects: false,
        ),
      );
      return response;
    } catch (e) {
      _handleError(e);
      return null;
    }
  }

  static Map<String, dynamic> _getHeaders() {
    final headers = {
      'Accept': 'application/json',
      'content-type': 'application/json',
      'Accept-Language': CashedHelper.getLang(),
    };
    final userToken = CashedHelper.getUserToken();
    if (userToken.isNotEmpty) {
      headers['Authorization'] = 'Bearer $userToken';
    }
    return headers;
  }

  static void _handleError(dynamic error) {
    if (error is DioException) {
      print(error.toString());
      print(error.response?.data);
      print(error.response?.statusCode);
      print(error.response?.statusMessage);
      final response = error.response;
      if (response != null) {
        errorToast(response.data['message']);
        if (response.data['message'] == 'Unauthenticated.') {
          clearCachedData();
        }
      } else {
        errorToast(error.message.toString());
      }
    } else {
      errorToast(error.toString());
    }
  }
}

Future<void> clearCachedData() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  prefs.clear();
}
