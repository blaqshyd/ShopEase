import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shop_ease/common/app_constants.dart';
import 'package:shop_ease/core/interceptors.dart';

final apiProvider = Provider<Api>((ref) => Api());

/// This service handles network request using dio
class Api {
  late Dio _dio;

  Api() {
    _dio = Dio(_dioOptions);
    //TODO Include [InterceptorWrapper] or modify [DioInterceptor]
    _dio.interceptors.add(DioInterceptor());
  }

  Dio get dio => _dio;

  BaseOptions get _dioOptions {
    return BaseOptions(
      baseUrl: AppConstant.baseUrl,
      connectTimeout: const Duration(milliseconds: 3000 * 10),
      receiveTimeout: const Duration(milliseconds: 3000 * 10),
      contentType: 'application/json',
      // receiveDataWhenStatusError: true,
      // followRedirects: true,
      // persistentConnection: true,
      // responseType: ResponseType.json,
      // validateStatus: (status) => true,
      // headers: {
      //   'Content-Type': 'application/json',
      //   'lang': 'en',
      // },
    );
  }

  Future<Response> testReq() async {
    try {
      Response response = await _dio.get('${_dioOptions.baseUrl}http/200');
      log('Initial Network Request Successful: ${response.data}');
      log('${_dioOptions.baseUrl}http/200');
      return response;
    } catch (error, stacktrace) {
      log('Error making initial network request: $error\n$stacktrace');
      throw Exception('Failed to load initial data');
    }
  }

  /// This service handles the [GET] request
  Future<Response> getReq({
    required String path,
    Map<String, dynamic>? queryParams,
    String? token,
    String? lang,
    Options? options,
    bool useBaseUrl = true,
  }) async {
    Uri uri = Uri.parse('${_dioOptions.baseUrl}$path');
    if (!useBaseUrl) {
      uri = Uri.parse(path);
    }
    // Add query parameters to the URI
    if (queryParams != null) {
      uri = uri.replace(queryParameters: queryParams);
    }

    return await dio.getUri(
      uri,
      options: Options(
        headers: {'Authorization': 'Bearer $token'},
      ),
    );
  }

  /// This service handles the [POST] request
  Future<Response> postReq({
    Map<String, dynamic>? queryParams,
    Map<String, dynamic>? data,
    required String path,
    String? token,
    Options? options,
    bool useBaseUrl = true,
  }) async {
    dio.interceptors.add(DioInterceptor());

    Uri uri = Uri.parse('${_dioOptions.baseUrl}$path');

    if (!useBaseUrl) {
      uri = Uri.parse(path);
    }
    // Add query parameters to the URI
    if (queryParams != null) {
      uri = uri.replace(queryParameters: queryParams);
    }

    return await _dio.postUri(
      uri,
      data: data,
      options: Options(headers: {'Authorization': 'Bearer $token'}),
    );
  }

  /// This service handles the [PUT/PATCH] request
  Future<Response> updateReq({
    required Map<String, dynamic> data,
    required String path,
    Map<String, dynamic>? queryParams,
    bool useBaseUrl = true,
    String? token,
  }) async {
    Uri uri = Uri.parse('${_dioOptions.baseUrl}$path');

    if (!useBaseUrl) {
      uri = Uri.parse(path);
    }
    // Add query parameters to the URI
    if (queryParams != null) {
      uri = uri.replace(queryParameters: queryParams);
    }
    return await dio.putUri(
      uri,
      data: data,
      options: Options(headers: {'Authorization': 'Bearer $token'}),
    );
  }

  /// This service handles the [DELETE] request
  Future<Response> deleteReq({
    required String path,
    Map<String, dynamic>? queryParams,
    String? token,
    bool useBaseUrl = true,
  }) async {
    Uri uri = Uri.parse('${_dioOptions.baseUrl}$path');

    if (!useBaseUrl) {
      uri = Uri.parse(path);
    }
    // Add query parameters to the URI
    if (queryParams != null) {
      uri = uri.replace(queryParameters: queryParams);
    }
    return await dio.delete(
      uri.toString(),
      options: Options(headers: {'Authorization': 'Bearer $token'}),
    );
  }
}
