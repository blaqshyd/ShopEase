// import 'package:dio/dio.dart';
// import 'package:shop_ease/common/common.dart';
// import 'package:shop_ease/core/interceptors.dart';

// class DioHelper {
//   final _dio = Dio();

//   Future<Response> getReqHandler({
//     required String path,
//     Map<String, dynamic>? query,
//     String? token,
//     String? lang,
//     Options? options,
//   }) async {
//     _dio.options.headers = {
//       'lang': 'en',
//       'Authorization': token ?? '',
//       'Content-Type': 'application/json',
//     };

//     return await _dio.get(
//       path,
//       queryParameters: query,
//       options: options,
//     );
//   }

//   Future<Response> postReqHandler({
//     Map<String, dynamic>? query,
//     Map<String, dynamic>? data,
//     required String path,
//     String? token,
//     Options? options,
//     bool useBaseUrl = true,
//   }) async {
//     _dio.options.headers = {
//       'lang': 'en',
//       'Authorization': token ?? '',
//       'Content-Type': 'application/json',
//     };

//     _dio.interceptors.add(DioInterceptor());

//     // return await _dio.post(
//     //   path,
//     //   queryParameters: query,
//     //   data: data,
//     // );

//     ///* This one uses the Uri
//     Uri uri = Uri.parse('${AppConstant.baseUrl}$path');
//     if (!useBaseUrl) {
//       uri = Uri.parse(path);
//     }

//     return await _dio.postUri(
//       options: options,
//       uri,
//       data: data,
//     );
//   }

//   Future<Response> updateReqHandler({
//     required String path,
//     Map<String, dynamic>? query,
//     required Map<String, dynamic> data,
//     String? token,
//   }) async {
//     _dio.options.headers = {
//       'lang': 'en',
//       'Authorization': token ?? '',
//       'Content-Type': 'application/json',
//     };

//     return await _dio.put(
//       path,
//       queryParameters: query,
//       data: data,
//     );
//   }

//   Future<Response> deleteReqHandler({
//     required String path,
//     Map<String, dynamic>? query,
//     String? token,
//   }) async {
//     _dio.options.headers = {
//       'lang': 'en',
//       'Authorization': token ?? '',
//       'Content-Type': 'application/json',
//     };

//     return await _dio.delete(path);
//   }
// }



//   // static void init() {
//   //   dio = Dio(
//   //     BaseOptions(
//   //       baseUrl: AppAssets.baseUrl,
//   //       receiveDataWhenStatusError: true,
//   //     ),
//   //   );
//   // connectTimeout: 30 * 1000,
//   // receiveTimeout: 30 * 1000,

//   // dio.interceptors.add(LogInterceptor(
//   //     request: true,
//   //     requestBody: true,
//   //     responseBody: true,
//   //     error: true,
//   //     requestHeader: false,
//   //     responseHeader: false,
//   //     ));
//   // }