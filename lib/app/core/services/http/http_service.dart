import 'package:blood_finder/app/core/services/internet_connectivity/internet_connectivity.dart';
import 'package:blood_finder/app/core/services/storage_service/shared_preference.dart';
import 'package:blood_finder/app/data/enum/enum.dart';
import 'package:blood_finder/app/utils/device_info.dart';
import 'package:blood_finder/app/widgets/modals/no_internet_connection_modal.dart';
import 'package:dio/dio.dart';
import 'package:get/instance_manager.dart';

abstract class HttpService {
  /// Initialize HTTP service
  void init();

  /// HTTP get method
  Future<Response> get(String url, {Map<String, dynamic> queryParams});

  /// HTTP post method
  Future<Response> post(String url, {dynamic data});

  /// HTTP patch method
  Future<Response> patch(String url,
      {dynamic data, Map<String, dynamic> queryParams});

  /// HTTP delete method
  Future<Response> delete(String url,
      {dynamic data, Map<String, dynamic> queryParams});
}

class HttpServiceImpl implements HttpService {
  Dio _dio;
  SharedPref pref = SharedPref.instance;
  final internetController = Get.find<InternetConnectivityController>();

  @override
  void init() {
    _dio = Dio(BaseOptions(
        // baseUrl: ApiUrl.PROD,
        followRedirects: false,
        validateStatus: (status) {
          return status <= 500;
        },
        headers: {"Content-Type": "application/json"}));

    initializeInterceptors();
  }

  /// intercept the http request
  initializeInterceptors() {
    _dio.interceptors
        .add(InterceptorsWrapper(onRequest: (options, handler) async {
      options.headers.addAll({
        "device-name": DeviceInfo.name.toString(),
        "device-id": DeviceInfo.id.toString(),
        "Authorization": await getAuthToken(),
        "dealer-id": "1"
      });
      print("${options.method} | ${options.path}");
      return handler.next(options);
    }, onResponse: (response, handler) {
      print("${response.statusCode} ${response.statusMessage}");
      if (response.statusCode != 200) return handler.next(response);
    }, onError: (DioError e, handler) {
      print("============== DIO INTERCEPTOR ERROR ==============");
      print(e.message);
      return handler.next(e);
    }));
  }

  Future<String> getAuthToken() async {
    String token = await pref.read(SHARED_DATA.TOKEN.toString());
    return "Bearer $token".replaceAll('"', '');
  }

  @override
  Future<Response> get(String url, {Map<String, dynamic> queryParams}) async {
    Response response;
    if (!internetController.isInternetConnected.value) {
      NoInternetConnectionModal();
      return response;
    }
    try {
      response = await _dio.get(url, queryParameters: queryParams);
    } on DioError catch (e) {
      print(e.message);
      throw Exception(e.message);
    }
    return response;
  }

  @override
  Future<Response> post(String url, {data}) async {
    Response response;
    if (!internetController.isInternetConnected.value) {
      NoInternetConnectionModal();
      return response;
    }
    try {
      response = await _dio.post(url, data: data);
    } on DioError catch (e) {
      print(e.message);
      throw Exception(e.message);
    }
    return response;
  }

  @override
  Future<Response> patch(String url,
      {data, Map<String, dynamic> queryParams}) async {
    Response response;
    if (!internetController.isInternetConnected.value) {
      NoInternetConnectionModal();
      return response;
    }
    try {
      response =
          await _dio.patch(url, data: data, queryParameters: queryParams);
    } on DioError catch (e) {
      print(e.message);
      throw Exception(e.message);
    }
    return response;
  }

  @override
  Future<Response> delete(String url,
      {data, Map<String, dynamic> queryParams}) async {
    Response response;
    if (!internetController.isInternetConnected.value) {
      NoInternetConnectionModal();
      return response;
    }
    try {
      response =
          await _dio.delete(url, data: data, queryParameters: queryParams);
    } on DioError catch (e) {
      print(e.message);
      throw Exception(e.message);
    }
    return response;
  }
}
